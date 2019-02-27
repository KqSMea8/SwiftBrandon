//
//  UIColor+Utils.h
//
//  Created by Jokerlee on 2018/6/28.
//  Copyright © 2018年 Jokerlee. All rights reserved.
//
#import <UIKit/UIKit.h>

struct RGBA {
    UInt8 r;
    UInt8 g;
    UInt8 b;
    UInt8 a;
};

@interface UIColor (Utils)
    //---------------------------------------------------------------------------
#pragma mark macros for generating colors
    //---------------------------------------------------------------------------
#define RGBInt(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBAInt(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
    
#define RGBHex(rgb) [UIColor colorWithHexRGB:rgb]
#define RGBAHex(rgba) [UIColor colorWithHexRGBA:rgba]
#define ARGBHex(argb) [UIColor colorWithHexARGB:argb]
    
    //---------------------------------------------------------------------------
#pragma mark methods for generating colors
    //---------------------------------------------------------------------------
    
+ (UIColor *)colorWithHexRGB:(NSUInteger)hexRGB;
+ (UIColor *)colorWithHexRGBA:(NSUInteger)hexRGBA;
+ (UIColor *)colorWithHexARGB:(NSUInteger)hexARGB;
+ (UIColor *)colorWithHexStringRGB:(NSString *)hexRGB;
    
    //---------------------------------------------------------------------------
#pragma mark methods for color converting
    //---------------------------------------------------------------------------
    
- (NSString *)toHexRGB;
- (NSString *)toHexRGBA;
- (NSString *)toHexARGB;
    
- (struct RGBA)toRGBA;
    
    @end

