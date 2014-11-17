//
//  UITableViewCell+Extension.m
//  YohunlCategory
//
//  Created by lingyohunl on 14/11/14.
//  Copyright (c) 2014年 yohunl. All rights reserved.
//

#import "UITableViewCell+Extension.h"

@implementation UITableViewCell (Extension)
- (UITableView *)tableView {
    UIView *superview = self.superview;
    if (![superview isKindOfClass:[UITableView class]]) { // iOS7
        superview = superview.superview;
    }
    return (id)superview;
}

- (NSIndexPath *)indexPath {
    return [self.tableView indexPathForCell:self];
}

+ (NSString *)reuseableIdentifier
{
    return NSStringFromClass([self class]);
}
@end
