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
    
    let LIGHTCOUNT = 4
    let FIVEMINLIGHTCOUNT = 11
    let CORNERRADIUS = CGFloat(12)
    
    var fiveHourLights = [LightView]()
    var oneHourLights = [LightView]()
    var fiveMinuteLights = [LightView]()
    var oneMinuteLights = [LightView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSecondsLight()
        roundStackViews()
        fillArrays()
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
    
    func fillArrays() {
        for _ in 0..<LIGHTCOUNT {
            fiveHourLights.append(makeLightView(color: UIColor.red))
            oneHourLights.append(makeLightView(color: UIColor.red))
            oneMinuteLights.append(makeLightView(color: UIColor.yellow))
        }
        
        for num in 1...FIVEMINLIGHTCOUNT {
            if num != 0 && num % 3 == 0 {
                fiveMinuteLights.append(makeLightView(color: UIColor.yellow))
            } else {
                fiveMinuteLights.append(makeLightView(color: UIColor.red))
            }
        }
    }
    
    func fillStackViews(){
        for num in 0..<LIGHTCOUNT {
            if num == 0 {
                fiveHourLights[num].roundCorners(corners: [.topLeft,.bottomLeft], radius: CORNERRADIUS)
                oneHourLights[num].roundCorners(corners: [.topLeft,.bottomLeft], radius: CORNERRADIUS)
                oneMinuteLights[num].roundCorners(corners: [.topLeft,.bottomLeft], radius: CORNERRADIUS)
            } else if num == LIGHTCOUNT-1 {
                fiveHourLights[num].roundCorners(corners: [.topRight,.bottomRight], radius: CORNERRADIUS)
                oneHourLights[num].roundCorners(corners: [.topRight,.bottomRight], radius: CORNERRADIUS)
                oneMinuteLights[num].roundCorners(corners: [.topRight,.bottomRight], radius: CORNERRADIUS)
            }
            fiveHourStackView.addArrangedSubview(fiveHourLights[num])
            oneHourStackView.addArrangedSubview(oneHourLights[num])
            oneMinuteStackView.addArrangedSubview(oneMinuteLights[num])
        }
        
        for num in 0..<FIVEMINLIGHTCOUNT {
            if num == 0 {
                fiveMinuteLights[num].roundCorners(corners: [.topLeft,.bottomLeft], radius: CORNERRADIUS)
            } else if num == FIVEMINLIGHTCOUNT-1 {
                fiveMinuteLights[num].roundCorners(corners: [.topRight,.bottomRight], radius: CORNERRADIUS)
            }
            fiveMinuteStackView.addArrangedSubview(fiveMinuteLights[num])
        }
    }
    
}

