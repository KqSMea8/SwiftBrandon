//
//  SBrTabBarController.swift
//  SwiftBrandon
//
//  Created by 朱玉辉 on 2019/2/27.
//  Copyright © 2019年 yuhuiMr. All rights reserved.
//

import UIKit

class SBrTabBarController: UITabBarController ,SBrTabBarDelegate{

    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        setupTabbar()
    }
    
    func setupViewControllers(){
        // 1.初始化子控制器
        let home = ViewController();
        self.addChildVc(childVc: home, title: "首页", image: "tabbar_home", selectedImage: "tabbar_home_selected")
        
        let messageCenter = ViewController();
        self.addChildVc(childVc: messageCenter, title: "消息", image: "tabbar_message_center", selectedImage: "tabbar_message_center_selected")

        let discover = ViewController();
        self.addChildVc(childVc: discover, title: "发现", image: "tabbar_discover", selectedImage: "tabbar_discover_selected")

        let profile = ViewController();
        self.addChildVc(childVc: profile, title: "我", image: "tabbar_profile", selectedImage: "tabbar_profile_selected")

    }
    func setupTabbar(){
        let tabBar = SBrTabBar()
        tabBar.sbrdelegate = self
        self.setValue(tabBar, forKey: "tabBar")
    }
    /// SBrTabBarDelegate
    ///
    /// - Parameter tabBar: <#tabBar description#>
    func tabBarDidClickAtCenterButton(tabBar: SBrTabBar) {
        
    }
    
    

    func addChildVc(childVc:UIViewController,title:String,image:String,selectedImage:String) {
        childVc.title = title
        childVc.tabBarItem.image = UIImage(named: image)
        childVc.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        
        
        var textAttrs:Dictionary<NSAttributedString.Key,Any> = Dictionary()
        textAttrs[NSAttributedString.Key.foregroundColor] = kRGBColor(R: 123, G: 123, B: 123)
        
        var selectTextAttrs:Dictionary<NSAttributedString.Key,Any> = Dictionary()
        selectTextAttrs[NSAttributedString.Key.foregroundColor] = UIColor.orange;
        childVc.tabBarItem.setTitleTextAttributes(textAttrs, for: .normal)
        childVc.tabBarItem.setTitleTextAttributes(selectTextAttrs, for: .selected)
        
        let nav = SBrNavigationController.init(rootViewController: childVc)
        self.addChild(nav)
    }

}
