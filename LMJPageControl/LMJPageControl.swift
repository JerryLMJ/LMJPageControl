//
//  LMJPageControl.swift
//  LMJPageControlExample
//
//  Created by LiMingjie on 2019/5/30.
//  Copyright © 2019 LMJ. All rights reserved.
//

import Foundation
import UIKit

open class LMJPageControl: UIView {
    fileprivate var _offsetLeft: Float!      = 0
    fileprivate var _offsetRight: Float!     = 0
    fileprivate var _pointWidth: Float!      = 5.0

    fileprivate var _normalColor: UIColor!   = UIColor.lightGray
    fileprivate var _selectedColor: UIColor! = UIColor.black
    fileprivate var _normalImg: UIImage?     = nil
    fileprivate var _selectedImg: UIImage?   = nil

    fileprivate var _pageCount: UInt!        = 1
    fileprivate var _currentPage: UInt!      = 0

    fileprivate var _points: Array           = [UIImageView]()

    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        reloadControl()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        reloadControl()
    }
    override open func layoutSubviews() {
        super.layoutSubviews()
        reloadPointsLayerout()
    }
    
    private func reloadControl() {
        reloadPoints()
        reloadPointsSize()
        reloadPointsStyle()
    }
    
    
    private func reloadPoints() {
        _points.forEach { point in
            point.removeFromSuperview()
        }
        _points.removeAll()
        for _ in 0..<_pageCount {
            let point = UIImageView()
            self.addSubview(point)
            _points.append(point)
        }
    }
    
    private func reloadPointsSize() {
        for i in 0..<_points.count {
            let point = _points[i]
            point.frame = CGRect(x: point.frame.origin.x, y: point.frame.origin.y, width: CGFloat(_pointWidth), height: CGFloat(_pointWidth))
            if i == _currentPage {
                if _selectedImg == nil {
                    point.layer.cornerRadius = CGFloat(_pointWidth / 2.0)
                } else {
                    point.layer.cornerRadius = 0.0
                }
            } else {
                if _normalImg == nil {
                    point.layer.cornerRadius = CGFloat(_pointWidth / 2.0)
                } else {
                    point.layer.cornerRadius = 0.0
                }
            }
            
        }
    }
    
    private func reloadPointsLayerout() {
        let fWidth = Float(self.frame.size.width)
        let fHeight = Float(self.frame.size.height)
        if fWidth <= 0 || fHeight <= 0 {
            return
        }
        
        let fPageCount = Float(_pageCount)
        let distance: Float = fWidth - _offsetLeft - _offsetRight - _pointWidth * fPageCount
        let distanceBetweenPoints: Float = fPageCount > 1.0 ? distance / (fPageCount-1.0) : 0.0;
        
        for i in 0..<_points.count {
            let point = _points[i]
            let fI = Float(i)
            let x = CGFloat(_offsetLeft + (_pointWidth + distanceBetweenPoints) * fI)
            let y = CGFloat((fHeight - _pointWidth) / 2.0)
            point.frame = CGRect(x: x, y: y, width: point.frame.size.width, height: point.frame.size.height)
        }
    }
    
    private func reloadPointsStyle() {
        for i in 0..<_points.count {
            let point = _points[i]
            if _currentPage == i {
                if _selectedImg != nil {
                    point.layer.masksToBounds = false
                    point.layer.cornerRadius  = 0.0
                    point.image               = _selectedImg!
                    point.backgroundColor     = _selectedColor
                } else {
                    point.layer.masksToBounds = true
                    point.layer.cornerRadius  = CGFloat(_pointWidth / 2.0)
                    point.image               = nil
                    point.backgroundColor     = _selectedColor
                }
            } else {
                if _normalImg != nil {
                    point.layer.masksToBounds = false
                    point.layer.cornerRadius  = 0.0
                    point.image               = _normalImg!
                    point.backgroundColor     = _normalColor
                } else {
                    point.layer.masksToBounds = true
                    point.layer.cornerRadius  = CGFloat(_pointWidth / 2.0)
                    point.image               = nil
                    point.backgroundColor     = _normalColor
                }
            }
        }
    }
    
    
    public var offsetLeft: Float {
        get {
            return _offsetLeft
        }
        set {
            _offsetLeft = newValue
            reloadPointsLayerout()
        }
    }
    public var offsetRight: Float {
        get {
            return _offsetRight
        }
        set {
            _offsetRight = newValue
            reloadPointsLayerout()
        }
    }
    
    public var pointWidth: Float {
        get {
            return _pointWidth
        }
        set {
            _pointWidth = newValue
            reloadPointsSize()
        }
    }
    
    public var normalColor: UIColor {
        get {
            return _normalColor
        }
        set {
            _normalColor = newValue
            _normalImg = nil
            reloadPointsStyle()
        }
    }
    public var selectedColor: UIColor {
        get {
            return _selectedColor
        }
        set {
            _selectedColor = newValue
            _selectedImg = nil
            reloadPointsStyle()
        }
    }
    
    public var normalImg: UIImage? {
        get {
            return _normalImg
        }
        set {
            _normalImg = newValue
            _normalColor = UIColor.clear
            reloadPointsStyle()
        }
    }
    public var selectedImg: UIImage? {
        get {
            return _selectedImg
        }
        set {
            _selectedImg = newValue
            _selectedColor = UIColor.clear
            reloadPointsStyle()
        }
    }
    
    public var pageCount: UInt {
        get {
            return _pageCount
        }
        set {
            _pageCount = newValue
            reloadControl()
        }
    }
    public var currentPage: UInt {
        get {
            return _currentPage
        }
        set {
            _currentPage = newValue
            reloadPointsStyle()
        }
    }
}
