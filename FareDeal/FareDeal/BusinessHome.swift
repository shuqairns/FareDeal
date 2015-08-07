//
//  ViewController.swift
//  FareDeal
//
//  Created by Nazir Shuqair on 7/15/15.
//  Copyright (c) 2015 SNASTek. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class BusinessHome: UIViewController {
    
    @IBOutlet weak var creditBalanceLabel: UILabel!
    @IBOutlet weak var dealsSelectedLabel: UILabel!
    @IBOutlet weak var dealsSwapedLabel: UILabel!
    @IBOutlet weak var monthsBtn: UIButton!
    
    @IBOutlet weak var profileImgView: UIImageView!
    
    
    // holds all the months to display in selector
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.

//        let titleFont:UIFont = UIFont(name: "Middlecase Regular-Inline.otf", size: 20)!
//        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: titleFont]
        

        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barStyle = .Black
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 249/255, green: 99/255, blue: 50/255, alpha: 1)
        
        let image = UIImage(named: "navBarLogo")
        navigationItem.titleView = UIImageView(image: image)
        
        
        let date = NSDate();
        var formatter = NSDateFormatter();
        formatter.dateFormat = "MMMM";
        let defaultTimeZoneStr = formatter.stringFromDate(date);
        monthsBtn.setTitle(defaultTimeZoneStr, forState: UIControlState.Normal)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        profileImgView.layer.masksToBounds = false
        profileImgView.layer.borderColor = UIColor.blackColor().CGColor
        profileImgView.layer.cornerRadius = profileImgView.frame.height/2
        profileImgView.clipsToBounds = true
    }
    
    override func viewDidAppear(animated: Bool) {
        

        let creditsAvailable:Int = prefs.integerForKey("credits") as Int
        
        if creditsAvailable > 0 {
            creditBalanceLabel.text = "\(creditsAvailable)C"
        }else{
            creditBalanceLabel.text = "No Credits"
        }
    }
    
    @IBAction func onClick(_sender : UIButton?){
        
        if _sender?.tag == 1{
            
            
        }else if _sender?.tag == 2{
            
            // View deals here
            
            println("add")
            
        }else if _sender?.tag == 3{
            
            // Edit profile here
            println("add")
            
        }
    }
    
    
    @IBAction func pickerSelected(sender: AnyObject) {
        
        if sender.tag == 0 {
            ActionSheetStringPicker.showPickerWithTitle("Month", rows: months as [AnyObject], initialSelection: 1, doneBlock: {
                picker, value, index in
                
                self.monthsBtn.setTitle("\(index)", forState: UIControlState.Normal)
                
                println("value = \(value)")
                println("index = \(index)")
                println("picker = \(picker)")
                return
                }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender)
            
        }
        
    }

    
    func updateAnalytics(){
        
        //Update numbers here
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toProfile") {
            var svc = segue.destinationViewController as! RegisterRestaurantVC2;
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

