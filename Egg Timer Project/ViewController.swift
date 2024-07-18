//
//  ViewController.swift
//  Egg Timer Project
//
//  Created by Rajeev Sharma on 2024-07-15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes : [String: Int] = ["Soft": 3, "Medium": 420, "Hard": 720]
    
    var secondsRemaining = 60
    
    var timer = Timer()
    
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        //using if/else
//        if hardness == "Soft" {
//            print(softTime)
//        } else if hardness == "Medium" {
//            print(mediumTime)
//        } else {
//            print(hardTime)
//        }
        
        //using swutch case
//        switch hardness {
//        case "Soft":
//            print(eggTimes[hardness])
//        case "Medium":
//            print(eggTimes[hardness])
//        case "Hard":
//            print(eggTimes[hardness])
//        default:
//            print("Error")
//        }
        
        //using optional binding to get the time which will decrease each second depending on the hardness level
        secondsRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            titleLabel.text = "DONE !... 😉 "
        }
    }
}

