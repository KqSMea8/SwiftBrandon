//
//  UIColor+Utils.m
//
//  Created by Jokerlee on 2018/6/28.
//  Copyright © 2018年 Jokerlee. All rights reserved.
//

#import "UIColor+Utils.h"

@implementation UIColor (Utils)
    
+ (UIColor *)colorWithIntegerRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue {
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0f];
}
    
+ (UIColor *)colorWithIntegerRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}
    
+ (UIColor *)colorWithHexRGB:(NSUInteger)hexRGB {
    return [UIColor colorWithIntegerRed:((hexRGB & 0xFF0000) >> 16) green:((hexRGB & 0x00FF00) >> 8) blue:(hexRGB & 0x0000FF) alpha:1.0f];
}
    
+ (UIColor *)colorWithHexRGBA:(NSUInteger)hexRGBA {
    return [UIColor colorWithIntegerRed:((hexRGBA & 0xFF000000) >> 24) green:((hexRGBA & 0x00FF0000) >> 16) blue:((hexRGBA & 0x0000FF00) >> 8) alpha:(hexRGBA & 0x000000FF)/255.0f];
}
    
+ (UIColor *)colorWithHexARGB:(NSUInteger)hexARGB {
    return [UIColor colorWithIntegerRed:((hexARGB & 0x00FF0000) >> 16) green:((hexARGB & 0x0000FF00) >> 8) blue:(hexARGB & 0x000000FF) alpha:((hexARGB & 0xFF000000) >> 24)/255.0f];
}
    
- (NSString *)toHexRGB {
    CGColorRef color = self.CGColor;
    size_t count = CGColorGetNumberOfComponents(color);
    const CGFloat *components = CGColorGetComponents(color);
    
    static NSString *stringFormat = @"%02x%02x%02x";
    
    if (count == 2) {
        // Grayscale
        NSUInteger grey = (NSUInteger)(components[0] * (CGFloat)255);
        return [NSString stringWithFormat:stringFormat, grey, grey, grey];
    }
    else if (count == 4) {
        // RGB
        return [NSString stringWithFormat:stringFormat,
                (NSUInteger)(components[0] * (CGFloat)255),
                (NSUInteger)(components[1] * (CGFloat)255),
                (NSUInteger)(components[2] * (CGFloat)255)];
    }
    
    // Unsupported color space
    return nil;
}
    
- (NSString *)toHexARGB {
    CGColorRef color = self.CGColor;
    size_t count = CGColorGetNumberOfComponents(color);
    const CGFloat *components = CGColorGetComponents(color);
    
    static NSString *stringFormat = @"%02x%02x%02x%02x";
    
    if (count == 2) {
        // Grayscale
        NSUInteger grey = (NSUInteger)(components[0] * (CGFloat)255);
        NSUInteger alpha = (NSUInteger)(components[3] * (CGFloat)255);
        return [NSString stringWithFormat:stringFormat, grey, grey, grey, alpha];
    }
    else if (count == 4) {
        // RGBA
        return [NSString stringWithFormat:stringFormat,
                (NSUInteger)(components[3] * (CGFloat)255),
                (NSUInteger)(components[0] * (CGFloat)255),
                (NSUInteger)(components[1] * (CGFloat)255),
                (NSUInteger)(components[2] * (CGFloat)255)];
    }
    
    // Unsupported color space
    return nil;
}
    
- (NSString *)toHexRGBA {
    CGColorRef color = self.CGColor;
    size_t count = CGColorGetNumberOfComponents(color);
    const CGFloat *components = CGColorGetComponents(color);
    
    static NSString *stringFormat = @"%02x%02x%02x%02x";
    
    if (count == 2) {
        // Grayscale
        NSUInteger grey = (NSUInteger)(components[0] * (CGFloat)255);
        NSUInteger alpha = (NSUInteger)(components[3] * (CGFloat)255);
        return [NSString stringWithFormat:stringFormat, grey, grey, grey, alpha];
    }
    else if (count == 4) {
        // RGBA
        return [NSString stringWithFormat:stringFormat,
                (NSUInteger)(components[0] * (CGFloat)255),
                (NSUInteger)(components[1] * (CGFloat)255),
                (NSUInteger)(components[2] * (CGFloat)255),
                (NSUInteger)(components[3] * (CGFloat)255)];
    }
    
    // Unsupported color space
    return nil;
}
    
- (struct RGBA)toRGBA {
    
    struct RGBA rgba = {0,0,0,0};
    
    CGColorRef color = self.CGColor;
    size_t count = CGColorGetNumberOfComponents(color);
    const CGFloat *components = CGColorGetComponents(color);
    
    if (count == 2) {
        // Grayscale
        NSUInteger grey = (NSUInteger)(components[0] * (CGFloat)255);
        NSUInteger alpha = (NSUInteger)(components[3] * (CGFloat)255);
        rgba.a = alpha;
        rgba.r = grey;
        rgba.g = grey;
        rgba.b = grey;
        return rgba;
    } else if (count == 4) {
        // RGBA
        rgba.a = (NSUInteger)(components[3] * (CGFloat)255);
        rgba.r = (NSUInteger)(components[0] * (CGFloat)255);
        rgba.g = (NSUInteger)(components[1] * (CGFloat)255);
        rgba.b = (NSUInteger)(components[2] * (CGFloat)255);
        return rgba;
    }
    // Unsupported color space
    return rgba;
}
    
+ (UIColor *)colorWithHexStringRGB:(NSString *)hexColor {
    
    if(!hexColor || [hexColor isKindOfClass:[NSNull class]]){
        return [UIColor blackColor];
    }
    
    hexColor = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 7 characters if it includes '#'
    if ([hexColor length] < 6)
    return [UIColor blackColor];
    
    // strip # if it appears
    if ([hexColor hasPrefix:@"#"])
    hexColor = [hexColor substringFromIndex:1];
    
    // if the value isn't 6 characters at this point return
    // the color black
    if ([hexColor length] != 6)
    return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    NSString *rString = [hexColor substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [hexColor substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [hexColor substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}
    
    
    @end

