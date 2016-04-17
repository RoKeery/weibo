//
//  BaseTableViewController.swift
//  weibo
//
//  Created by 赵思文 on 16/4/12.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
    //添加用户是否登录的标记
    var userLogin = false
    
    
    //loadView 是苹果专门为手写代码准备的,等效于 sb/ xib
    //一旦实现这个方法 sb/ xib就自动失效
    //会自动检测 view是否为空,如果为空,就自动调用loadView方法
    override func loadView() {
        
        userLogin ? super.loadView() : loadVisitorView()
    }
    
    private func loadVisitorView(){
        //view的大小在 viewDidLoad就会设置
        view = VisitorLoginView()
        
    }
    
    //视图控制器
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
