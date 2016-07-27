//
//  ViewController.swift
//  Reverse Timer
//
//  Created by Matthew Menefee on 7/27/16.
//  Copyright © 2016 SmartLogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var counter:Int? = 0
    var timer = NSTimer()
    
    @IBOutlet weak var timeInput: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var labelOutput: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        timeInput.delegate = self
        timeInput.addTarget(self, action: #selector(self.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonWasPressed(sender: AnyObject) {
        counter = Int(timeInput.text!)!
        timer.invalidate() // just in case this button is tapped multiple times
        
        // start the timer
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    func textFieldDidChange(textField: UITextField) {
        //let hours = Int(time) / 3600
        //let minutes = Int(time) / 60 % 60
        //let seconds = Int(time) % 60
        //return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    // called every time interval from the timer
    func timerAction() {
        counter = counter! - 1
        labelOutput.text = "\(counter!)"
    }
}

