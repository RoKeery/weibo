//
//  VisitorLoginView.swift
//  weibo
//
//  Created by 赵思文 on 16/4/14.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit

protocol VisitorLoginViewDelegate: NSObjectProtocol {
    //协议方法
    //登录
    func visitorWillLogin()
    //注册
    func visitorWillRegister()
}

class VisitorLoginView: UIView {
    
    //声明代理属性
    //属性默认是强引用 需要添加weak
    weak var visitorDelegate: VisitorLoginViewDelegate?
    
    @objc func loginBtnDidClick(){
        //代理调用协议方法
        visitorDelegate?.visitorWillLogin()
    }
    @objc func registerBtnDidClick(){
        visitorDelegate?.visitorWillRegister()
    }
    
    //设置页面信息
    func setUIInfo(imageName: String?, title: String){
        
        iconView.hidden = false
        tipLabel.text = title
        if imageName != nil{
            circleView.image = UIImage(named: imageName!)
            iconView.hidden = true
        }else{
            //让circleView动起来
            startAnimation()
        }
    }
    
    //转动动画
    private func startAnimation(){
        let anima = CABasicAnimation(keyPath: "transform.rotation")
        //一直转
        anima.repeatCount = MAXFLOAT
        //转一圈
        anima.toValue = 2 * M_PI
        anima.duration = 20
        //当动画结束或者视图处于非活跃状态, 动画不移除图层
        anima.removedOnCompletion = false
        circleView.layer.addAnimation(anima, forKey: nil)
    }
    
    //重写构造方法
    init(){
        super.init(frame: CGRectZero)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK:设置访客视图
    private func setupUI(){
        //backgroundColor = UIColor.redColor()
        addSubview(circleView)
        addSubview(backView)
        addSubview(iconView)
        addSubview(tipLabel)
        addSubview(loginBtn)
        addSubview(registerBtn)
        
        //设置frame布局失效
        for v in subviews{
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        //设置布局
        //VFL 设置约束
        //布局的约束尽量相对一个控件
        //圆圈的约束
        addConstraint(NSLayoutConstraint(item: circleView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier:  1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: circleView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier:  1.0, constant: -60))
        //大图标约束
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .CenterX, relatedBy: .Equal, toItem: circleView, attribute: .CenterX, multiplier:  1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .CenterY, relatedBy: .Equal, toItem: circleView, attribute: .CenterY, multiplier:  1.0, constant: -8))
        //设置提示文案的约束
        addConstraint(NSLayoutConstraint(item: tipLabel, attribute: .CenterX, relatedBy: .Equal, toItem: circleView, attribute: .CenterX, multiplier:  1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: tipLabel , attribute: .Top, relatedBy: .Equal, toItem: circleView, attribute: .Bottom , multiplier:  1.0, constant: 16))
        //设置文字宽度和高度的约束
        addConstraint(NSLayoutConstraint(item: tipLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 224))
        addConstraint(NSLayoutConstraint(item: tipLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 35))

        //设置登录按钮约束
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .Left, relatedBy: .Equal, toItem: tipLabel, attribute: .Left, multiplier:  1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: loginBtn , attribute: .Top, relatedBy: .Equal, toItem: tipLabel, attribute: .Bottom , multiplier:  1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: loginBtn , attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute , multiplier:  1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: loginBtn , attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute , multiplier:  1.0, constant: 35))
        //设置注册按钮约束
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .Right, relatedBy: .Equal, toItem: tipLabel, attribute: .Right, multiplier:  1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: registerBtn , attribute: .Top, relatedBy: .Equal, toItem: tipLabel, attribute: .Bottom , multiplier:  1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: registerBtn , attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute , multiplier:  1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: registerBtn , attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute , multiplier:  1.0, constant: 35))
        //设置背景视图的约束  H: 水平  v: 垂直  backView相对于左右两侧间距为0
        //位移枚举 []
        //对视图宽高约束的数值 [Sting: NSNumber]
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[backView]-0-|", options: [], metrics: nil, views: ["backView": backView]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[backView]-(-34)-[registerBtn]", options: [], metrics: nil, views: ["backView": backView, "registerBtn": registerBtn]))
        //设置背景颜色
        backgroundColor = UIColor(white: 0.93, alpha: 1)
        
        //添加点击事件
        loginBtn.addTarget(self, action: #selector(loginBtnDidClick), forControlEvents: .TouchUpInside)
        registerBtn.addTarget(self, action: #selector(registerBtnDidClick), forControlEvents: .TouchUpInside)
    }
    
    //懒加载所有的控件
    private lazy var circleView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    private lazy var iconView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    private lazy var backView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    
    //提示文案
    private lazy var tipLabel: UILabel = {
       let l = UILabel()
        l.text = "登录后,你的微博显示在这里,展示给别人! "
        l.textAlignment = NSTextAlignment.Center
        l.font = UIFont.systemFontOfSize(14)
        l.textColor = UIColor.lightGrayColor()
        //文字换行
        l.numberOfLines = 0
        l.sizeToFit()
        return l
    }()
    
    private lazy var loginBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("登录", forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: .Normal)
        btn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        return btn
    }()
    
    private lazy var registerBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("注册 ", forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: .Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        return btn
    }()
    
}






