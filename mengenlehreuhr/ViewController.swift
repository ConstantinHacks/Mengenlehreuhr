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
        
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var clock = Clock()
    
    var currentTimeTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let clockInfoView = ClockInfoView()

        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        
        scrollView.isPagingEnabled = true
        
        scrollView.contentInsetAdjustmentBehavior = .never

        clock.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: scrollView.frame.height)
        clockInfoView.frame = CGRect(x: view.frame.width, y: 0, width: view.frame.width, height: scrollView.frame.height)

        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(2), height: scrollView.frame.height)
        
        scrollView.addSubview(clock)
        scrollView.addSubview(clockInfoView)

        currentTimeTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.setClockCurrentTime), userInfo: nil, repeats: true)
        
    }
    
    @objc func setClockCurrentTime() {
        clock.setLightsForTime(date: Date())
    }
 
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
}

