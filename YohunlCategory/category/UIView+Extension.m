//
//  UIView+Extension.m
//  YohunlCategory
//
//  Created by lingyohunl on 14/11/14.
//  Copyright (c) 2014年 yohunl. All rights reserved.
//

#import "UIView+Extension.h"
const NSTimeInterval UIAViewAnimationDefaultDuraton = 0.2;
@implementation UIView (Extension)

- (UITableViewCell*)ldp_superTableCell
{
    if ([self isKindOfClass:[UITableViewCell class]]) {
        return (UITableViewCell *)self;
    }
    if (self.superview) {
        UITableViewCell  * tableViewCell = [self.superview ldp_superTableCell];
        if (tableViewCell != nil) {
            return tableViewCell;
        }
    }
    return nil;
}

- (UIView *)ldp_findFirstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView ldp_findFirstResponder];
        if (firstResponder != nil) {
            return firstResponder;
        }
    }
    return nil;
}

@end



@implementation UIView (CALayer)

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

- (float)shadowAlpha {
    return self.layer.shadowOpacity;
}

- (void)setShadowAlpha:(float)shadowAlpha {
    self.layer.shadowOpacity = shadowAlpha;
}

- (UIColor *)shadowColor {
    return [UIColor colorWithCGColor:self.layer.shadowColor];
}

- (void)setShadowColor:(UIColor *)shadowColor {
    self.layer.shadowColor = shadowColor.CGColor;
}

- (CGSize)shadowOffset {
    return self.layer.shadowOffset;
}

- (void)setShadowOffset:(CGSize)shadowOffset {
    self.layer.shadowOffset = shadowOffset;
}

- (CGFloat)shadowRadius {
    return self.layer.shadowRadius;
}

- (void)setShadowRadius:(CGFloat)shadowRadius {
    self.layer.shadowRadius = shadowRadius;
}


@end


@implementation UIView (Animation)

- (void)setHidden:(BOOL)hidden animated:(BOOL)animated {
    if (!animated || self.hidden == hidden) {
        self.hidden = hidden;
        return;
    }
    
    CGFloat backupAlpha = self.alpha;
    CGFloat endAlpha;
    
    if (hidden) {
        endAlpha = .0;
    } else {
        self.alpha = .0;
        endAlpha = backupAlpha;
        self.hidden = NO;
    }
    
    [[self class] animateWithDuration:UIAViewAnimationDefaultDuraton animations:^(void) {
        self.alpha = endAlpha;
    } completion:^(BOOL finished) {
        if (hidden) {
            self.alpha = backupAlpha;
            self.hidden = YES; // value compatibility - this delayed action may be cause of unknown strange behavior.
        }
    }];
}

@end
