//
//  SBrMineViewController.swift
//  SwiftBrandon
//
//  Created by 朱玉辉 on 2019/3/11.
//  Copyright © 2019年 yuhuiMr. All rights reserved.
//

import UIKit

class SBrMineViewController: SBrBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.randomColor
        // Do any additional setup after loading the view.
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let setvc = SBrSetViewController()
        setvc.title = "设置"
        self.navigationController?.pushViewController(setvc, animated: true)
    }

}
