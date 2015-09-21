//
//  UIImage+Filters.h
//  NYXImagesKit
//
//  Created by @Nyx0uf on 02/05/11.
//  Copyright 2012 Benjamin Godard. All rights reserved.
//  www.cococabyss.com
//

#import <UIKit/UIKit.h>
#import "NYXImagesHelper.h"


@interface UIImage (NYX_Filtering)

/**
 *  增亮图片
 *
 *  @param factor 增亮值,取值-255到 255
 *
 *  @return 增亮的图片
 */
-(UIImage*)brightenWithValue:(float)factor;

-(UIImage*)contrastAdjustmentWithValue:(float)value;

-(UIImage*)edgeDetectionWithBias:(NSInteger)bias;

-(UIImage*)embossWithBias:(NSInteger)bias;

-(UIImage*)gammaCorrectionWithValue:(float)value;

/**
 *  获取 灰度级图片,我们可以认为就是获取黑白照片
 *
 *  @return 生成的灰度级照片
 */
-(UIImage*)grayscale;


/**
 *  获取 有点类似医院拍片子的那种图片
 *
 *  @return 生成的图片
 */
-(UIImage*)invert;

/**
 *  获取指定的不透明度的图片
 *
 *  @param value 不透明度,取值从0.0-1.0 1.0完全不透明,默认的  0.0 完全透明
 *
 *  @return 指定不透明度的图片
 */
-(UIImage*)opacity:(float)value;


/**
 *  获取使用滤镜CISepiaTone 棕黑 的图片
 *
 *  @return 获取到的使用棕黑色调的滤镜图片
 */
-(UIImage*)sepia;

-(UIImage*)sharpenWithBias:(NSInteger)bias;

-(UIImage*)unsharpenWithBias:(NSInteger)bias;

@end
