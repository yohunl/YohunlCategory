//
//  UIImage+Masking.h
//  NYXImagesKit
//
//  Created by @Nyx0uf on 02/06/11.
//  Copyright 2012 Benjamin Godard. All rights reserved.
//  www.cococabyss.com
//

#import <UIKit/UIKit.h>
#import "NYXImagesHelper.h"


@interface UIImage (NYX_Masking)

/**
 *  采用mask来裁剪我们的图片,相当于把我们的图片用mask的外形裁剪出来! 程序内部已经创建了mask的alpha图片
 *  通过CGImageCreateWithMask函数去创建一个处理过的不规则的图片的话，那么你需要有一张原图是带alpha通道的图片，和一个不带alpha通道的遮罩图
 *
 *  @param mask mask用的图片
 *
 *  @return 裁剪的图片
 */
-(UIImage*)maskWithImage:(UIImage*)mask;

@end
