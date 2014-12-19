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
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: date)
        let currentTime = NSString(format:"%02d : %02d : %02d", components.hour, components.minute, components.second) as String
        let currentColor = NSString(format:"#%02d%02d%02d", components.hour, components.minute, components.second) as String
        clockLabel.text = currentTime
        colorLabel.text = currentColor
        view.backgroundColor = UIColor(rgba: currentColor)
    }
    
    func copyColor() {
        println("copyColor()")
        let color = colorLabel.text
        UIPasteboard.generalPasteboard().string = color
    }
    
    func gestureRecognizer(UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWithGestureRecognizer:UIGestureRecognizer) -> Bool {
            return true
    }
}

