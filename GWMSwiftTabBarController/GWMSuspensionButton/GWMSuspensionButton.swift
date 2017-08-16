//
//  GWMSuspensionButton.swift
//  GWMSwiftTabBarController
//
//  Created by gongweimeng on 2017/8/15.
//  Copyright © 2017年 GWM. All rights reserved.
//

import UIKit
//代理
protocol GWMSuspensionButtonDelegate : NSObjectProtocol {
    func suspensionButtonClicked()
}
class GWMSuspensionButton: UIButton {

    weak var delegate: GWMSuspensionButtonDelegate?
    
    var onView = UIView()
    var onLeft = false
    var originalPoint = CGPoint()
    var tempCenter = CGPoint()
    var selfwidth = CGFloat()
    var selfheight = CGFloat()
    
    //单例
    static let shareSuspension = GWMSuspensionButton()
    
    func setBase(point:CGPoint,onview:UIView,width:CGFloat,height:CGFloat)  {
        onView = onview;
        onView.addSubview(self)
        selfwidth=width
        selfheight=height
        
        let newPoint = self.getNewPoint(point: point)
        self.frame = CGRect(x:newPoint.x, y:newPoint.y, width:width, height:height)
        self.backgroundColor = MainColor
        self.setTitleColor(UIColor.white, for: UIControlState.normal)
        self.setTitle("浮", for: UIControlState.normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        let layer = self.layer
        if width>height {
            layer.cornerRadius = height/2
        }else{
            layer.cornerRadius = width/2
        }
        layer.masksToBounds = true
        //点击(手势添加练习)
        //这里要通过tap手势来添加点击事件，addTarget方法行不通，在controller里addTarget也行不通
        self.addGestureRec()
    }
    
    func getNewPoint(point:CGPoint) -> CGPoint {
        var newPoint = CGPoint()
        if point.x+selfwidth>GWMScreenWidth || point.x>GWMScreenWidth/2-selfwidth/2 {
            newPoint.x = GWMScreenWidth-selfwidth-10
            onLeft = false
        }else{
            newPoint.x=10;
            onLeft = true
        }
        if point.y+selfheight>onView.frame.size.height-44 {
            newPoint.y = onView.frame.size.height-44-selfheight-10
        }else if point.y<64{
            newPoint.y = 10+64
        }else{
            newPoint.y = point.y
        }
        return newPoint
    }
    
    func addGestureRec() {
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(buttonClicked))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        self.addGestureRecognizer(tap)
        
    }
    func buttonClicked()  {
        print("悬浮按钮被点击了")
        self.delegate?.suspensionButtonClicked()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let t:UITouch = touch as! UITouch
            originalPoint = t.location(in: self)
        }
        tempCenter = self.center
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        var currentPoint = CGPoint()
        
        for touch: AnyObject in touches {
            let t:UITouch = touch as! UITouch
            currentPoint = t.location(in: self)
        }
        let deX = currentPoint.x-originalPoint.x
        let deY = currentPoint.y-originalPoint.y
        var newCenter = self.center
        newCenter.x += deX
        newCenter.y += deY
        self.center=newCenter
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let newPoint = self.getNewPoint(point: self.frame.origin)
        
        UIView.animate(withDuration: 0.4, animations: {
            self.frame = CGRect(x:newPoint.x, y:newPoint.y, width:self.bounds.size.width, height:self.bounds.size.height)
        })
        
    }
}
