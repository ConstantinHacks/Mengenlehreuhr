//
//  Lights.swift
//  mengenlehreuhr
//
//  Created by Constantin Koehler on 9/29/18.
//  Copyright © 2018 Constantin Koehler. All rights reserved.
//

import Foundation
import UIKit

protocol Light {
    var color: UIColor { get }
}

struct RedLight: Light {
    var color = UIColor.red
}

struct YellowLight: Light {
    var color = UIColor.yellow
}
