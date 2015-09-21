//
//  UIImage+Rotation.h
//  NYXImagesKit
//
//  Created by @Nyx0uf on 02/05/11.
//  Copyright 2012 Benjamin Godard. All rights reserved.
//  www.cococabyss.com
//

#import <UIKit/UIKit.h>
#import "NYXImagesHelper.h"


@interface UIImage (NYX_Rotating)

-(UIImage*)rotateInRadians:(float)radians;

-(UIImage*)rotateInDegrees:(float)degrees;

-(UIImage*)rotateImagePixelsInRadians:(float)radians;

-(UIImage*)rotateImagePixelsInDegrees:(float)degrees;

/**
 *  旋转图片180度
 *
 *  @return 旋转后的图片
 */
-(UIImage*)verticalFlip;

/**
 *  旋转图片90度
 *
 *  @return 旋转后的图片
 */
-(UIImage*)horizontalFlip;

/**
 *  生成图片的水平翻转图片
 *
 *  @param image 原图片
 *
 *  @return 水平翻转图片
 */
+ (UIImage *)horizontallyFlippedImageFromImage:(UIImage *)image;

@end
