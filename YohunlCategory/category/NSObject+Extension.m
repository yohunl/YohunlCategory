//
//  NSObject+Extension.m
//  YohunlCategory
//
//  Created by lingyohunl on 14/11/14.
//  Copyright (c) 2014年 yohunl. All rights reserved.
//

#import "NSObject+Extension.h"

@implementation NSObject (Extension)

@end


@implementation NSObject (ObjCRuntime)
- (id)performSelector:(SEL)sel withObject:(id)obj1 withObject:(id)obj2 withObject:(id)obj3 {
    if (!sel) [self doesNotRecognizeSelector:sel];
    return ((id(*)(id, SEL, id, id, id))objc_msgSend)(self, sel, obj1, obj2, obj3);
}

- (id)performSelector:(SEL)sel withObject:(id)obj1 withObject:(id)obj2 withObject:(id)obj3 withObject:(id)obj4 {
    if (!sel) [self doesNotRecognizeSelector:sel];
    return ((id(*)(id, SEL, id, id, id, id))objc_msgSend)(self, sel, obj1, obj2, obj3, obj4);
   
}

 @end
