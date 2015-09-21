//
//  UIImage+Enhancing.h
//  NYXImagesKit
//
//  Created by @Nyx0uf on 03/12/11.
//  Copyright 2012 Benjamin Godard. All rights reserved.
//  www.cococabyss.com
//

#import <UIKit/UIKit.h>
@interface UIImage (NYX_Enhancing)

/**
 *  调用CIImage的滤镜自动优化图片
 *
 *  @return 优化后的图片
 */
-(UIImage*)autoEnhance;

/**
 *  调用CIImage的红眼滤镜来优化图片
 *
 *  @return 优化后的图片
 */
-(UIImage*)redEyeCorrection;

@end
