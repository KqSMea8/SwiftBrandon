//
//  SBrNavigationController.swift
//  SwiftBrandon
//
//  Created by 朱玉辉 on 2019/2/27.
//  Copyright © 2019年 yuhuiMr. All rights reserved.
//

import UIKit

class SBrNavigationController: UINavigationController, UINavigationControllerDelegate{
    var popDelegate: UIGestureRecognizerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popDelegate = self.interactivePopGestureRecognizer?.delegate
        self.delegate = self
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count >= 1{
            viewController.hidesBottomBarWhenPushed = true            
            
            let BtnItem2 = UIBarButtonItem.init(image: UIImage.init(named: "navigationBar_back")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(SBrNavigationController.backToPrevious))
            viewController.navigationItem.leftBarButtonItem = BtnItem2
            
        }
        

        super.pushViewController(viewController, animated: animated)
    }
 
    //返回按钮点击响应
    @objc func backToPrevious(){
        self.popViewController(animated: true)
    }
    

    //UINavigationControllerDelegate方法
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        /*
         如果push的是非根控制器，设置self.interactivePopGestureRecognizer.delegate = nil;。
         如果是根控制器，将原来的代理重新设置即可。
         */
        //实现滑动返回功能
        //清空滑动返回手势的代理就能实现
        if viewController == self.viewControllers[0] {
            self.interactivePopGestureRecognizer!.delegate = self.popDelegate
        }
        else {
            self.interactivePopGestureRecognizer!.delegate = nil
            
        }
        
    }
}
