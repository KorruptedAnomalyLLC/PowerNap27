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
    }
    
    func updateLabel() {
        
    }
    
    func updateButton() {
        
    }
    
    func startTimer() {
        
    }
    
    func stopTImer() {
        
    }
    
    func setTimer() {
        
    }
    
}

extension TimerViewController : MyTimerDelegate {
    func timerStopped() {
        <#code#>
    }
    
    func timerStarted() {
        <#code#>
    }
    
    func timerSecondTicked() {
        <#code#>
    }
}
