//
//  ViewController.m
//  YohunlCategory
//
//  Created by lingyohunl on 14/11/14.
//  Copyright (c) 2014年 yohunl. All rights reserved.
//

#import "ViewController.h"
#import "NYXImagesKit.h"
#import "UIImage+Alpha.h"
#import "UIImage+RoundedCorner.h"

#import "UIColor+Utils.h"


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"self.view.frame = %@",NSStringFromCGRect(self.view.frame) );
   UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.translatesAutoresizingMaskIntoConstraints = NO;
    //[button1 setTitle:@"button 1 button 2 button 3 button 4" forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"gujia_press"] forState:UIControlStateNormal];
    [button1 sizeToFit];
    //button1.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:button1];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:100.0f];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:100.0f];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-150.0f];
    constraint.priority = 751.0f;
    [self.view addConstraint:constraint];
    
    UIImage *image1 = [UIImage imageNamed:@"gujia_press"];
    UIImageView *imgVIew = [[UIImageView alloc]initWithImage:image1];
    [imgVIew sizeToFit];
    imgVIew.highlighted = YES;
    //imgVIew.frame = CGRectMake(100, 60, 100, 32);
    
    [self.view addSubview:imgVIew];
    
    MyView *view = [[MyView alloc]initWithFrame:imgVIew.frame];
    CGRect frame = view.frame;
    frame.origin.x = 100;
    view.frame = frame;
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
    label.font = [UIFont systemFontOfSize:15];
    label.text = @"jjfkdjf";
    label.textColor = [UIColor blackColor];
    label.frame = CGRectMake(100, 300, 100, 50);
    //[label sizeToFit];
    [self.view addSubview:label];
    
    [view setNeedsDisplay];
    
    UIImage *img = [UIImage imageNamed:@"hongyan.jpg"];
    //img = [img scaleToFitSize:CGSizeMake(70, 70)];
    //img = [img imageTintedWithColor:[UIColor redColor] fraction:0.6];
    
    //UIImage *img33 = [UIImage imageWithColor:[UIColor greenColor] size:CGSizeMake(20, 20)];
    UIImage *img33 = [UIImage imageNamed:@"400dianhua"];
    //img = [img maskWithImage:img33];
    //img = [img transparentBorderImage:5];
    img = [img circularWithDiamter:50];
    
    img = [UIImage imageStretchWithColor:UIColorFromRGB(0x4bc40a)];
    UIImageView *imgview = [[UIImageView alloc]initWithImage:img];
    imgview.frame = CGRectMake(0, 0, 100, 100);
    imgview.center = CGPointMake(150, 150);
    imgview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:imgview];
    
    UIImage *img2 = [UIImage imageWithColor:UIColorFromRGB(0x4bc40a)];
    UIImageView *imgview2 = [[UIImageView alloc]initWithImage:img2];
    imgview2.frame = CGRectMake(0, 0, 100, 100);
    imgview2.center = CGPointMake(150, 300);
    imgview2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:imgview2];
    
    
    UIColor *color = nil;
    CGFloat  red2 = color.red;
    NSInteger aa = color.RGBValue;
    NSString *stva = color.hexString;
    
    [self findNumFromStr];
    //[self touchUpInsideByThreadOne:nil];
    
    //测试
    UIImage *imageToCompress = [UIImage imageNamed:@"IMG_2280.JPG"];
    NSData *imageToCompressData = [[NSData alloc] initWithData:UIImageJPEGRepresentation(imageToCompress, 1)];
    
    NSLog(@"original size = %lu",(unsigned long)imageToCompressData.length);
    
    
    
    //Compressed image almost a 90% reduction
    UIImage *compressedImage = [imageToCompress scaleByFactor:0.3];
    NSData *icompressedData = [[NSData alloc] initWithData:UIImageJPEGRepresentation(compressedImage, 1)];
    NSLog(@"Compressed size: %lu",(unsigned long)icompressedData.length);
    
    
    
    
   
    
}
//#pragma message(MMNSDictionaryOfVariableBindings(button1,button1))
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(int)findNumFromStr
{
    NSString *originalString = @"a1b2c3d4e5f6g7h8i9j";
    
    // Intermediate
    NSMutableString *numberString = [[NSMutableString alloc] init];
    NSString *tempStr;
    NSScanner *scanner = [NSScanner scannerWithString:originalString];
    NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
    while (![scanner isAtEnd]) {
        // Throw away characters before the first number.
        [scanner scanUpToCharactersFromSet:numbers intoString:nil];
        
        // Collect numbers.
        [scanner scanCharactersFromSet:numbers intoString:&tempStr];
        [numberString appendString:tempStr];
        tempStr = @"";
    }
    // Result.
    int number = [numberString integerValue];
    
    return number;
}
//- (IBAction)touchUpInsideByThreadOne:(id)sender {
//    NSDate *da = [NSDate date];
//    NSString *daStr = [da description];
//    const char *queueName = [daStr UTF8String];
//    dispatch_queue_t myQueue = dispatch_queue_create(queueName, DISPATCH_QUEUE_CONCURRENT);
//    
//    dispatch_async(myQueue, ^{
//        //[NSThread sleepForTimeInterval:6];
//        NSLog(@"[NSThread sleepForTimeInterval:6];");
//    });
//    
//    dispatch_async(myQueue, ^{
//        //[NSThread sleepForTimeInterval:3];
//        NSLog(@"[NSThread sleepForTimeInterval:2.1];");
//    });
//    
//    dispatch_async(myQueue, ^{
//        //[NSThread sleepForTimeInterval:1];
//        NSLog(@"[NSThread sleepForTimeInterval:2];");
//    });
//    
//
//}
@end


@implementation MyView
-(void)drawRect:(CGRect)rect
//- (void)displayLayer:(CALayer *)theLayer
{
    [super drawRect:rect];
    //[super displayLayer:theLayer];
    
    UIImage *displayImage = [UIImage imageNamed:@"gujia_press"];
    const CGFloat scale = self.window.screen.scale;
    const CGRect bounds = self.bounds;
    
   
    UIGraphicsBeginImageContextWithOptions(bounds.size, NO, scale);
    [displayImage drawInRect:bounds];
    displayImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    CGRect imageBounds;
    imageBounds.origin = CGPointZero;
    imageBounds.size = displayImage.size;
    
    [[[UIColor blackColor] colorWithAlphaComponent:0.45] setFill];
    UIRectFill(imageBounds);
    CGBlendMode blendMode = kCGBlendModeNormal;
    blendMode = kCGBlendModeDestinationAtop;
    [displayImage drawInRect:imageBounds blendMode:blendMode alpha:1];
    displayImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
   

}

@end
