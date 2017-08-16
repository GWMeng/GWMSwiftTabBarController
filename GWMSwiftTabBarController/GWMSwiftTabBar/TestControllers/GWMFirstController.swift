//
//  GWMFirstController.swift
//  GWMSwiftTabBarController
//
//  Created by gongweimeng on 2017/8/10.
//  Copyright © 2017年 GWM. All rights reserved.
//

import UIKit

class GWMFirstController: UIViewController ,GWMSuspensionButtonDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor=UIColor.white
        
        //添加悬浮按钮（这里是单例）
        GWMSuspensionButton.shareSuspension.setBase(point: CGPoint.init(x: GWMViewW(Controller: self)-80, y: 200.0), onview: (self.navigationController?.view)!, width: 60, height: 60)
        GWMSuspensionButton.shareSuspension.delegate=self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func suspensionButtonClicked() {
        print("controller实现了按钮点击的代理方法,在这里做事情")
        let nextVC = GWMSuspensionNextController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

    
}
