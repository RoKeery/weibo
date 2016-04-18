//
//  MessageTableViewController.swift
//  weibo
//
//  Created by 赵思文 on 16/4/11.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit

class MessageTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        visitorLoginView?.setUIInfo("visitordiscover_image_message", title: "登录后,别人评论你的微博,发给你的消息,都会在这里收到通知.")
    }
}
