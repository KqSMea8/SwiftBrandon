//
//  SBrVideoModel.swift
//  SwiftBrandon
//
//  Created by 朱玉辉 on 2019/3/12.
//  Copyright © 2019年 yuhuiMr. All rights reserved.
//

import UIKit
import HandyJSON
struct SBVMCategoryVos: HandyJSON {
    var category: String?
    var category_type: Int = 0
    var flags: Int = 0
    var icon_url: String?
    var name: String?
    var tip_new: Int = 0
    var type: Int = 0
    var web_url: String?
}



struct SBVMListModel: HandyJSON {
    var content: String?//是一个Json字符串
    var code: Int = 0
}

struct SBVMFeedModel: HandyJSON {
    var title: String?
    var abstract: String?
    var article_url: String?//播放地址
    var media_info: SBVMMediaInfoModel?
    var user_info: SBVMUserInfoModel?
    var large_image_list: SBVMImageInfoModel?
    var middle_image: SBVMImageInfoModel?

}
struct SBVMUserInfoModel: HandyJSON {
    var avatar_url: String?//小图标
    var name: String?
    
}
struct SBVMMediaInfoModel: HandyJSON {
    var avatar_url: String?
    var name: String?
    
}
struct SBVMImageInfoModel: HandyJSON {
    var height: Int = 0
    var width: Int = 0
    var uri: String?
    var url: String?

}










