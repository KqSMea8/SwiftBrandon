//
//  SBrBaseViewController.swift
//  SwiftBrandon
//
//  Created by 朱玉辉 on 2019/3/11.
//  Copyright © 2019年 yuhuiMr. All rights reserved.
//

import UIKit
import CocoaLumberjack

class SBrBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    
    //视图将要显示
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //设置导航栏背景透明
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navi_bg_img"),for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage(named:"navi_border_line")
    }
    
    //视图将要消失
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //重置导航栏背景
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
    }
    
    
    
    deinit {
        DDLogDebug("deinit: \(self)")
    }

}
