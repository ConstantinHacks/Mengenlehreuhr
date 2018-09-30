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
        
    @IBOutlet weak var clock: Clock!
    
    var currentTimeTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentTimeTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.setClockCurrentTime), userInfo: nil, repeats: true)
    }
    
    @objc func setClockCurrentTime() {
        clock.setLightsForTime(date: Date())
    }
    
}

