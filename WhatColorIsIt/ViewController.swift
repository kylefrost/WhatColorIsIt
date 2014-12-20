//
//  ViewController.swift
//  WhatColorIsIt
//
//  Created by Kyle Frost on 12/19/14.
//  Copyright (c) 2014 Kyle Frost. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet var clockLabel: UILabel!
    @IBOutlet var colorLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Add Gesture Recognizer for Taps
        let recognizer = UITapGestureRecognizer(target: self, action:"copyColor")
        recognizer.delegate = self
        view.addGestureRecognizer(recognizer)
        
        // Set Clock Label Attrs
        clockLabel.textColor = UIColor.whiteColor()
        clockLabel.font = UIFont(name: "OpenSans-Light", size: 80.0)
        
        // Set Color Label Attrs
        colorLabel.textColor = UIColor.whiteColor()
        colorLabel.font = UIFont(name: "OpenSans-Light", size: 20.0)
        
        // Start Clock & Add Timer
        runClock()
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "runClock", userInfo: nil, repeats: true)
    }
    
    func runClock() {
        // Get Date Components
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: date)
        
        // Set Strings
        let currentTime = NSString(format:"%02d : %02d : %02d", components.hour, components.minute, components.second) as String
        let currentColor = NSString(format:"#%02d%02d%02d", components.hour, components.minute, components.second) as String
        
        // Set Clock and Value to Strings
        clockLabel.text = currentTime
        colorLabel.text = currentColor
        view.backgroundColor = UIColor(rgba: currentColor)
    }
    
    func copyColor() {
        flashWhite()
        
        var textToCopy = String()
        
        let clipboardPref: Int = NSUserDefaults.standardUserDefaults().integerForKey("clipboardPref")
        
        let currentColor = UIColor(rgba: colorLabel.text!).CGColor
        let colorString = CIColor(CGColor: currentColor).stringRepresentation()
        let colorParts = colorString.componentsSeparatedByString(" ")
        
        let hexColorString = colorLabel.text!
        let objcColorString = "[UIColor colorWithRed:\(colorParts[0]) green:\(colorParts[1]) blue:\(colorParts[2]) alpha:\(colorParts[3])];"
        let swiftColorString = "UIColor(red: \(colorParts[0]), green: \(colorParts[1]), blue: \(colorParts[2]), alpha: \(colorParts[3))"
        
        // Calculate RGB Color
        var redColor = colorParts[0].floatValue
        var greenColor = colorParts[1].floatValue
        var blueColor = colorParts[2].floatValue
        
        redColor = round(redColor * 255)
        greenColor = round(greenColor * 255)
        blueColor = round(blueColor * 255)
        
        let rgbColorSring = "R: \(redColor) G: \(greenColor) B: \(blueColor)"
        
        switch clipboardPref {
        case 0:
            textToCopy = hexColorString
        case 1:
            textToCopy = rgbColorSring
        case 2:
            textToCopy = objcColorString
        case 3:
            textToCopy = swiftColorString
        default:
            textToCopy = hexColorString
        }
        
        println(textToCopy)
        UIPasteboard.generalPasteboard().string = textToCopy
    }
    
    let whiteView = UIView()
    
    func flashWhite() {
        whiteView.frame = view.frame
        whiteView.backgroundColor = UIColor.whiteColor()
        
        view.addSubview(whiteView)
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "removeFlash", userInfo: nil, repeats: false)
    }
    
    func removeFlash() {
        whiteView.removeFromSuperview()
    }
    
    func gestureRecognizer(UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer:UIGestureRecognizer) -> Bool {
            return true
    }
}

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

