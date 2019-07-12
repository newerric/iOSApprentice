//
//  ViewController.swift
//  BullsEye
//
//  Created by mikewang on 2019/7/12.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    var currentValue: Int = 0
    var targetValue = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    // MARK: - IBAction
    
    @IBAction func showAlert() {
        var difference: Int = abs(currentValue - targetValue)
        let points = 100 - difference
        score += points
        
        let message = "You scored \(points) points"
                      "\nThe value of the slider is: \(currentValue)" +
                      "\nThe target value is: \(targetValue)" +
                      "\nThe difference is: \(difference)"
        let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func silderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        print("The value of the slider is now: \(slider.value)")
    }
    
    // MARK: - Other Method
    
    private func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    private func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
    }


}

