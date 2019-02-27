//
//  SBrTabBar.swift
//  SwiftBrandon
//
//  Created by 朱玉辉 on 2019/2/27.
//  Copyright © 2019年 yuhuiMr. All rights reserved.
//

import UIKit

protocol SBrTabBarDelegate {
    func tabBarDidClickAtCenterButton(tabBar:SBrTabBar)
}


class SBrTabBar: UITabBar,UITabBarDelegate {
    var sbrdelegate:SBrTabBarDelegate? //代理,点击item
    var centerButton:UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let centerButton = UIButton();
        centerButton.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: .normal)
        centerButton.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: .highlighted)
        centerButton.setImage(UIImage(named: "tabbar_compose_icon_add"), for: .normal)
        centerButton.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
        if let bgsize = centerButton.currentBackgroundImage?.size {
            centerButton.size = bgsize
        }
        centerButton.addTarget(self, action: #selector(centerButtonAction), for: .touchUpInside)
        self.addSubview(centerButton)
        self.centerButton = centerButton;
        
        self.centerButton?.layer.borderColor = UIColor.red.cgColor
        self.centerButton?.layer.borderWidth = 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func centerButtonAction(){
        self.sbrdelegate?.tabBarDidClickAtCenterButton(tabBar: self)
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.centerButton?.centerX = self.width * 0.5
        self.centerButton?.centerY = self.height * 0.5

        let tabbarButtonW = self.width / 5
        var tabbarButtonIndex = 0
        
        for child in self.subviews {
            let tarClass = NSClassFromString("UITabBarButton");
            if child.isKind(of: tarClass!){
                child.width = tabbarButtonW;
                
                child.x = CGFloat(tabbarButtonIndex) * tabbarButtonW;
                
                tabbarButtonIndex = tabbarButtonIndex + 1;
                if (tabbarButtonIndex == 2) {
                    tabbarButtonIndex = tabbarButtonIndex + 1
                }
            }
        }
        
        
        
        
    }

}
