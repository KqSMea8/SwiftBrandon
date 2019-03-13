//
//  SBrVideoAPI.swift
//  SwiftBrandon
//
//  Created by 朱玉辉 on 2019/3/12.
//  Copyright © 2019年 yuhuiMr. All rights reserved.
//

import UIKit
import Moya

let SBrVideoAPIProvider = MoyaProvider<SBrVideoAPI>()

// 请求分类
public enum SBrVideoAPI {
    case getCategory
    
    case liveBannerList
    case liveRankList
    case liveList
    case categoryLiveList(channelId:Int)
    case categoryTypeList(categoryType:Int)
}

//http://ic.snssdk.com/video_api/get_category/v3/?fp=J2TrJlHbJlPrFlwb

// 请求配置
extension SBrVideoAPI: TargetType {
    // 服务器地址
    public var baseURL: URL {
        switch self {
        case .getCategory:
            return URL(string: "http://ic.snssdk.com/video_api")!
        case .liveBannerList:
            return URL(string: "http://adse.ximalaya.com")!
        case .categoryLiveList:
            return URL(string: "http://mobwsa.ximalaya.com")!
        default:
            return URL(string: "http://mobile.ximalaya.com")!
        }
    }
    
    // 各个请求的具体路径
    public var path: String {
        switch self {
        case .getCategory:
            return "/get_category/v3/"
            
        case .liveRankList:
            return "/lamia/v2/live/rank_list"
        case .liveList:
            return "/lamia/v8/live/homepage"
        case .categoryLiveList:
            return "/lamia/v4/live/subchannel/homepage"
        case .categoryTypeList:
            return "/lamia/v9/live/homepage"
        default:
            return "/focusPicture/ts-1532427241140"
        }
    }

    
    
    public var method: Moya.Method { return .get }
    public var task: Task {
        switch self {
        case .getCategory:
            let parmeters:[String : Any] = [
                "fp":"J2TrJlHbJlPrFlwbFSU1F2FePzT_",
                "version_code":"7.1.4",
                "tma_jssdk_version":"1.11.3.0",
                "app_name":"news_article",
                "vid":"D56F1066-00AF-46CB-A44F-74247358AA4A",
                "device_id":"3391023851",
                "channel":"App Store",
                "resolution":"640*1136",
                "aid":"13",
                "ab_feature":"z2",
                "ab_group":"z2",
                "openudid":"922c94a1904037a4251345a4ad9c69ebb44dea38",
                "update_version_code":"71419",
                "idfv":"D56F1066-00AF-46CB-A44F-74247358AA4A",
                "ac":"WIFI",
                "os_version":"9.3.1",
                "ssmix":"a",
                "device_platform":"iphone",
                "iid":"65815514325",
                "ab_client":"a1,f2,f7,e1",
                "device_type":"iPhone 5S",
                "idfa":"A0C939C8-E25F-45A6-BA5C-7CB8624851F4",
                "mas":"0086d8dc915cea1e434e1378d80ff7c42ea8cb83c8b0a05fef28ef",
                "as":"a215e74813321ce9c72779",
                "ts":"\(Int32(Date().timeIntervalSince1970))",
                "ab_version":"",
                "pos":""]
            return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
            
            
        case .categoryLiveList(let channelId):
            var parmeters = [
                "appid":0,
                "pageSize":40,
                "network":"WIFI",
                "operator":3,
                "scale":3,
                "pageId":1,
                "device":"iPhone",
                "version":"6.5.3",
                "xt": Int32(Date().timeIntervalSince1970)] as [String : Any]
            parmeters["channelId"] = channelId
            return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
        case .categoryTypeList(let categoryType):
            var parmeters = [
                "pageId":1,
                "pageSize":20,
                "sign":1,
                "timeToPreventCaching": Int32(Date().timeIntervalSince1970)] as [String : Any]
            parmeters["categoryType"] = categoryType
            return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
        default:
            let parmeters = [
                "appid":0,
                "categoryId":-3,
                "network":"WIFI",
                "operator":3,
                "scale":3,
                "uid":0,
                "device":"iPhone",
                "version":"6.5.3",
                "xt": Int32(Date().timeIntervalSince1970),
                "deviceId": UIDevice.current.identifierForVendor!.uuidString] as [String : Any]
            return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
        }
    }
    
    public var sampleData: Data { return "".data(using: String.Encoding.utf8)! }
    public var headers: [String : String]? { return nil }
}



