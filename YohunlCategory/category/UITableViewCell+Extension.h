//
//  UITableViewCell+Extension.h
//  YohunlCategory
//
//  Created by lingyohunl on 14/11/14.
//  Copyright (c) 2014年 yohunl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Extension)

/*!
 *  @brief Current table view.
 *  @return If a table view includes this cell, returns the table view; otherwise nil;
 */
@property(nonatomic,readonly) UITableView *tableView;

/*!
 *  @brief Current table view.
 *  @return If a table view includes this cell, returns the index path for the table view; otherwise nil;
 */
@property(nonatomic,readonly) NSIndexPath *indexPath;

/**
 *  生成默认的reuser 标识符
 *
 *  @return 标识符
 */
+ (NSString *)reuseableIdentifier;

@end
