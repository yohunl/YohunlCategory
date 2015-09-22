//
//  ColorUtils.h
//
//  Version 1.1.3
//
//  Created by Nick Lockwood on 19/11/2011.
//  Copyright (c) 2011 Charcoal Design
//
//  Distributed under the permissive zlib License
//  Get the latest version from here:
//
//  https://github.com/nicklockwood/ColorUtils
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
//


#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wauto-import"
#pragma GCC diagnostic ignored "-Wobjc-missing-property-synthesis"


#import <UIKit/UIKit.h>


@interface UIColor (ColorUtils)

@property (nonatomic, readonly) CGFloat red;
@property (nonatomic, readonly) CGFloat green;
@property (nonatomic, readonly) CGFloat blue;
@property (nonatomic, readonly) CGFloat alpha;

/**
 *  注册一个颜色到字典中去,方便以后提取
 *
 *  @param color 要注册的颜色
 *  @param name  注册的颜色的名字
 */
+ (void)registerColor:(UIColor *)color forName:(NSString *)name;

/**
 *  从一个RGB的字符串,或者是已经注册的颜色名称来创建一个颜色
 *
 *  @param string RGB的字符串,或者是已经注册的颜色名称  
 *  RGB的样式可以是  #FFF 00ff00  0x00ff00 #ff0000 f5a #ff550023 (多两位,是alpha的值)
 *  已经注册名字 是使用registerColor:forName注册一个颜色值的颜色的名称
 *
 *  @return 创建一个颜色
 */
+ (instancetype)colorWithString:(NSString *)string;

/**
 *  从一个RGB的整型值创建一个颜色值
 *
 *  @param rgb rgb的颜色值
 *
 *  @return 创建一个颜色值
 */
+ (instancetype)colorWithRGBValue:(uint32_t)rgb;
/**
 *  从一个RGB的整型值创建一个带有alpha的颜色值
 *
 *  @param rgba rgb的颜色值
 *
 *  @return 创建一个颜色值
 */
+ (instancetype)colorWithRGBAValue:(uint32_t)rgba;

/**
 *  从一个RGB的字符串,或者是已经注册的颜色名称来创建一个颜色
 *
 *  @param string RGB的字符串,或者是已经注册的颜色名称
 *  RGB的样式可以是  #FFF 00ff00  0x00ff00 #ff0000 f5a #ff550023 (多两位,是alpha的值)
 *  已经注册名字 是使用registerColor:forName注册一个颜色值的颜色的名称
 *
 *  @return 创建一个颜色
 */
- (instancetype)initWithString:(NSString *)string;


- (instancetype)initWithRGBValue:(uint32_t)rgb;
- (instancetype)initWithRGBAValue:(uint32_t)rgba;

/**
 *  返回颜色的RGB颜色的整形值
 *
 *  @return
 *
 */
- (uint32_t)RGBValue;

/**
 *   返回颜色的RGB颜色+Alpha的整形值
 *
 *  @return 返回颜色的RGB颜色+Alpha的整形值
 */
- (uint32_t)RGBAValue;

/**
 *  返回颜色的RGB 十六进制的表示
 *
 *  @return 返回的是  0xff786f 样式的
 */
- (NSString *)hexString;

- (BOOL)isMonochromeOrRGB;

/**
 *  两个颜色值的等效性判断
 *
 *  @param object 另一个颜色值
 *
 *  @return YES 两个等效的  NO两个不等效的
 */
- (BOOL)isEquivalent:(id)object;
/**
 *  两个颜色值的等效性判断
 *
 *  @param color 另一个颜色值
 *
 *  @return YES 两个等效的  NO两个不等效的
 */
- (BOOL)isEquivalentToColor:(UIColor *)color;

- (instancetype)colorWithBrightness:(CGFloat)brightness;
- (instancetype)colorBlendedWithColor:(UIColor *)color factor:(CGFloat)factor;

/**
 *  .我们经常看到,当我们定义一个颜色后,希望能再定义一个稍微深一点的dark色值,尤其是在按钮上,我们希望这么做,其实代码可以实现的 生成一个颜色的darken颜色
 *
 *  @param value 参数值
 *
 *  @return 生成一个颜色的darken颜色,一般参考取值 0.12
 */
- (instancetype)colorByDarkeningColorWithValue:(CGFloat)value;

@end


#pragma GCC diagnostic pop
