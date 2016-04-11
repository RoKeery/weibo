//
//  MainUITabBar.swift
//  weibo
//
//  Created by 赵思文 on 16/4/11.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit

class MainTabBar: UITabBar {

    //默认构造方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    
    //如果重写init(frame) 系统会默认认为这个控件是通过代码创建
    required init?(coder aDecoder: NSCoder) {
        //只有一个默认报错的语句,如果有调用者通过 storyboard或 xib 创建了改对象 这个时候程序就崩溃
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI(){
        //添加撰写按钮
        addSubview(composeBtn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //手动修改所有按钮的位置
        //遍历所有子视图
        let w = self.bounds.width / 5
        let h = self.bounds.height
        let rect = CGRect(x: 0, y: 0, width: w, height: h)
        
        //定义递增变量
        var index: CGFloat = 0
        for subView in subviews {
            if subView.isKindOfClass(NSClassFromString("UITabBarButton")!){
                //修改frame
                subView.frame = CGRectOffset(rect, index * w, 0)
                //多留一层
//                if index == 1{
//                    index++
//                }
//                index++
                
                //三目: 如果等于1取2,否则取1
                index += index == 1 ? 2 : 1
            }
        }
        
        //设置撰写按钮位置 0 -> -20 调整位置
        composeBtn.frame = CGRectOffset(rect, w * 2, 0)
        //位置在上方
        bringSubviewToFront(composeBtn)
    }
    
    //MARK: 懒加载 撰写按钮
    lazy var composeBtn: UIButton = {
        // 自定义样式的按钮
        let btn = UIButton()
        
        //设置按钮
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: .Highlighted)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: .Highlighted)
        
        btn.sizeToFit()
        
        return btn
    }()

}
