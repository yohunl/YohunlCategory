//
//  NSString+Extension.m
//  YohunlCategory
//
//  Created by lingyohunl on 14/11/20.
//  Copyright (c) 2014年 yohunl. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
- (BOOL)hasSubstring:(NSString *)aString {
    return [self rangeOfString:aString].location != NSNotFound;
}


@end
