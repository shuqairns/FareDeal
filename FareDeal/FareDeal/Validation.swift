//
//  Validation.swift
//  FareDeal
//
//  Created by Nazir Shuqair on 8/2/15.
//  Copyright (c) 2015 SNASTek. All rights reserved.
//

import Foundation

public class Validation{
    
    func validateInput(input: String, check: Int, title: String, message: String) -> Bool{
        
        if count(input) > check {
            return true
        }else{
            displayAlert(title, message: message)
            return false
        }
        
    }
    
    func validateAddress(street: String, city: String, zipcode: String) -> (formattedString: String, valid: Bool){
        
        if count(street) > 6 {
            
            if count(city) > 2{
                
                if count(zipcode) == 5 {
                    return ("\(street), \(city), \(zipcode)", true)
                }else{
                    displayAlert("Invalid zipcode", message: "Please enter a valid zipcode ")
                    return ("invalid", false)
                }
                
            }else{
                displayAlert("Too Short", message: "Please enter a valid city ")
                return ("invalid", false)
            }
            
        }else {
            displayAlert("Too Short", message: "Please enter a valid street address")
            return ("invalid", false)
        }
        
    }
    
    func validateEmail(candidate: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        if NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluateWithObject(candidate){
            return true
        }else {
            displayAlert("Invalid Email ", message: "Please enter a valid email")
            return false
        }
        
    }
    
    func validatePassword(pass: String, cpass: String) -> Bool{
        
        if count(pass) > 5 {
            
            if pass == cpass{
                return true
            }else{
                displayAlert("Password Error", message: "Password does not match")
                return false
            }
            
        }else{
            displayAlert("Password Error", message: "Password needs to be at least 6 characters")
            return false
        }
        
    }
    
    func displayAlert(title: String, message: String){
        var alertView:UIAlertView = UIAlertView()
        alertView.title = title
        alertView.message = message
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
    }
    
}