//
//  ViewController.swift
//  Egg Timer Project
//
//  Created by Rajeev Sharma on 2024-07-15.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes : [String: Int] = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var timer = Timer()
    
    var totalTime = 0
    var secondsPassed = 0
    
    var player: AVAudioPlayer!
    
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
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed <= totalTime {
            
            let percentageaprogress = Float(secondsPassed) / Float(totalTime)
            
            progressBar.progress = Float(percentageaprogress)
            
            secondsPassed += 1
        } else {
            timer.invalidate()
            titleLabel.text = "DONE !... 😉 "
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

