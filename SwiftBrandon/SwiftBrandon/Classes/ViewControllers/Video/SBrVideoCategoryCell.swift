//
//  SBrVideoCategoryCell.swift
//  SwiftBrandon
//
//  Created by 朱玉辉 on 2019/3/12.
//  Copyright © 2019年 yuhuiMr. All rights reserved.
//

import UIKit

class SBrVideoCategoryCell: UICollectionViewCell {
    var titleLabel:UILabel?//title
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 40))
        self .addSubview(titleLabel!)
    }
}
