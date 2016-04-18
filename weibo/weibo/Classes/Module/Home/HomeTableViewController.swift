//
//  HomeTableViewController.swift
//  weibo
//
//  Created by 赵思文 on 16/4/11.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        visitorLoginView?.setUIInfo(nil, title: "关注一些人,回这里看看有什么惊喜!")
    }
}
