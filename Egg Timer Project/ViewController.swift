//
//  ViewController.swift
//  Egg Timer Project
//
//  Created by Rajeev Sharma on 2024-07-15.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes : [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle
        
//        if hardness == "Soft" {
//            print(softTime)
//        } else if hardness == "Medium" {
//            print(mediumTime)
//        } else {
//            print(hardTime)
//        }
        
        switch hardness {
        case "Soft":
            print(eggTimes["Soft"])
        case "Medium":
            print(eggTimes["Medium"])
        case "Hard":
            print(eggTimes["Hard"])
        default:
            print("Error")
        }
    }
}

