//
//  TimerViewController.swift
//  PowerNap27
//
//  Created by Austin West on 6/18/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var napButton: UIButton!
    
    let timer = MyTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Dont forget!!
        timer.delegate = self
    }
    
    @IBAction func napButtonTapped(_ sender: Any) {
        if timer.isOn {
            timer.stopTimer()
        } else {
            timer.startTimer(5)
        }
        updateLabel()
        updateButton()
    }
    
    func updateLabel() {
        if timer.isOn {
            timerLabel.text = "\(timer.timeRemaining)"
        } else {
            timerLabel.text = "20:00"
        }
    }
    
    func updateButton() {
        if timer.isOn {
            napButton.setTitle("Cancel Nap", for: .normal)
        } else {
            napButton.setTitle("Start Nap", for: .normal)
        }
    }
}

extension TimerViewController : MyTimerDelegate {
    func timerStopped() {
        updateButton()
        updateLabel()
    }
    
    func timerCompleted() {
        updateLabel()
        updateButton()
        // Call the display alert controller function
        
    }
    
    func timerSecondTicked() {
        updateLabel()
    }
}

extension TimerViewController {
    func displaySnoozeAlertController() {
        
    }
}
