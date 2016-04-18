//
//  DiscoverTableViewController.swift
//  weibo
//
//  Created by 赵思文 on 16/4/11.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit

class DiscoverTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        visitorLoginView?.setUIInfo("visitordiscover_image_message", title: "登录后,最新 最热的微博尽在掌握,不再会与实事潮流擦肩而过. ")

        }
}
