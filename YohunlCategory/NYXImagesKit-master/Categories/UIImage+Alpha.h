// UIImage+Alpha.h
// Created by Trevor Harmon on 9/20/09.
// Free for personal or commercial use, with or without modification.
// No warranty is expressed or implied.

// Helper methods for adding an alpha layer to an image
#import <UIKit/UIKit.h>

@interface UIImage (Alpha)
/**
 *  判断图片是否有alpha通道
 * 如何判断是否有alpha通道其实很简单，你在mac里右键显示简介的时候，有显示该图片的信息，其中一行就是显示是否有alpha通道
 *
 *  @return YES 有 NO 没有
 */
- (BOOL)hasAlpha;

/**
 *  生成一张带有alpha通道的图片
 *
 *  @return 带有alpha通道的图片
 */
- (UIImage *)imageWithAlpha;

/**
 *  创建一个边界宽度为borderSize的,边界颜色为透明的图片
 *
 *  @param borderSize 边界的宽度
 *
 *  @return 边界宽度为borderSize的,边界颜色为透明的图片
 */
- (UIImage *)transparentBorderImage:(NSUInteger)borderSize;
@end
