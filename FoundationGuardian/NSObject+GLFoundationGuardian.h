//
//  NSObject+GLFoundationGuardian.h
//  GLFoundationGuardian
//
//  Created by Gaolin on 2018/3/13.
//  Copyright © 2018年 Gaolin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLFoundationGuardian.h"

#if _INTERNAL_FG_ENABLED

@interface NSObject (GLFoundationGuardian)

+ (void)swizzleClassSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL;
+ (void)swizzleClassSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL forClass:(Class)cls;

+ (void)swizzleInstanceSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL;
+ (void)swizzleInstanceSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL forClass:(Class)cls;

+ (void)resolveException:(NSException *)exception withDescription:(NSString *)descripation;

@end

#endif
