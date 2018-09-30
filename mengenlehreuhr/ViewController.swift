//
//  ViewController.swift
//  mengenlehreuhr
//
//  Created by Constantin Koehler on 9/29/18.
//  Copyright © 2018 Constantin Koehler. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var secondsCircleContainer: UIView!
    @IBOutlet weak var fiveHourStackView: UIStackView!
    @IBOutlet weak var oneHourStackView: UIStackView!
    @IBOutlet weak var fiveMinuteStackView: UIStackView!
    @IBOutlet weak var oneMinuteStackView: UIStackView!
    
    @IBOutlet weak var fiveHourContainer: UIView!
    @IBOutlet weak var oneHourContainer: UIView!
    @IBOutlet weak var fiveMinuteContainer: UIView!
    @IBOutlet weak var oneMinuteContainer: UIView!
    
    @IBOutlet weak var clock: Clock!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.setClock), userInfo: nil, repeats: true)
    }
    
    @objc func setClock() {
        clock.setLightsForTime(date: Date())
        clock.setNeedsDisplay()
    }
}

