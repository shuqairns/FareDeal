//
//  RestaurantDealDetaislVC.swift
//  FareDeal
//
//  Created by Angela Smith on 7/22/15.
//  Copyright (c) 2015 SNASTek. All rights reserved.
//

import UIKit
import RealmSwift

class RestaurantDealDetaislVC: UIViewController, TTCounterLabelDelegate {

    
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var dealTitleLabel: UILabel!
    @IBOutlet weak var dealdescriptionLabel: UILabel!
    @IBOutlet weak var dealValueLabel: UILabel!
    @IBOutlet weak var dealTimeRemainingLabel: TTCounterLabel!
    
    
    var thisDeal: VenueDeal?
    let realm = Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpDeal()
        
    }
    
    func setUpDeal(){
        
        if let deal: VenueDeal = thisDeal {
            
            // String Labels
            if var locationLabel = locationName {
                locationLabel.text = deal.venue.name
            }
            
            // Image
            if var imageView = locationImage {
                imageView.contentMode = UIViewContentMode.ScaleAspectFill
                imageView.clipsToBounds = true
                imageView.image = deal.venue.image
            }
            
            if var dealTitle = dealTitleLabel {
                dealTitle.text = deal.name             }
            if var dealDescription = dealdescriptionLabel {
                dealDescription.text = deal.desc            }
            if var dealValue = dealValueLabel {
                let valueFloat:Float = deal.value, valueFormat = ".2"
                dealValue.text = "$\(valueFloat.format(valueFormat))"
            }
            
            // Set up the timer countdown label
            let now = NSDate()
            println("Now: \(now)")
            let expires = deal.expirationDate
             println("Deal Expires: \(expires)")
            let calendar = NSCalendar.currentCalendar()
            let datecomponenets = calendar.components(NSCalendarUnit.CalendarUnitSecond, fromDate: now, toDate: expires, options: nil)
            let seconds = datecomponenets.second * 1000
            println("Seconds: \(seconds) until the deal expires")
            dealTimeRemainingLabel.countDirection = 1
            dealTimeRemainingLabel.startValue = UInt64(seconds)
            dealTimeRemainingLabel.start()
            if seconds <= 0 {
                dealTimeRemainingLabel.stop()
            }
            


        }
        
    }
    
    
    @IBAction func checkForPreviouslySavedDeal(sender: AnyObject) {
        // check if user already has a saved deal
        var savedDeal = realm.objects(SavedDeal).first
        if (savedDeal != nil) {
            println("The user has a saved deal")
            // make sure the deal is not expired
            let valid = checkDealIsValid(savedDeal!)
            if valid {
                 println("The user has a saved deal")
                // display an alert requesting if they want to switch
                let alertController = UIAlertController(title: "Swap Deals?", message: "Would you like to swap \(savedDeal?.name) for \(thisDeal?.name)", preferredStyle: .Alert)
                // Add button action to swap
                let cancelSwap = UIAlertAction(title: "Cancel", style: .Default, handler: {
                    (action) -> Void in
                    self.dismissViewControllerAnimated(true, completion: nil)
                })
                let swapDeals = UIAlertAction(title: "Swap", style: .Default, handler: {
                    (action) -> Void in
                    // Swap deals
                    self.realm.write {
                        self.realm.delete(savedDeal!)
                    }
                    self.dismissViewControllerAnimated(true, completion: nil)
                    self.saveNewDeal()
                })
                alertController.addAction(cancelSwap)
                alertController.addAction(swapDeals)
                presentViewController(alertController, animated: true, completion: nil)
            } else {
                // deleted old deal, save new one
                println("Deleted expired deal and saving new one")
                // save this deal as the saved deal
                saveNewDeal()
            }
        } else {
            println("Setting a new saved deal")
            // save this deal as the saved deal
            saveNewDeal()
        }
        
    }
    
    func checkDealIsValid (savedDeal: SavedDeal) -> Bool {
        // we need to check the date
        let expiresTime = savedDeal.expirationDate
        // see how much time has lapsed
        var compareDates: NSComparisonResult = NSDate().compare(expiresTime)
        if compareDates == NSComparisonResult.OrderedAscending {
            // the deal has not expired yet
            println("This deal is still good")
            return true
        } else {
            //the deal has expired
            println("This deal has expired, deleting it")
            realm.write {
                self.realm.delete(savedDeal)
            }
            return false
        }
    }
    
    func saveNewDeal () {
        if let deal: VenueDeal = thisDeal {
            let newDeal = SavedDeal()
            newDeal.name = deal.name
            newDeal.desc = deal.desc
            newDeal.tier = deal.tier
            newDeal.timeLimit = deal.timeLimit
            newDeal.expirationDate = deal.expirationDate
            newDeal.value = deal.value
            newDeal.venue = deal.venue
            var venueId = "\(newDeal.venue.identifier).\(newDeal.tier)"
            newDeal.id = venueId
            realm.write {
                self.realm.create(SavedDeal.self, value: newDeal, update: true)
            }
            
        }

    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        // Hide the navigation bar to display the full location image
        let navBar:UINavigationBar! =  self.navigationController?.navigationBar
        navBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navBar.shadowImage = UIImage()
        navBar.backgroundColor = UIColor.clearColor()
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        // restore the navigation bar to origional
        let navBar:UINavigationBar! =  self.navigationController?.navigationBar
        navBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
        navBar.shadowImage = nil
    }
}
