//
//  GWMTabBarButton.swift
//  GWMSwiftTabBarController
//
//  Created by gongweimeng on 2017/8/10.
//  Copyright © 2017年 GWM. All rights reserved.
//

import UIKit

class GWMTabBarButton: UIButton {

    var item = UITabBarItem()
    var badgeButton = GWMBadgeButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.showsTouchWhenHighlighted = false
        self.imageView?.contentMode = UIViewContentMode.center
        self.titleLabel?.textAlignment = NSTextAlignment.center
        self.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        self.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        self.setTitleColor(MainColor, for: UIControlState.selected)

        
        //数字提醒
        let badgeBtn = GWMBadgeButton()
        var arm1 = UIViewAutoresizing()
        arm1.formUnion(UIViewAutoresizing.flexibleLeftMargin)
        arm1.formUnion(UIViewAutoresizing.flexibleBottomMargin)
        badgeBtn.autoresizingMask = arm1
        self.addSubview(badgeBtn)
        self.badgeButton = badgeBtn
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //按钮图片的frame
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let imgW = contentRect.size.width
        let imgH = contentRect.size.height * 0.6
        return CGRect.init(x: 0, y: 0, width: imgW, height: imgH)
    }
    
    //按钮文字的frame
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let Y = contentRect.size.height * 0.6
        let W = contentRect.size.width
        let H = contentRect.size.height * 0.4
        return CGRect.init(x: 0, y: Y, width: W, height: H)
    }
    
    
    // KVO
    func setItem(item1:UITabBarItem)  {
        item=item1;
        item.addObserver(self, forKeyPath: "badgeValue", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
        item.addObserver(self, forKeyPath: "title", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
        item.addObserver(self, forKeyPath: "image", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
        item.addObserver(self, forKeyPath: "selectedImage", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
        self.observeValue(forKeyPath: nil, of: nil, change: nil, context: nil)
    }
    
    
    
    
    //监听到属性改变
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        self.setTitle(self.item.title, for: UIControlState.normal)
        self.setTitle(self.item.title, for: UIControlState.selected)
        self.setImage(self.item.image, for: UIControlState.normal)
        self.setImage(self.item.selectedImage, for: UIControlState.selected)
        badgeButton.setBadgeValue(badge: item.badgeValue as NSString!)
        let Y:CGFloat = 5.0;
        let bolder:CGFloat = 10.0
        let X:CGFloat = self.frame.size.width - self.badgeButton.frame.size.width-bolder
        var Fra = badgeButton.frame
        Fra.origin.x = X
        Fra.origin.y = Y
        badgeButton.frame = Fra
        
    }
}
