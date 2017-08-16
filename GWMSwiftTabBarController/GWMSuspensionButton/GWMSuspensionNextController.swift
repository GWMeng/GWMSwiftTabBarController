//
//  GWMSuspensionNextController.swift
//  GWMSwiftTabBarController
//
//  Created by gongweimeng on 2017/8/16.
//  Copyright © 2017年 GWM. All rights reserved.
//

import UIKit

class GWMSuspensionNextController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor=UIColor.white
        self.title="Push出的界面"
        print("悬浮按钮不会因为界面的push而消失")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }

}
