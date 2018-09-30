//
//  Clock.swift
//  mengenlehreuhr
//
//  Created by Constantin Koehler on 9/29/18.
//  Copyright © 2018 Constantin Koehler. All rights reserved.
//

import Foundation
import UIKit

class Clock {
    var fiveHourLights = [LightView]()
    var oneHourLights = [LightView]()
    var fiveMinuteLights = [LightView]()
    var oneMinuteLights = [LightView]()
    
    static let LIGHTCOUNT = 4
    static let FIVEMINLIGHTCOUNT = 11
    
    init() {
        for _ in 0..<Clock.LIGHTCOUNT {
            fiveHourLights.append(makeLightView(color: UIColor.red))
            oneHourLights.append(makeLightView(color: UIColor.red))
            oneMinuteLights.append(makeLightView(color: UIColor.yellow))
        }
        
        for num in 1...Clock.FIVEMINLIGHTCOUNT {
            if num != 0 && num % 3 == 0 {
                fiveMinuteLights.append(makeLightView(color: UIColor.red))
            } else {
                fiveMinuteLights.append(makeLightView(color: UIColor.yellow))
            }
        }
    }
}
