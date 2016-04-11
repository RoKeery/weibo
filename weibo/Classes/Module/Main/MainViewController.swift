//
//  MainViewController.swift
//  weibo
//
//  Created by 赵思文 on 16/4/6.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //由于tabbar是只读,不能够直接操作,如果要修改,可以使用 KVC
        let mainTabBar = MainTabBar()
        //KVC 赋值
        setValue(mainTabBar, forKey: "tabBar")
        //添加子视图控制器
        addChildViewControllers()
        
        
    }
    private func addChildViewControllers() {
        addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(MessageTableViewController(), title: "信息", imageName: "tabbar_message_center")
        addChildViewController(DiscoverTableViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(ProfileTableViewController(), title: "我", imageName: "tabbar_profile")
    }
    
    //重载
    private func addChildViewController(vc: UIViewController,title: String,imageName: String) {
        
        //使用原生图片高亮显示,文字颜色
        self.tabBar.tintColor = UIColor.orangeColor()
        
        //实例化导航视图控制器
        let nav = UINavigationController(rootViewController: vc)
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        
        //添加
        addChildViewController(nav)
    }
}
