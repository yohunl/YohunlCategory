// UIImage+RoundedCorner.h
// Created by Trevor Harmon on 9/20/09.
// Free for personal or commercial use, with or without modification.
// No warranty is expressed or implied.

// Extends the UIImage class to support making rounded corners
#import <UIKit/UIKit.h>

@interface UIImage (RoundedCorner)
/**
 *  生成一张圆角图片
 *
 *  @param cornerSize 圆角的大小
 *  @param borderSize 边的宽度大小
 *
 *  @return 生成的圆角图片
 */
- (UIImage *)roundedCornerImage:(NSInteger)cornerSize borderSize:(NSInteger)borderSize;
@end
