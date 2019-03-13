//
//  SBrVideoViewModel.swift
//  SwiftBrandon
//
//  Created by 朱玉辉 on 2019/3/12.
//  Copyright © 2019年 yuhuiMr. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON

class SBrVideoViewModel: NSObject {
//    // 外部传值请求接口
//    var categoryType :Int = 0
//    convenience init(categoryType: Int = 0) {
//        self.init()
//        self.categoryType = categoryType
//    }
//
//    var categoryVoList:[SBVMCategoryVos]?
    
    // - 数据源更新
    typealias SBrVideoDataHandleCallback = () -> Void
    var categoryHandleBlock:SBrVideoDataHandleCallback?
}


// - 获取头条-西瓜视频-分类数据
extension SBrVideoViewModel {
    ///---
    func reqCategoryLocalData(callback:([SBVMCategoryVos])->()) {
        // 1. 获取json文件路径
        let path = Bundle.main.path(forResource: "video_api_get_category_v3", ofType: "json")
        // 2. 获取json文件里面的内容,NSData格式
        let jsonData = NSData(contentsOfFile: path!)
        // 3. 解析json内容
        let json = JSON(jsonData!)
        if let mappedObject = JSONDeserializer<SBVMCategoryVos>.deserializeModelArrayFrom(json: json["data"].description) {
            
            let categoryVoList:[SBVMCategoryVos] = mappedObject as! [SBVMCategoryVos]
            callback(categoryVoList)
        }

    }
    func reqCategoryNetData(callback:@escaping ([SBVMCategoryVos])->()) {
        
        var categoryVoList:[SBVMCategoryVos] = []
        // 首页直播接口请求
        SBrVideoAPIProvider.request(.getCategory) { result in
            switch result {
            case let .success(response):
                // 解析数据
                let data = try? response.mapJSON()
                let json = JSON(data!)
                // 从字符串转换为对象实例
                if let mappedObject = JSONDeserializer<SBVMCategoryVos>.deserializeModelArrayFrom(json: json["data"].description) {
                    categoryVoList = mappedObject as! [SBVMCategoryVos]
                    callback(categoryVoList)
                }
            case let .failure(error):
                MBProgressHUD.showError(error.errorDescription)
                callback(categoryVoList)
            }
                
        }
    }
}




// 获取头条-西瓜视频-推荐数据
extension SBrVideoViewModel {
    func reqTuijianLocalData(callback:([SBVMFeedModel])->()) {
        // 1. 获取json文件路径
        let path = Bundle.main.path(forResource: "video_api_tuijian", ofType: "json")
        // 2. 获取json文件里面的内容,NSData格式
        let jsonData = NSData(contentsOfFile: path!)
        // 3. 解析json内容
        let json = JSON(jsonData!)
        if let mappedObject = JSONDeserializer<SBVMListModel>.deserializeModelArrayFrom(json: json["data"].description) {
            
            var feedModels = [SBVMFeedModel]()
            
            let categoryVoList:[SBVMListModel] = mappedObject as! [SBVMListModel]
            for item in categoryVoList{
                if let obj = JSONDeserializer<SBVMFeedModel>.deserializeFrom(json: item.content){
                    feedModels.append(obj)
                }
            }
            callback(feedModels)
        }
        
    }
}



