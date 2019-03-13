//
//  SBrTLVideoElseAPI.swift
//  SwiftBrandon
//
//  Created by 朱玉辉 on 2019/3/12.
//  Copyright © 2019年 yuhuiMr. All rights reserved.
//

import UIKit
import Moya

//let LBFMHomeLiveAPIProvider = MoyaProvider<LBFMHomeLiveAPI>()
//
//// 请求分类
//public enum LBFMHomeLiveAPI {
//    case liveClassifyList
//    case liveBannerList
//    case liveRankList
//    case liveList
//    case categoryLiveList(channelId:Int)
//    case categoryTypeList(categoryType:Int)
//}
//
//http://ic.snssdk.com/video_api/get_category/v3/?fp=J2TrJlHbJlPrFlwb
//
//// 请求配置
//extension LBFMHomeLiveAPI: TargetType {
//    // 服务器地址
//    public var baseURL: URL {
//        switch self {
//        case .liveBannerList:
//            return URL(string: "http://adse.ximalaya.com")!
//        case .categoryLiveList:
//            return URL(string: "http://mobwsa.ximalaya.com")!
//        default:
//            return URL(string: "http://mobile.ximalaya.com")!
//        }
//    }
//    
//    // 各个请求的具体路径
//    public var path: String {
//        switch self {
//        case .liveClassifyList:
//            return "/lamia/v1/homepage/materials HTTP/1.1"
//        case .liveRankList:
//            return "/lamia/v2/live/rank_list"
//        case .liveList:
//            return "/lamia/v8/live/homepage"
//        case .categoryLiveList:
//            return "/lamia/v4/live/subchannel/homepage"
//        case .categoryTypeList:
//            return "/lamia/v9/live/homepage"
//        default:
//            return "/focusPicture/ts-1532427241140"
//        }
//    }
//    
//    func getparmeters() -> [String : Any] {
//        var parmeters:[String : Any] = [
//            "fp":"J2TrJlHbJlPrFlwbFSU1F2FePzT_",
//            "version_code":"7.1.4",
//            "tma_jssdk_version":"1.11.3.0",
//            "app_name":"news_article",
//            "vid":"D56F1066-00AF-46CB-A44F-74247358AA4A",
//            "device_id":"3391023851",
//            "channel":"App Store",
//            "resolution":"640*1136",
//            "aid":"13",
//            "ab_feature":"z2",
//            "ab_group":"z2",
//            "openudid":"922c94a1904037a4251345a4ad9c69ebb44dea38",
//            "update_version_code":"71419",
//            "idfv":"D56F1066-00AF-46CB-A44F-74247358AA4A",
//            "ac":"WIFI",
//            "os_version":"9.3.1",
//            "ssmix":"a",
//            "device_platform":"iphone",
//            "iid":"65815514325",
//            "ab_client":"a1,f2,f7,e1",
//            "device_type":"iPhone 5S",
//            "idfa":"A0C939C8-E25F-45A6-BA5C-7CB8624851F4",
//            "mas":"0086d8dc915cea1e434e1378d80ff7c42ea8cb83c8b0a05fef28ef",
//            "as":"a215e74813321ce9c72779",
//            "ts":"1552382243",
//
//            "ab_version":"773349,775311,775483,741712,554836,765190,549647,777494,780366,752140,644057,615292,769088,546699,727988,757281,690848,625065,744332,778448,759202,731481,777541,747886,777818,770311,773221,679100,777763,735201,767991,725676,779958,753038,780078,661452,755478,660830,775090,768226,773491,754087,756441,762250,770569,662176,775729,779948,665174,674051,770489,691934,170988,170989,693495,643890,773775,777880,374117,736955,718154,778668,613178,550042,435214,774338,777473,767364,649428,614096,677131,522765,776035,773035,416055,716149,710077,764640,684976,707372,693249,746027,733659,758018,775821,471407,603443,714195,745833,767350,773096,603387,603400,603404,603406,777728,661898,740405,769180,668775,737593,768905,766975,759153,777934,737675,778736,778155,706369,645714,607361,731482,740305,774151,775321,635530,778938,739390,764921,662099,768976,777600,770462,768704,780412,769736,765018,780195,717949,737334,737948,668774,766808,779429,777334,777448,124648,661781,751761,457481,649402,755876",
//            "pos":"5pe9vb/88Pzt0fLz vTp6Pn4v72nva2xl729v/zw/O3R/On06ej5 L 9p72tsZe9vb/x/On06ej5 L 9p72upLOkraSor6WqpKisrKStpLGXvb2/8fLz vTp6Pn4v72nvaysq7OrqKypqqWspKmupbGXvb2//vTp5L 9p72/eBEKeScxv7GXvb2/8fL /PHC8fzp O7pwu3y7r 9p73ml729vb2/6fTw O7p/PDtv72nvayoqK upaykqKizq62tqqypsZe9vb29v/7y8u/59PP86fjL/PHo O6/vae95pe9vb29vb2/8fLz vTp6Pn4v72nvaysq7OrqKypqqWspKmupbGXvb29vb29v/H86fTp6Pn4v72nva6ks6StpKivpaqkqKyspK2kl729vb3gsZe9vb29v/706eS/vae9v3gRCnknMXglH7 xl729vb2//Pn57/ju7r 9p72/ewsteBATeBEKdSoyv5e9veCX4A==",
//
//            
//            "xt": Int32(Date().timeIntervalSince1970)]
//        
//        return parmeters
//    }
//    
//    
//    
//    
//    
//    public var method: Moya.Method { return .get }
//    public var task: Task {
//        switch self {
//        case .categoryLiveList(let channelId):
//            var parmeters = [
//                "appid":0,
//                "pageSize":40,
//                "network":"WIFI",
//                "operator":3,
//                "scale":3,
//                "pageId":1,
//                "device":"iPhone",
//                "version":"6.5.3",
//                "xt": Int32(Date().timeIntervalSince1970)] as [String : Any]
//            parmeters["channelId"] = channelId
//            return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
//        case .categoryTypeList(let categoryType):
//            var parmeters = [
//                "pageId":1,
//                "pageSize":20,
//                "sign":1,
//                "timeToPreventCaching": Int32(Date().timeIntervalSince1970)] as [String : Any]
//            parmeters["categoryType"] = categoryType
//            return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
//        default:
//            let parmeters = [
//                "appid":0,
//                "categoryId":-3,
//                "network":"WIFI",
//                "operator":3,
//                "scale":3,
//                "uid":0,
//                "device":"iPhone",
//                "version":"6.5.3",
//                "xt": Int32(Date().timeIntervalSince1970),
//                "deviceId": UIDevice.current.identifierForVendor!.uuidString] as [String : Any]
//            return .requestParameters(parameters: getparmeters(), encoding: URLEncoding.default)
//        }
//    }
//    
//    public var sampleData: Data { return "".data(using: String.Encoding.utf8)! }
//    public var headers: [String : String]? { return nil }
//}
//
//
//
