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
        displaySnoozeAlertController()
        
    }
    
    func timerSecondTicked() {
        updateLabel()
    }
}

extension TimerViewController {
    func displaySnoozeAlertController() {
      let alertController = UIAlertController(title: "Time to wake up!", message: "Get up lazy!", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Snooze for how manuy minutes?"
            textField.keyboardType = .numberPad
        }
        
        let snoozeAction = UIAlertAction(title: "Snooze", style: .default) {
            (_) in
            guard let timeText = alertController.textFields?.first?.text,
                let time = TimeInterval(timeText) else { return }
            
            self.timer.startTimer(time * 60)
            self.updateLabel()
            self.updateButton()
        }
        
        alertController.addAction(snoozeAction)
        
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
