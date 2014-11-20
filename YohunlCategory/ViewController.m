//
//  ViewController.m
//  YohunlCategory
//
//  Created by lingyohunl on 14/11/14.
//  Copyright (c) 2014年 yohunl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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
    
   
    
}
//#pragma message(MMNSDictionaryOfVariableBindings(button1,button1))
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
