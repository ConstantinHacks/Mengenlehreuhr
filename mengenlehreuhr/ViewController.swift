//
//  ViewController.swift
//  mengenlehreuhr
//
//  Created by Constantin Koehler on 9/29/18.
//  Copyright © 2018 Constantin Koehler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var secondsLight: LightView!
    @IBOutlet weak var fiveHourStackView: UIStackView!
    @IBOutlet weak var oneHourStackView: UIStackView!
    @IBOutlet weak var fiveMinuteStackView: UIStackView!
    @IBOutlet weak var oneMinuteStackView: UIStackView!
    
    @IBOutlet weak var fiveHourContainer: UIView!
    @IBOutlet weak var oneHourContainer: UIView!
    @IBOutlet weak var fiveMinuteContainer: UIView!
    @IBOutlet weak var oneMinuteContainer: UIView!
    
    let CORNERRADIUS = CGFloat(12)
    let clock = Clock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSecondsLight()
        roundStackViews()
        fillStackViews()
    }

    func setUpSecondsLight() {
        secondsLight.backgroundColor = UIColor.yellow
        secondsLight.layer.cornerRadius = secondsLight.bounds.size.width/2.0
        secondsLight.clipsToBounds = true
        secondsLight.layer.borderWidth = 6
        secondsLight.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func roundStackViews() {
        fiveHourContainer.roundCorners(corners: [.topLeft,.topRight,.bottomRight,.bottomLeft], radius: CORNERRADIUS)
        oneHourContainer.roundCorners(corners: [.topLeft,.topRight,.bottomRight,.bottomLeft], radius: CORNERRADIUS)
        fiveMinuteContainer.roundCorners(corners: [.topLeft,.topRight,.bottomRight,.bottomLeft], radius: CORNERRADIUS)
        oneMinuteContainer.roundCorners(corners: [.topLeft,.topRight,.bottomRight,.bottomLeft], radius: CORNERRADIUS)
    }
    
    func fillStackViews(){
        for num in 0..<Clock.LIGHTCOUNT {
            if num == 0 {
                clock.fiveHourLights[num].roundCorners(corners: [.topLeft,.bottomLeft], radius: CORNERRADIUS)
                clock.oneHourLights[num].roundCorners(corners: [.topLeft,.bottomLeft], radius: CORNERRADIUS)
                clock.oneMinuteLights[num].roundCorners(corners: [.topLeft,.bottomLeft], radius: CORNERRADIUS)
            } else if num == Clock.LIGHTCOUNT-1 {
                clock.fiveHourLights[num].roundCorners(corners: [.topRight,.bottomRight], radius: CORNERRADIUS)
                clock.oneHourLights[num].roundCorners(corners: [.topRight,.bottomRight], radius: CORNERRADIUS)
                clock.oneMinuteLights[num].roundCorners(corners: [.topRight,.bottomRight], radius: CORNERRADIUS)
            }
            fiveHourStackView.addArrangedSubview(clock.fiveHourLights[num])
            oneHourStackView.addArrangedSubview(clock.oneHourLights[num])
            oneMinuteStackView.addArrangedSubview(clock.oneMinuteLights[num])
        }
        
        for num in 0..<Clock.FIVEMINLIGHTCOUNT {
            if num == 0 {
                clock.fiveMinuteLights[num].roundCorners(corners: [.topLeft,.bottomLeft], radius: CORNERRADIUS)
            } else if num == Clock.FIVEMINLIGHTCOUNT-1 {
                clock.fiveMinuteLights[num].roundCorners(corners: [.topRight,.bottomRight], radius: CORNERRADIUS)
            }
            fiveMinuteStackView.addArrangedSubview(clock.fiveMinuteLights[num])
        }
    }
    
}

