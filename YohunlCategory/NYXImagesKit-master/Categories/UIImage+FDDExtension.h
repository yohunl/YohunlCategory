//
//  UIImage+FDDExtension.h
//  YohunlCategory
//
//  Created by lingyohunl on 15/9/22.
//  Copyright © 2015年 yohunl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+Tint.h"
@interface UIImage (FDDExtension)
/**
 *  生成一张截屏的图片
 *
 *  @return 返回截屏的图片
 */
+ (UIImage *)screenshot;

/**
 *  生成一张圆形的图片
 *
 *  @param diameter 圆形的直径
 *
 *  @return 圆形的图片
 */
- (UIImage *)circularWithDiamter:(NSUInteger)diameter;


@end
