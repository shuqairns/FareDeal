//
//  File.swift
//  FareDeal
//
//  Created by Nazir Shuqair on 8/7/15.
//  Copyright (c) 2015 SNASTek. All rights reserved.
//

import UIKit
import SwiftyJSON

public class APICalls{
    
    
    class func getMyRestaurant(token: NSString) ->(Bool){
        
        if Reachability.isConnectedToNetwork(){
            
            
            var url:NSURL = NSURL(string: "http://ec2-52-2-195-214.compute-1.amazonaws.com/api/Venue/MyVenue")!
            
            var request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "GET"
            request.timeoutInterval = 60
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            var reponseError: NSError?
            var response: NSURLResponse?
            
            var urlData: NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse:&response, error:&reponseError)
            
            if ( urlData != nil ) {
                let res = response as! NSHTTPURLResponse!;
                
                NSLog("Response code: %ld", res.statusCode);
                
                if (res.statusCode >= 200 && res.statusCode < 300){
                    
                    var responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
                    
                    var error: NSError?
                    
                    let json = JSON(data: urlData!)
                    
                    if(json["Id"] != nil){
                        
                        debugPrint("Data Recieved")
                        var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
                        prefs.setObject(json["Id"].string, forKey: "restID")
                        prefs.synchronize()
                        DataSaving.saveRestaurantProfile(json)
                        return true
                        
                    } else {
                        var error_msg:NSString
                        if json["error_message"] != nil {
                            error_msg = json["error_message"].string!
                            debugPrint("error response")
                        } else {
                            error_msg = "Unknown Error"
                            debugPrint("Unknown Error")
                        }
                        
                        var alertView:UIAlertView = UIAlertView()
                        alertView.title = "Sign in Failed!"
                        alertView.message = error_msg as String
                        alertView.delegate = self
                        alertView.addButtonWithTitle("OK")
                        alertView.show()
//
                    }
                    
                }
            }else {
                var alertView:UIAlertView = UIAlertView()
                alertView.title = "Sign in Failed!"
                alertView.message = "Connection Failure"
                if let error = reponseError {
                    alertView.message = (error.localizedDescription)
                }
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
            }
            
        }else{
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "No network"
            alertView.message = "Please make sure you are connected then try again"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
        
        
        
        return false
    }
    
}