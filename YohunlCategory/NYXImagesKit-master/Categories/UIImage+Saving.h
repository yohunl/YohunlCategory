//
//  UIImage+Saving.h
//  NYXImagesKit
//
//  Created by @Nyx0uf on 05/05/11.
//  Copyright 2012 Benjamin Godard. All rights reserved.
//  www.cococabyss.com
//

#import <UIKit/UIKit.h>
#import "NYXImagesHelper.h"


typedef enum
{
	NYXImageTypePNG,
	NYXImageTypeJPEG,
	NYXImageTypeGIF,
	NYXImageTypeBMP,
	NYXImageTypeTIFF
} NYXImageType;


@interface UIImage (NYX_Saving)

-(BOOL)saveToURL:(NSURL*)url uti:(CFStringRef)uti backgroundFillColor:(UIColor*)fillColor;

-(BOOL)saveToURL:(NSURL*)url type:(NYXImageType)type backgroundFillColor:(UIColor*)fillColor;

-(BOOL)saveToURL:(NSURL*)url;

-(BOOL)saveToPath:(NSString*)path uti:(CFStringRef)uti backgroundFillColor:(UIColor*)fillColor;

-(BOOL)saveToPath:(NSString*)path type:(NYXImageType)type backgroundFillColor:(UIColor*)fillColor;

-(BOOL)saveToPath:(NSString*)path;

/**
 *  保存图片到相册
 *
 *  @return YES 保存成功 NO 失败
 */
-(BOOL)saveToPhotosAlbum;

+(NSString*)extensionForUTI:(CFStringRef)uti;

@end
