//
//  UIImage+Tint.m
//
//  Created by yohunl

//

#import <UIKit/UIKit.h>

@interface UIImage (FDDTint)
/**
 *  采用color blend改变图片颜色
 *
 *  @param color tint颜色
 *
 *  @return 混合后的图片
 */
- (UIImage *)imageTintedWithColor:(UIColor *)color;

/**
 *  图片的 opaque(不透明的) mask遮罩
 *
 *  @param color    遮罩的颜色
 *  @param fraction 遮罩的透明度
 *
 *  @return 返回遮罩后的图
 */
- (UIImage *)imageTintedWithColor:(UIColor *)color fraction:(CGFloat)fraction;
/**
 *  以指定的混合模式,使用指定的颜色来混合图形和某种颜色
 *
 *  @param blendMode 混合的模式
 *  @param tintColor 目标色
 *
 *  @return 混合后的图片
 */
- (UIImage *)imageWithBlendMode:(CGBlendMode)blendMode tintColor:(UIColor *)tintColor;

/**
 *  创建 颜色值为color的size大小的图片
 *
 *  @param color 要创建的图片的颜色
 *  @param size  图片的大小
 *
 *  @return 创建的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
/**
 *  创建 颜色值为color的size为(1,1)大小的图片
 *
 *  @param color 要创建的图片的颜色
 *
 *  @return 创建的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *   创建 颜色值为color的size为(10,10)大小的可拉伸的图片
 *
 *  @param color 要创建的图片的颜色
 *
 *  @return 创建的图片
 */
+ (UIImage *)imageStretchWithColor:(UIColor *)color;

/**
 *  使用颜色color创建一个直径为diameter的图片.默认的缩放因子scale和mainScreen一样的
 *
 *  @param color    颜色值
 *  @param diameter 直径
 *
 *  @return 创建的图片
 */
+ (UIImage *)circularImageWithColor:(UIColor *)color withDiamter:(NSUInteger)diameter;

/**
 *  使用颜色color创建一个直径为diameter的图片.缩放因子scale
 *
 *  @param color    颜色值
 *  @param diameter 直径
 *  @param scale    缩放因子
 *
 *  @return 创建的图片
 */
+ (UIImage *)circularImageWithColor:(UIColor *)color withDiamter:(NSUInteger)diameter  scale:(CGFloat)scale;

/**
 *  使用颜色color创建一个中间带箭头的泡泡
 *
 *  @param color 泡泡的颜色
 *  @param size  大小
 *
 *  @return 创建的图片
 */
+(UIImage *)paopaoWithColor:(UIColor *)color size:(CGSize)size;



@end
