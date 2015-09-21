//
//  UIImage+Enhancing.m
//  NYXImagesKit
//
//  Created by @Nyx0uf on 03/12/11.
//  Copyright 2012 Benjamin Godard. All rights reserved.
//  www.cococabyss.com
//


#import "UIImage+Enhancing.h"
#import <CoreImage/CoreImage.h>

/*
 CIRedEyeCorrection：修复因相机的闪光灯导致的各种红眼
 CIFaceBalance：调整肤色
 CIVibrance：在不影响肤色的情况下，改善图像的饱和度
 CIToneCurve：改善图像的对比度
 CIHighlightShadowAdjust：改善阴影细节*/
@implementation UIImage (NYX_Enhancing)

-(UIImage*)autoEnhance
{
	/// No Core Image, return original image
	if (![CIImage class])
		return self;

	CIImage* ciImage = [[CIImage alloc] initWithCGImage:self.CGImage];

    //取得除了红眼滤镜外的所有的对当前图片可用的滤镜
	NSArray* adjustments = [ciImage autoAdjustmentFiltersWithOptions:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:kCIImageAutoAdjustRedEye]];

	for (CIFilter* filter in adjustments)
	{
		[filter setValue:ciImage forKey:kCIInputImageKey];
		ciImage = filter.outputImage;
	}

	CIContext* ctx = [CIContext contextWithOptions:nil];
	CGImageRef cgImage = [ctx createCGImage:ciImage fromRect:[ciImage extent]];
	UIImage* final = [UIImage imageWithCGImage:cgImage];
	CGImageRelease(cgImage);
	return final;
}

-(UIImage*)redEyeCorrection
{
	/// No Core Image, return original image
	if (![CIImage class])
		return self;

	CIImage* ciImage = [[CIImage alloc] initWithCGImage:self.CGImage];

	/// Get the filters and apply them to the image
	NSArray* filters = [ciImage autoAdjustmentFiltersWithOptions:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:kCIImageAutoAdjustEnhance]];
	for (CIFilter* filter in filters)
	{
		[filter setValue:ciImage forKey:kCIInputImageKey];
		ciImage = filter.outputImage;
	}

	/// Create the corrected image
	CIContext* ctx = [CIContext contextWithOptions:nil];
	CGImageRef cgImage = [ctx createCGImage:ciImage fromRect:[ciImage extent]];
	UIImage* final = [UIImage imageWithCGImage:cgImage];
	CGImageRelease(cgImage);
	return final;
}

@end
