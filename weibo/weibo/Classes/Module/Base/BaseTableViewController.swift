//
//  BaseTableViewController.swift
//  weibo
//
//  Created by 赵思文 on 16/4/12.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit

//协议是必选的方法,如果不实现就报错
class BaseTableViewController: UITableViewController, VisitorLoginViewDelegate {
    
    //添加用户是否登录的标记
    var userLogin = false
    var visitorLoginView: VisitorLoginView?
    
    
    //loadView 是苹果专门为手写代码准备的,等效于 sb/ xib
    //一旦实现这个方法 sb/ xib就自动失效
    //会自动检测 view是否为空,如果为空,就自动调用loadView方法
    override func loadView() {
        
        userLogin ? super.loadView() : loadVisitorView()
    }
    
    private func loadVisitorView(){
        //view的大小在 viewDidLoad就会设置
        visitorLoginView = VisitorLoginView()
        //设置代理
        visitorLoginView?.visitorDelegate = self
        
        view = visitorLoginView 
        
        //页面左上角右上角按钮
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: #selector(BaseTableViewController.visitorWillRegister))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "登录", style: .Plain, target: self, action: #selector(BaseTableViewController.visitorWillLogin))
    }
    
    //visitorDelegate 实现协议方法
    func visitorWillLogin() {
        
    }
    func visitorWillRegister() {
        
    }
    
    //视图控制器
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
