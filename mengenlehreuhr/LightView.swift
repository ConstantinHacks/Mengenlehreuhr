//
//  LightView.swift
//  mengenlehreuhr
//
//  Created by Constantin Koehler on 9/29/18.
//  Copyright © 2018 Constantin Koehler. All rights reserved.
//

import UIKit

@IBDesignable
class LightView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBInspectable var lightColor : UIColor = UIColor.black
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        backgroundColor = lightColor
    }
    
    func setLight(on: Bool){
        backgroundColor = on ? lightColor : UIColor.black
    }
    
    func makeLightCircular() {
        layer.cornerRadius = frame.size.width/2
        clipsToBounds = true
    }
    
}
