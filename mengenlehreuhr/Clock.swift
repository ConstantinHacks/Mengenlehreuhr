//
//  Clock.swift
//  mengenlehreuhr
//
//  Created by Constantin Koehler on 9/29/18.
//  Copyright © 2018 Constantin Koehler. All rights reserved.
//

import Foundation
import UIKit

class Clock : UIView {
    
    @IBOutlet weak var secondLightView: LightView!
    
    @IBOutlet weak var fiveHourLV1: LightView!
    @IBOutlet weak var fiveHourLV2: LightView!
    @IBOutlet weak var fiveHourLV3: LightView!
    @IBOutlet weak var fiveHourLV4: LightView!
    
    @IBOutlet weak var oneHourLV1: LightView!
    @IBOutlet weak var oneHourLV2: LightView!
    @IBOutlet weak var oneHourLV3: LightView!
    @IBOutlet weak var oneHourLV4: LightView!

    @IBOutlet weak var fiveMinLV1: LightView!
    @IBOutlet weak var fiveMinLV2: LightView!
    @IBOutlet weak var fiveMinLV3: LightView!
    @IBOutlet weak var fiveMinLV4: LightView!
    @IBOutlet weak var fiveMinLV5: LightView!
    @IBOutlet weak var fiveMinLV6: LightView!
    @IBOutlet weak var fiveMinLV7: LightView!
    @IBOutlet weak var fiveMinLV8: LightView!
    @IBOutlet weak var fiveMinLV9: LightView!
    @IBOutlet weak var fiveMinLV10: LightView!
    @IBOutlet weak var fiveMinLV11: LightView!
    
    @IBOutlet weak var oneMinLV1: LightView!
    @IBOutlet weak var oneMinLV2: LightView!
    @IBOutlet weak var oneMinLV3: LightView!
    @IBOutlet weak var oneMinLV4: LightView!
    
    @IBOutlet weak var fiveHourContainer: UIView!
    @IBOutlet weak var oneHourContainer: UIView!
    @IBOutlet weak var fiveMinuteContainer: UIView!
    @IBOutlet weak var oneMinuteContainer: UIView!
    
    var fiveHourLights = [LightView]()
    var oneHourLights = [LightView]()
    var fiveMinuteLights = [LightView]()
    var oneMinuteLights = [LightView]()
    
    let CORNERRADIUS = CGFloat(12)
    
    static let LIGHTCOUNT = 4
    static let FIVEMINLIGHTCOUNT = 11
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        Bundle.main.loadNibNamed("Clock", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        setUpSecondLight()
        
        roundStackViews()
        
        fiveHourLights = [fiveHourLV1,fiveHourLV2,fiveHourLV3,fiveHourLV4]
        oneHourLights = [oneHourLV1,oneHourLV2,oneHourLV3,oneHourLV4]
        fiveMinuteLights = [fiveMinLV1,fiveMinLV2,fiveMinLV3,fiveMinLV4,fiveMinLV5,fiveMinLV6,fiveMinLV7,fiveMinLV8,fiveMinLV9,fiveMinLV10,fiveMinLV11]
        oneMinuteLights = [oneMinLV1,oneMinLV2,oneMinLV3,oneMinLV4]
    }
    
    
    func setUpSecondLight() {
        secondLightView.autoresizingMask = [.flexibleWidth, .flexibleHeight];
        secondLightView.layer.cornerRadius = secondLightView.bounds.size.width/2.0
        secondLightView.clipsToBounds = true
        secondLightView.layer.borderWidth = 6
        secondLightView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func roundStackViews() {
        fiveHourContainer.roundCorners(corners: [.topLeft,.topRight,.bottomRight,.bottomLeft], radius: CORNERRADIUS)
        oneHourContainer.roundCorners(corners: [.topLeft,.topRight,.bottomRight,.bottomLeft], radius: CORNERRADIUS)
        fiveMinuteContainer.roundCorners(corners: [.topLeft,.topRight,.bottomRight,.bottomLeft], radius: CORNERRADIUS)
        oneMinuteContainer.roundCorners(corners: [.topLeft,.topRight,.bottomRight,.bottomLeft], radius: CORNERRADIUS)
    }
    
    func setLightsForTime(date: Date){
        let unitFlags: Set<Calendar.Component> = [.hour, .minute, .second]
        let components = NSCalendar.current.dateComponents(unitFlags, from: date)
        
        print(components)
        if let hours = components.hour, let minutes = components.minute, let seconds = components.second {
            
            secondLightView.setLight(on: seconds % 2 == 0)
            
            var hoursLeftOver = hours
            var minutesLeftOver = minutes
            
            for (index,light) in fiveHourLights.enumerated() {
                if (index+1) * 5 > hours {
                    light.setLight(on: false)
                } else {
                    light.setLight(on: true)
                    light.backgroundColor = light.lightColor
                    hoursLeftOver -= 5
                }
            }

            for (index,light) in oneHourLights.enumerated() {
                if index+1 > hoursLeftOver {
                    light.setLight(on: false)
                } else {
                    light.setLight(on: true)
                }
            }
            
            for (index,light) in fiveMinuteLights.enumerated() {
                if (index+1) * 5 > minutes {
                    light.setLight(on: false)
                } else {
                    light.setLight(on: true)
                    minutesLeftOver -= 5
                }
            }
            
            for (index,light) in oneMinuteLights.enumerated() {
                if index+1 > minutesLeftOver {
                    light.backgroundColor = UIColor.black
                    light.setLight(on: false)
                } else {
                    light.setLight(on: true)
                }
            }
        }
    }
}
