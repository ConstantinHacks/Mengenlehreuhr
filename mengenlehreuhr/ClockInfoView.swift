//
//  ClockInfoView.swift
//  mengenlehreuhr
//
//  Created by Constantin Koehler on 9/30/18.
//  Copyright © 2018 Constantin Koehler. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class ClockInfoView : UIView {
    let nibName = "ClockInfoView"

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var webView: WKWebView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        Bundle.main.loadNibNamed("ClockInfoView", owner: self, options: nil)
        addSubview(contentView)
        webView.load(URLRequest(url: URL(string: "https://en.m.wikipedia.org/wiki/Mengenlehreuhr")!))
        contentView.frame = self.bounds
    }
    
}
