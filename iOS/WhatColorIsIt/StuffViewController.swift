//
//  StuffViewController.swift
//  WhatColorIsIt
//
//  Created by Kyle Frost on 12/20/14.
//  Copyright (c) 2014 Kyle Frost. All rights reserved.
//

import UIKit

class StuffViewController: UITableViewController {
    
    @IBOutlet var followCell: UITableViewCell!
    @IBOutlet var teamCell: UITableViewCell!
    @IBOutlet var websiteCell: UITableViewCell!
    @IBOutlet var typeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let clipboardPref: Int = NSUserDefaults.standardUserDefaults().integerForKey("clipboardPref")
        
        switch clipboardPref {
        case 0:
            typeLabel.text = "HEX Value"
        case 1:
            typeLabel.text = "RGB Value"
        case 2:
            typeLabel.text = "UIColor (Objective-C)"
        case 3:
            typeLabel.text = "UIColor (Swift)"
        default:
            typeLabel.text = "HEX Value"
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        let clipboardPref: Int = NSUserDefaults.standardUserDefaults().integerForKey("clipboardPref")
        
        switch clipboardPref {
        case 0:
            typeLabel.text = "HEX Value"
        case 1:
            typeLabel.text = "RGB Value"
        case 2:
            typeLabel.text = "UIColor (Obj-C)"
        case 3:
            typeLabel.text = "UIColor (Swift)"
        default:
            typeLabel.text = "HEX Value"
        }
    }
    
    @IBAction func clickDone() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var tweetbot = UIApplication.sharedApplication().canOpenURL(NSURL(string: "tweetbot://")!)
        var twitterrific = UIApplication.sharedApplication().canOpenURL(NSURL(string: "twitter://")!)
        var twitter = UIApplication.sharedApplication().canOpenURL(NSURL(string: "twitterrific://")!)
        
        if indexPath == tableView.indexPathForCell(followCell) {
            if tweetbot {
                UIApplication.sharedApplication().openURL(NSURL(string: "tweetbot:///user_profile/_kylefrost")!)
            }
                
            else if twitterrific {
                UIApplication.sharedApplication().openURL(NSURL(string: "twitterrific:///profile?screen_name=_kylefrost")!)
            }
                
            else if twitter {
                UIApplication.sharedApplication().openURL(NSURL(string: "twitter:///user?screen_name=_kylefrost")!)
            }
                
            else {
                UIApplication.sharedApplication().openURL(NSURL(string: "https://www.twitter.com/_kylefrost")!)
            }
        }
        
        if indexPath == tableView.indexPathForCell(teamCell) {
            if tweetbot {
                UIApplication.sharedApplication().openURL(NSURL(string: "tweetbot:///user_profile/kylefrostdesign")!)
            }
                
            else if twitterrific {
                UIApplication.sharedApplication().openURL(NSURL(string: "twitterrific:///profile?screen_name=kylefrostdesign")!)
            }
                
            else if twitter {
                UIApplication.sharedApplication().openURL(NSURL(string: "twitter:///user?screen_name=kylefrostdesign")!)
            }
                
            else {
                UIApplication.sharedApplication().openURL(NSURL(string: "https://www.twitter.com/kylefrostdesign")!)
            }
        }
        
        if indexPath == tableView.indexPathForCell(websiteCell) {
            UIApplication.sharedApplication().openURL(NSURL(string: "https://www.kylefrostdesign.com")!)
        }
    }
}

class ClipboardViewController: UITableViewController {
    
    @IBOutlet var hexCell: UITableViewCell!
    @IBOutlet var rgbCell: UITableViewCell!
    @IBOutlet var objcCell: UITableViewCell!
    @IBOutlet var swiftCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let clipboardPref: Int = NSUserDefaults.standardUserDefaults().integerForKey("clipboardPref")
        
        switch clipboardPref {
        case 0:
            hexCell.accessoryType = .Checkmark
        case 1:
            rgbCell.accessoryType = .Checkmark
        case 2:
            objcCell.accessoryType = .Checkmark
        case 3:
            swiftCell.accessoryType = .Checkmark
        default:
            hexCell.accessoryType = .Checkmark
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println(indexPath.row)
        
        var cell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell!
        
        let checkedIndex = indexPath.row
        
        NSUserDefaults.standardUserDefaults().setInteger(indexPath.row, forKey: "clipboardPref")
        
        if cell.accessoryType == .None {
            cell.accessoryType = .Checkmark
        }
        
        if checkedIndex != 0 {
            hexCell.accessoryType = .None
        }
        
        if checkedIndex != 1 {
            rgbCell.accessoryType = .None
        }
        
        if checkedIndex != 2 {
            objcCell.accessoryType = .None
        }
        
        if checkedIndex != 3 {
            swiftCell.accessoryType = .None
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        //navigationController?.popViewControllerAnimated(true)
    }
}
