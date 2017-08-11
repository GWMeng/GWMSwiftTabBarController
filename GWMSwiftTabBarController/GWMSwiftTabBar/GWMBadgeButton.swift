//
//  GWMBadgeButton.swift
//  GWMSwiftTabBarController
//
//  Created by gongweimeng on 2017/8/10.
//  Copyright © 2017年 GWM. All rights reserved.
//  数字提醒显示控件

import UIKit

class GWMBadgeButton: UIButton {

    var badgeValue:String!
    
    var badge: String?{
        set{
            badgeValue = newValue as String!
        }
        get{
            return badgeValue as String!
        }
    }
    
    //重写方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isHidden = true
        self.isUserInteractionEnabled = false
        self.setBackgroundImage(UIImage.init(named: "main_badge"), for: UIControlState.normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 11)
    }
    
    //充血init后自动添加
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //设置数字提醒的数值
    func setBadgeValue(badge:NSString) {
        self.badgeValue = badge.copy() as! String
        if badge.intValue>0 {
            self.isHidden = false
            self.setTitle(badge as String, for: UIControlState.normal)
            
            var frame = self.frame
            var btnH:CGFloat = 10.0
            var btnW:CGFloat = 10.0
            let size1 = CGSize()
            
            if badge.length>1 {
                let size2 = badge.boundingRect(with: size1, options: NSStringDrawingOptions.usesFontLeading, attributes: nil, context: nil)
                btnW = size2.width+10.0
                btnH = self.currentBackgroundImage!.size.height
            }else if badge.length==1{
                btnH = self.currentBackgroundImage!.size.height
                btnW = self.currentBackgroundImage!.size.width
            }
            
            //通过设置-1可以隐藏
            if badge .isEqual(to: "-1") {
                self.isHidden = true
            }
            
            //新的frame
            frame.size.width = btnW
            frame.size.height = btnH
            self.frame = frame
        }else{
            self.isHidden = true
        }
    }
}
