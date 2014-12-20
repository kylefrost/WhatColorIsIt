//
//  StuffViewController.swift
//  WhatColorIsIt
//
//  Created by Kyle Frost on 12/19/14.
//  Copyright (c) 2014 Kyle Frost. All rights reserved.
//

import UIKit

class StuffViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var followCell: UITableViewCell!
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        var tweetbot: Bool = UIApplication.sharedApplication().canOpenURL(NSURL(string: "tweetbot://")!)
        var twitterrific: Bool = UIApplication.sharedApplication().canOpenURL(NSURL(string: "twitter://")!)
        var twitter: Bool = UIApplication.sharedApplication().canOpenURL(NSURL(string: "twitterrific://")!)
        
        if (indexPath == tableView.indexPathForCell(followCell)) {
            if (tweetbot) {
                UIApplication.sharedApplication().openURL(NSURL(string: "tweetbot:///user_profile/_kylefrost")!)
            }
            
            else if (twitterrific) {
                UIApplication.sharedApplication().openURL(NSURL(string: "twitterrific:///profile?screen_name=_kylefrost")!)
            }
            
            else if (twitter) {
                UIApplication.sharedApplication().openURL(NSURL(string: "twitter:///user?screen_name=_kylefrost")!)
            }
            
            else {
                UIApplication.sharedApplication().openURL(NSURL(string: "https://www.twitter.com/_kylefrost")!)
            }
        }
    }
    
    @IBAction func clickedDone() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
