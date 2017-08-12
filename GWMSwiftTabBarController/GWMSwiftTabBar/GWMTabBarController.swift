//
//  GWMTabBarController.swift
//  GWMSwiftTabBarController
//
//  Created by gongweimeng on 2017/8/10.
//  Copyright © 2017年 GWM. All rights reserved.
//

import UIKit

class GWMTabBarController: UITabBarController , GWMTabBarDelegate{

    var customTabBar = GWMTabBar()
    var firstVC = GWMFirstController()
    var secondVC = GWMSecondController()
    var thirdVC = GWMThirdController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpTabBar()
        self.setUpAllChildViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //删除系统的TabBarButton
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for child:UIView in self.tabBar.subviews {
            if child.isKind(of: NSClassFromString("UIControl")!) {
                child.removeFromSuperview()
            }
        }
    }

    func setUpTabBar()  {
        let customTabBar1 = GWMTabBar()
        customTabBar1.frame=self.tabBar.bounds
        customTabBar1.delegate=self as GWMTabBarDelegate
        customTabBar1.backgroundColor=UIColor.white
        self.tabBar.addSubview(customTabBar1)
        customTabBar=customTabBar1;
    }
    
    func didSelectedButtonFrom(tabBar: GWMTabBar, from: Int, to: Int) {
        self.selectedIndex=to
//        print(self.selectedIndex)
    }
    
    //初始化子控制器(临时随便建了几个controller（TestController分组）)
    func setUpAllChildViewControllers()  {
        let firstVC1 = GWMFirstController()
        firstVC1.tabBarItem.badgeValue=""
        self.setUpChildViewController(childVC: firstVC1, title: "First", imageName: "children_tab", selectedImageName: "children_tab_sel")
        self.firstVC=firstVC1;
        
        let secondVC1 = GWMSecondController()
        secondVC1.tabBarItem.badgeValue="13"
        self.setUpChildViewController(childVC: secondVC1, title: "Second", imageName: "school_tab", selectedImageName: "school_tab_sel")
        self.secondVC=secondVC1;
        
        let thirdVC1 = GWMThirdController()
        thirdVC1.tabBarItem.badgeValue=""
        self.setUpChildViewController(childVC: thirdVC1, title: "Third", imageName: "study_tab", selectedImageName: "study_tab_sel")
        self.thirdVC=thirdVC1;
        
    }
    
    func setUpChildViewController(childVC:UIViewController,title:String,imageName:String,selectedImageName:String)  {
        childVC.title = title
        childVC.tabBarItem.image = UIImage.init(named: imageName)
        childVC.tabBarItem.selectedImage = UIImage.init(named: selectedImageName)
        
        //导航控制器
        let nav:UINavigationController = UINavigationController.init(rootViewController: childVC)
        nav.navigationBar.barTintColor = MainColor
        nav.navigationBar.tintColor = UIColor.white
        nav.navigationBar.titleTextAttributes = {[
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.boldSystemFont(ofSize: 17)
            ]}()
        self.addChildViewController(nav)
        
        self.customTabBar .addTabBarButtonWithItem(item: childVC.tabBarItem)
    }
}
