//
//  UIView+Extension.h
//  YohunlCategory
//
//  Created by lingyohunl on 14/11/14.
//  Copyright (c) 2014年 yohunl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
/**
 *  获取view所在的tableViewCell,当然了,很明显需要这个视图自己或者父类(递归)是UITableViewCell
 *
 *  @return view所在的tableViewCell
 */
- (UITableViewCell*)ldp_superTableCell;

/**
 *  获取第一响应对象,可以是自己,或者自己的子类中寻找(递归)
 *
 *  @return 第一响应对象
 */
- (UIView *)ldp_findFirstResponder;


/**
 *  在自己的子视图中寻找类型为 cls的视图
 *
 *  @param cls 要找寻的视图类型
 *
 *  @return 找到的视图,如果没找到,返回nil
 */
- (UIView *)descendantOrSelfWithClass:(Class)cls;

/**
 *  在自己的父类中寻找类型为cls的视图
 *
 *  @param cls 要找寻的视图类型
 *
 *  @return 找到的视图,如果没找到,返回nil
 */
- (UIView *)ancestorOrSelfWithClass:(Class)cls;

/**
 *  移除所有的子类视图
 */
- (void)removeAllSubviews;


/**
 *  Rounded corners using performant Bezier Path
 *
 *  @param inRadius radius of the corners
 */
- (void)addBezierPathRoundedCornersWithRadius:(CGFloat)inRadius;

- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius;
- (void)setRoundedCornersWithRadius:(CGFloat)radius;


@end




@interface UIView (CALayer) //取自 https://github.com/youknowone/FoundationExtension
@property(assign) CGFloat borderWidth;
@property(copy) UIColor *borderColor;
@property(assign) CGFloat cornerRadius;

@property(retain) UIColor *shadowColor;
@property(assign) CGSize shadowOffset;
@property(assign) float shadowAlpha;
@property(assign) CGFloat shadowRadius;
@end


@interface UIView (Animation) //取自 https://github.com/youknowone/FoundationExtension
/*!
 *  @brief Set whether the view is hidden.
 *  @details If 'animated' property is NO, this method calls [-setHidden:][0]; Otherwise, when starting, object's 'hidden' property is set to NO. If given hidden parameter is YES, 'hidden' property is set to YES after end of animation. This may cause confliction with other animations or accessors.
 *  @param hidden If YES, the view become hidden; otherwise, NO.
 *  @param animated If YES, animates the transition; otherwise, does not.
 *  @see [hidden][0]
 [0]: http://developer.apple.com/library/ios/documentation/UIKit/Reference/UIView_Class/UIView/UIView.html#//apple_ref/occ/instp/UIView/hidden
 */
- (void)setHidden:(BOOL)hidden animated:(BOOL)animated;
@end