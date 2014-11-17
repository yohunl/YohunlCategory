//
//  UIColor+Extension.m
//  YohunlCategory
//
//  Created by lingyohunl on 14/11/14.
//  Copyright (c) 2014年 yohunl. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)
+ (UIColor *)randomColor
{
    CGFloat red = (arc4random()%256)/256.0;
    CGFloat green = (arc4random()%256)/256.0;
    CGFloat blue = (arc4random()%256)/256.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}
@end
