//
//  ViewController.swift
//  LMJPageControlExample
//
//  Created by LiMingjie on 2019/5/30.
//  Copyright © 2019 LMJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var storyboardPageControl: LMJPageControl!
    var demoPageControl: LMJPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        // used on storyboard
        storyboardPageControl.offsetLeft  = 30.0
        storyboardPageControl.offsetRight = 30.0
        storyboardPageControl.pageCount   = 5
        storyboardPageControl.pointWidth  = 15
        storyboardPageControl.normalImg   = UIImage(named: "EMOJI-n")
        storyboardPageControl.selectedImg = UIImage(named: "EMOJI-s")

        
        // used with coding
        demoPageControl = LMJPageControl(frame: CGRect(x: storyboardPageControl.frame.origin.x, y: 150, width: 315, height: 30))
        demoPageControl.layer.cornerRadius = 5.0
        demoPageControl.backgroundColor    = UIColor(red: 64.0/255.0, green: 151.0/255.0, blue: 255.0/255.0, alpha: 0.5)
        demoPageControl.offsetLeft         = 10.0
        demoPageControl.offsetRight        = 10.0
        demoPageControl.pageCount          = 5
        demoPageControl.currentPage        = 0
        demoPageControl.pointWidth         = 10
        self.view.addSubview(demoPageControl)
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x     = scrollView.contentOffset.x
        let width = scrollView.frame.size.width
        let index = UInt(x / width)
        let remainder = x.truncatingRemainder(dividingBy: width)
        
        if  remainder == 0 {
            storyboardPageControl.currentPage = index
            demoPageControl.currentPage = index
        }
    }
}

