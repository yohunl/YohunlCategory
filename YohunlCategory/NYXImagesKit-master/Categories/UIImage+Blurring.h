//
//  UIImage+Blurring.h
//  NYXImagesKit
//
//  Created by @Nyx0uf on 03/06/11.
//  Copyright 2012 Benjamin Godard. All rights reserved.
//  www.cococabyss.com
//

#import <UIKit/UIKit.h>
#import "NYXImagesHelper.h"


@interface UIImage (NYX_Blurring)
/**
 *  高斯模糊一张图片
 *
 *  @param bias 高斯模糊的数值
 *
 *  @return 模糊后的图片
 */
-(UIImage*)gaussianBlurWithBias:(NSInteger)bias;

@end
