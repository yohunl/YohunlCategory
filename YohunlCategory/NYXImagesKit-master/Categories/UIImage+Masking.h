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
 使用UIImage做为mask进行裁剪
 
 使用 void CGContextClipToMask(CGContextRef c, CGRect rect,  CGImageRef mask)
 
 第一个参数表示context 指针
 
 第二个参数表示clip到context的区域，也是mask 图片映射到context的区域
 
 第三个参数表示mask的图片，对于裁剪区域Rect中的点是否变化取决于mask图中的alpha值，若alpha为0，则对应clip rect中的点为透明，如果alpha为1，则对应clip Rect中的点无变化。
 
 另外CGContextClipToMask执行了类似  CGContextDrawImage 到rect区域的操作，不需要另外调用CGContextDrawImage。
 
 例子：
 
 下图为具有mask图片，图片中只有alpha值对于mask是有用的。 只有alpha不为0的才能够起作用,一般我们会使用黑色作为mask
 如下
 
 我们使用
 *
 *  @param mask mask用的图片
 *
 *  @return 裁剪的图片
 */
-(UIImage*)maskWithImage:(UIImage*)mask;

@end
