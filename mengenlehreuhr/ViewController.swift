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
    
    let clock = Clock()
    let clockInfoView = ClockInfoView()
    var currentTimeTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        
        scrollView.isPagingEnabled = true
        
        scrollView.contentInsetAdjustmentBehavior = .never

        setUpScrollView()

        currentTimeTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.setClockCurrentTime), userInfo: nil, repeats: true)
    }
    
    func setUpScrollView(){
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(2), height: scrollView.frame.height)
        
        clock.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: scrollView.frame.height)
        clockInfoView.frame = CGRect(x: view.frame.width, y: 0, width: view.frame.width, height: scrollView.frame.height)
        
        scrollView.addSubview(clock)
        scrollView.addSubview(clockInfoView)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        setUpScrollView()
    }
    
    @objc func setClockCurrentTime() {
        clock.setLightsForTime(date: Date())
    }
 
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
}

