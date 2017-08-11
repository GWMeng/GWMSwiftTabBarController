//
//  GWMHeader.swift
//  GWMSwiftTabBarController
//
//  Created by gongweimeng on 2017/8/11.
//  Copyright © 2017年 GWM. All rights reserved.
//  这里相当于OC中的PCH文件

import UIKit
func GWMViewW(Controller:UIViewController)->CGFloat{
    return Controller.view.frame.size.width
}
func GWMViewH(Controller:UIViewController)->CGFloat{
    return Controller.view.frame.size.height
}
let GWMScreenWidth = UIScreen.main.bounds.size.width
let GWMScreenHeight = UIScreen.main.bounds.size.height
func GWMColor(r :CGFloat ,g:CGFloat,b:CGFloat) ->UIColor{
    return UIColor.init(colorLiteralRed: Float(r / 255.0), green:Float(g / 255.0) , blue:Float (b / 255.0), alpha: 1)
}
let MainColor = UIColor.init(red: 58/255.0, green: 200/255.0, blue: 174/255.0, alpha: 1.0)
		
