//
//  SBrTLVideoAttentionController.swift
//  SwiftBrandon
//
//  Created by 朱玉辉 on 2019/3/12.
//  Copyright © 2019年 yuhuiMr. All rights reserved.
//

import UIKit
import JXSegmentedView
class SBrTLVideoAttentionController: SBrBaseViewController {
    var vos:SBVMCategoryVos?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.randomColor
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DDLogInfo("\(self)")
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SBrTLVideoAttentionController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
