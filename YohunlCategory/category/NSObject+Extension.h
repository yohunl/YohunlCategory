//
//  NSObject+Extension.h
//  YohunlCategory
//
//  Created by lingyohunl on 14/11/14.
//  Copyright (c) 2014年 yohunl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

@end


/*!
 *  @brief NSObject [<objc/runtime.h>][0] extensions
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html
 */
@interface NSObject (ObjCRuntime)


/*! @name performSelector */

/*!
 *  @brief Invokes a method of the receiver with 3 parameter
 *  @param sel A selector that identifies the method to invoke. The method should take 3 argument of type id.
 *  @param obj1 a parameter
 *  @param obj2 a parameter
 *  @param obj3 a parameter
 *  @see [performSelector:withObject:][1]
 *  @see [performSelector:withObject:withObject:][2]
 *  @see performSelector:withObject:withObject:withObject:withObject:
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Protocols/NSObject_Protocol/Reference/NSObject.html#//apple_ref/occ/intfm/NSObject/performSelector:withObject:
 *      [2]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Protocols/NSObject_Protocol/Reference/NSObject.html#//apple_ref/occ/intfm/NSObject/performSelector:withObject:withObject:
 */
- (id)performSelector:(SEL)sel withObject:(id)obj1 withObject:(id)obj2 withObject:(id)obj3;

/*!
 *  @brief Invokes a method of the receiver with 4 parameter
 *  @param sel A selector that identifies the method to invoke. The method should take 4 argument of type id.
 *  @param obj1 a parameter
 *  @param obj2 a parameter
 *  @param obj3 a parameter
 *  @param obj4 a parameter
 *  @see [performSelector:withObject:][1]
 *  @see [performSelector:withObject:withObject:][2]
 *  @see performSelector:withObject:withObject:withObject:
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Protocols/NSObject_Protocol/Reference/NSObject.html#//apple_ref/occ/intfm/NSObject/performSelector:withObject:
 *      [2]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Protocols/NSObject_Protocol/Reference/NSObject.html#//apple_ref/occ/intfm/NSObject/performSelector:withObject:withObject:
 */
- (id)performSelector:(SEL)sel withObject:(id)obj1 withObject:(id)obj2 withObject:(id)obj3 withObject:(id)obj4;



@end