//
//  WebViewController.swift
//  mengenlehreuhr
//
//  Created by Constantin Koehler on 11/23/18.
//  Copyright © 2018 Constantin Koehler. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.load(URLRequest(url: URL(string: "https://en.m.wikipedia.org/wiki/Mengenlehreuhr")!))
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
