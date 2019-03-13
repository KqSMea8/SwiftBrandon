//
//  SBrConstants.swift
//  SwiftBrandon
//
//  Created by 朱玉辉 on 2019/2/27.
//  Copyright © 2019年 yuhuiMr. All rights reserved.
//

import UIKit

// MARK: ===================================变量宏定义=========================================

// MARK: 系统相关
/// Info
public let kAppBundleInfoVersion = Bundle.main.infoDictionary ?? Dictionary()
/// plist:  AppStore 使用VersionCode 1.0.1
public let kAppBundleVersion = (kAppBundleInfoVersion["CFBundleShortVersionString" as String] as? String ) ?? ""
/// plist: 例如 1
public let kAppBundleBuild = (kAppBundleInfoVersion["CFBundleVersion"] as? String ) ?? ""
public let kAppDisplayName = (kAppBundleInfoVersion["CFBundleDisplayName"] as? String ) ?? ""

// MARK: 系统相关
public let kiOSBase = 8.0
public let kOSGreaterOrEqualToiOS8 = ( (Double(UIDevice.current.systemVersion) ?? kiOSBase) > 8.0 ) ? true : false;
public let kOSGreaterOrEqualToiOS9 = ((Double(UIDevice.current.systemVersion) ?? kiOSBase) >= 9.0 ) ? true : false;
public let kOSGreaterOrEqualToiOS10 = ((Double(UIDevice.current.systemVersion) ?? kiOSBase) >= 10.0 ) ? true : false;
public let kOSGreaterOrEqualToiOS11 = ((Double(UIDevice.current.systemVersion) ?? kiOSBase) >= 11.0 ) ? true : false;
func iPhoneX() -> Bool {
    return UIScreen.main.bounds.size.height == 812.0
}

//设备宽高、机型
let kScreenBounds = UIScreen.main.bounds
let kScreenSize = kScreenBounds.size//屏幕大小
let kScreenWidth:CGFloat = kScreenSize.width//屏幕宽度
let kScreenHeight:CGFloat = kScreenSize.height//屏幕高度
let kStatusBarHeight:CGFloat = (iPhoneX() ? 44.0 : 20.0)//状态栏默认高度
let kNavBarContentHeight:CGFloat = 44.0//导航栏内容高度
let kNavBarHeight:CGFloat = (kStatusBarHeight + kNavBarContentHeight)//导航栏默认高度
let kTabBarHeight:CGFloat = (iPhoneX() ? 83.0 : 49.0)//Tabbar默认高度


// MARK: ============================================================================
// MARK: Dictory Array Strig Object 闭包方式
///过滤null对象
public let kFilterNullOfObj:((Any)->Any?) = {(obj: Any) -> Any? in
    if obj is NSNull {
        return nil
    }
    return obj
}

///过滤null的字符串，当nil时返回一个初始化的空字符串
public let kFilterNullOfString:((Any)->String) = {(obj: Any) -> String in
    if obj is String {
        return obj as! String
    }
    return ""
}

/// 过滤null的数组，当nil时返回一个初始化的空数组
public let kFilterNullOfArray:((Any)->Array<Any>) = {(obj: Any) -> Array<Any> in
    if obj is Array<Any> {
        return obj as! Array<Any>
    }
    return Array()
}


/// 过滤null的字典，当为nil时返回一个初始化的字典
public let kFilterNullOfDictionary:((Any) -> Dictionary<AnyHashable, Any>) = {( obj: Any) -> Dictionary<AnyHashable, Any> in
    if obj is Dictionary<AnyHashable, Any> {
        return obj as! Dictionary<AnyHashable, Any>
    }
    return Dictionary()
}


// MARK: ============================================================================
// MARK: 设置Nib、Stryboard、UIImage

/// 根据imageName创建一个UIImage
public let imageNamed:((String) -> UIImage? ) = { (imageName : String) -> UIImage? in
    return UIImage.init(named: imageName)
}


/// 根据Main.storyboard建立ViewController
public let VC_From_Main_SB:((String)-> UIViewController? ) = {(SBID : String) -> UIViewController? in
    return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier:SBID)
}


// MARK: ============================================================================
// MARK: 设置颜色
    //clearColor 透明色
let Clear_Color = UIColor.clear
    // rgb颜色转换（16进制->10进制）
func kRGBAColor(R:CGFloat,G:CGFloat,B:CGFloat,A:CGFloat) ->UIColor {
    return UIColor.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: A)
}
func kRGBColor(R:CGFloat,G:CGFloat,B:CGFloat) ->UIColor {
    return kRGBAColor(R: R, G: G, B: B, A: 1.0)
}
func kRGBHexColor(hexStringRGB:String) ->UIColor {
    return UIColor.init(hexStringRGB: hexStringRGB)
}

//主色调
let kMainColor = kRGBColor(R: 142, G: 190, B: 84)
//背景色
let kBackgroundColor = kRGBColor(R: 243, G: 244, B: 246)
//字体颜色
let kTextColor = kRGBColor(R: 102, G: 102, B: 102)
//灰色字体颜色
let kTextGrayColor = kRGBColor(R: 153, G: 153, B: 153)
//灰色线条
let kLineGrayColor = kRGBColor(R: 221, G: 221, B: 221)


