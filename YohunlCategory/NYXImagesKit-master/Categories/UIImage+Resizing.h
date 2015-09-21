//
//  UIImage+Resize.h
//  NYXImagesKit
//
//  Created by @Nyx0uf on 02/05/11.
//  Copyright 2012 Benjamin Godard. All rights reserved.
//  www.cococabyss.com
//

#import <UIKit/UIKit.h>
#import "NYXImagesHelper.h"


typedef enum
{
	NYXCropModeTopLeft,
	NYXCropModeTopCenter,
	NYXCropModeTopRight,
	NYXCropModeBottomLeft,
	NYXCropModeBottomCenter,
	NYXCropModeBottomRight,
	NYXCropModeLeftCenter,
	NYXCropModeRightCenter,
	NYXCropModeCenter
} NYXCropMode;


@interface UIImage (NYX_Resizing)

/**
 *  裁剪一个图片到指定的大小
 *
 *  @param newSize  需要裁剪的大小
 *  @param cropMode 裁剪的模式
 *
 *  @return 裁剪后的图片
 */
-(UIImage*)cropToSize:(CGSize)newSize usingMode:(NYXCropMode)cropMode;

/**
 *  裁剪一个图片到指定的大小,以NYXCropModeTopLeft模式裁剪
 *
 *  @param newSize 需要裁剪的大小
 *
 *  @return 裁剪后的图片
 */
-(UIImage*)cropToSize:(CGSize)newSize;

/**
 *  按照指定的比例来缩放
 *
 *  @param scaleFactor 要缩放的比率
 *
 *  @return 缩放后的图片
 */
-(UIImage*)scaleByFactor:(float)scaleFactor;

/**
 *  缩放一个图片到指定的大小,这个方法不是裁剪,当原图片的比例和缩放后的比率不一致时候,没有明显的压缩
 *
 *  @param newSize 指定的大小
 *
 *  @return 缩放后的图片
 */
-(UIImage*)scaleToFitSize:(CGSize)newSize;

@end
