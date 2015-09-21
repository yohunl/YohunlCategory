//
//  UIImage+Tint.m
//
//  Created by yohunl

//

#import "UIImage+Tint.h"


@implementation UIImage (FDDTint)


- (UIImage *)imageTintedWithColor:(UIColor *)color
{
	// This method is designed for use with template images, i.e. solid-coloured mask-like images.
	return [self imageTintedWithColor:color fraction:0.0]; // default to a fully tinted mask of the image.
}


- (UIImage *)imageTintedWithColor:(UIColor *)color fraction:(CGFloat)fraction
{
    //kCGBlendModeDestinationIn 等参数的表示什么? R表示结果，S表示包含alpha的原色，D表示包含alpha的目标色，Ra，Sa和Da分别是三个的alpha
	if (color) {
		// Construct new image the same size as this one.
		UIImage *image;
		
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0
		if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
			UIGraphicsBeginImageContextWithOptions([self size], NO, 0.f); // 0.f for scale means "scale for device's main screen".
		} else {
			UIGraphicsBeginImageContext([self size]);
		}
#else
		UIGraphicsBeginImageContext([self size]);
#endif
		CGRect rect = CGRectZero;
		rect.size = [self size];
		
		// Composite tint color at its own opacity.
		[color set];
		UIRectFill(rect);
		
		// Mask tint color-swatch to this image's opaque mask.
		// We want behaviour like NSCompositeDestinationIn on Mac OS X.
		[self drawInRect:rect blendMode:kCGBlendModeDestinationIn alpha:1.0];
		
		// Finally, composite this image over the tinted mask at desired opacity.
		if (fraction > 0.0) {
			// We want behaviour like NSCompositeSourceOver on Mac OS X.
			[self drawInRect:rect blendMode:kCGBlendModeSourceAtop alpha:fraction];
		}
		image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		
		return image;
	}
	
	return self;
}






- (UIImage *)imageWithBlendMode:(CGBlendMode)blendMode tintColor:(UIColor *)tintColor {
    UIImage *img;
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0); //开始图片上下文绘制
    
    [tintColor setFill]; //填充颜色
    CGRect newRect = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(newRect);
    [self drawInRect:newRect blendMode:blendMode alpha:1.0]; //设置绘画透明混合模式和透明度
    if (blendMode == kCGBlendModeOverlay) {
        [self drawInRect:newRect blendMode:kCGBlendModeDestinationIn alpha:1.0]; //能保留透明度信息
    }
    
    img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext(); //结束图片上下文绘制
    return img;
}




+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, .0);//最后一个参数取0,则使用的是[[UIScreen mainScreen]scale]
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [color set];
    CGContextFillRect(context, CGRectMake(.0, .0, size.width, size.height));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



+ (UIImage *)imageWithColor:(UIColor *)color {
    return [self imageWithColor:color size:CGSizeMake(1.0, 1.0)];
}



+ (UIImage *)circularImageWithColor:(UIColor *)color withDiamter:(NSUInteger)diameter
{
    return [self circularImageWithColor:color withDiamter:diameter scale:0.0];
}

+ (UIImage *)circularImageWithColor:(UIColor *)color withDiamter:(NSUInteger)diameter  scale:(CGFloat)scale {
    NSParameterAssert(color != nil);
    NSParameterAssert(diameter > 0);
    CGRect frame = CGRectMake(0.0f, 0.0f, diameter, diameter);
    
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *imgPath = [UIBezierPath bezierPathWithOvalInRect:frame];
    [imgPath addClip];
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillEllipseInRect(context, frame);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return newImage;
}





+(UIImage *)paopaoWithColor:(UIColor *)color size:(CGSize)size {
    
    
    CGRect frame = CGRectMake(0.0f, 0.0f, size.width, size.height);
    CGFloat scale = 2;
    //由于我们使用的是 没有匹配Ip6和6+.很奇怪[[UIScreen mainScreen] scale]竟然是2,但是lldb打印又是3  并且,在这种模式下 iPhone6plus这个宏返回的竟然是 640*1136,并不能判断ip6+,所以只能采取另外的方式来判断了
    UIScreen *screen = [UIScreen mainScreen];
    if ([screen  respondsToSelector:@selector(nativeBounds)]  ) {
        CGRect rect = [screen nativeBounds];
        if (rect.size.height > 1480) {//6+  scale 应该是3
            scale = 3;
        }
        else {
            scale = [[UIScreen mainScreen] scale];
        }
    }
    else {
        scale = [[UIScreen mainScreen] scale];
    }
    
    CGRect frame2 = CGRectInset(frame, -3, -3);
    UIGraphicsBeginImageContextWithOptions(frame2.size, NO, scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: frame cornerRadius: 4];
    [color setFill];
    [rectanglePath fill];
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    CGFloat midx = CGRectGetMidX(frame);
    [bezierPath moveToPoint: CGPointMake(midx - 4, CGRectGetMaxY(frame))];
    [bezierPath addLineToPoint: CGPointMake(midx , CGRectGetMaxY(frame) + 6)];
    [bezierPath addLineToPoint: CGPointMake(midx + 4, CGRectGetMaxY(frame))];
    //[bezierPath moveToPoint: CGPointMake(CGRectGetMidX(frame) - 4, CGRectGetMaxY(frame))];
    [bezierPath closePath];
    [color setFill];
    [bezierPath fill];
    
    
    
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    CGContextRestoreGState(context);
    UIGraphicsEndImageContext();
    return newImage;

    
    
}




+(void)drawLinearGradient:(CGContextRef)context colorBottom:(UIColor *)colorBottom topColor:(UIColor *)topColor frame:(CGRect)frame{
    //使用rgb颜色空间
    CGColorSpaceRef colorSpace=CGColorSpaceCreateDeviceRGB();
    
    //创建起点颜色
    CGColorRef
    beginColor = colorBottom.CGColor;
    
    //创建终点颜色
    CGColorRef
    endColor = topColor.CGColor;
    
    //创建颜色数组
    CFArrayRef
    colorArray = CFArrayCreate(kCFAllocatorDefault, (const void*[]){beginColor,
        endColor}, 2, nil);
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)colorArray, NULL);
    
    
    /*绘制线性渐变
     context:图形上下文
     gradient:渐变色
     startPoint:起始位置
     endPoint:终止位置
     options:绘制方式,kCGGradientDrawsBeforeStartLocation 开始位置之前就进行绘制，到结束位置之后不再绘制，
     kCGGradientDrawsAfterEndLocation开始位置之前不进行绘制，到结束点之后继续填充
     */
    CGContextDrawLinearGradient(context, gradient, CGPointZero, CGPointMake(frame.size.width, frame.size.height), kCGGradientDrawsAfterEndLocation);
    
    //释放颜色空间
    CFRelease(colorArray);
    CGColorSpaceRelease(colorSpace);
}



+(UIImage*)maskImage:(UIImage*)originImage toPath:(UIBezierPath*)path{
    UIGraphicsBeginImageContextWithOptions(originImage.size, NO, 0);
    [path addClip];
    [originImage drawAtPoint:CGPointZero];
    UIImage* img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}



@end
