//
//  ViewController.swift
//  mengenlehreuhr
//
//  Created by Constantin Koehler on 9/29/18.
//  Copyright © 2018 Constantin Koehler. All rights reserved.
//

import Foundation
import UIKit



class ViewController: UIViewController, UIScrollViewDelegate {
    fileprivate let clock = Clock()
    var currentTimeTimer = Timer()
    
    @IBAction func showInfoButtonPressed(_ sender: Any) {
        showWebviewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.red
        navigationController?.navigationBar.tintColor = UIColor.white

        currentTimeTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.setClockCurrentTime), userInfo: nil, repeats: true)
    }
    
    @objc func setClockCurrentTime() {
        clock.setLightsForTime(date: Date())
    }
    
    func showWebviewController() {
        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        self.navigationController!.pushViewController(VC1, animated: true)
    }
    
    
}

