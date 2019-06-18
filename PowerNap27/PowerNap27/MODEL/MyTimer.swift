//
//  MyTimer.swift
//  PowerNap27
//
//  Created by Austin West on 6/18/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation

protocol MyTimerDelegate: class {
    func timerStopped()
    func timerStarted()
    func timerSecondTicked()
}

// Wrapper
class MyTimer: NSObject {
    
    // How many seconds are remaining on our nap? Hopefully a lot XD
    var timeRemaining: TimeInterval?
    
    // The timer object, we are hiding behind our wrappet (MyTimer)
    var timer: Timer?
    
    weak var delegate: MyTimerDelegate?
    
    var isOn: Bool = false
    
    private func secondTicked() {
        guard let timeRemaining = timeRemaining else { return }
        if timeRemaining > 0 {
            self.timeRemaining = timeRemaining - 1
            print(timeRemaining)
        } else {
            timer?.invalidate()
            self.timeRemaining = nil
        }
    }
    
    func startTimer(_ time: TimeInterval) {
        if isOn == false {
            isOn = true
            self.timeRemaining = time
            
            self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (_) in
                self.secondTicked()
            })
        }
    }
    
    func stopTimer() {
        if isOn {
            self.timeRemaining = nil
            isOn = false
        }
    }
}
