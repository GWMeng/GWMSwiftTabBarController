//
//  GWMTabBar.swift
//  GWMSwiftTabBarController
//
//  Created by gongweimeng on 2017/8/10.
//  Copyright © 2017年 GWM. All rights reserved.
//

import UIKit
//代理
protocol GWMTabBarDelegate : NSObjectProtocol {
    func didSelectedButtonFrom(tabBar:GWMTabBar, from:Int, to:Int)
}
class GWMTabBar: UIView {
    weak var delegate: GWMTabBarDelegate?
    var tabBarButtons = NSMutableArray()
    var selectedButton = GWMTabBarButton()
    
    var buttons: NSMutableArray?{
        set{
            tabBarButtons = newValue as NSMutableArray!
        }
        get{
            return tabBarButtons as NSMutableArray!
        }
    }
    
    func addTabBarButtonWithItem(item:UITabBarItem)  {
        let button = GWMTabBarButton()
        self.addSubview(button)
        self.tabBarButtons.add(button)
        button.setItem(item1: item)
        button.addTarget(self, action: #selector(buttonClick(sender:)), for: UIControlEvents.touchUpInside)
        if self.tabBarButtons.count == 1 {
            self.buttonClick(sender: button)
        }
    }
    
    func buttonClick(sender:GWMTabBarButton) {
        self.delegate?.didSelectedButtonFrom(tabBar: self, from: selectedButton.tag, to: sender.tag)
        selectedButton.isSelected = false
        sender.isSelected = true
        selectedButton = sender
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let h:CGFloat = self.frame.size.height
        let w:CGFloat = self.frame.size.width
        let btnH:CGFloat = h
        let btnW:CGFloat = w / CGFloat(self.subviews.count)
        let btnY:CGFloat = 0
        
        for index in 0..<self.tabBarButtons.count {
            let button:GWMTabBarButton = tabBarButtons[index] as! GWMTabBarButton
            let btnX:CGFloat = CGFloat(index)*btnW;
            button.tag=index
            button.frame=CGRect.init(x: btnX, y: btnY, width: btnW, height: btnH)
//            print(btnX,btnY,btnH, btnW)
        }
        
    }
}
