//
//  NSObject+GLFoundationGuardian.m
//  GLFoundationGuardian
//
//  Created by Gaolin on 2018/3/13.
//  Copyright © 2018年 Gaolin. All rights reserved.
//

#import "NSObject+GLFoundationGuardian.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#if _INTERNAL_FG_ENABLED

@implementation NSObject (GLFoundationGuardian)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self swizzleInstanceSEL:@selector(setValue:forKey:)
                         withSEL:@selector(gl_setValue:forKey:)];
        
        [self swizzleInstanceSEL:@selector(setValue:forKeyPath:)
                         withSEL:@selector(gl_setValue:forKeyPath:)];
        
        [self swizzleInstanceSEL:@selector(setValue:forUndefinedKey:)
                         withSEL:@selector(gl_setValue:forUndefinedKey:)];
        
        [self swizzleInstanceSEL:@selector(setValuesForKeysWithDictionary:)
                         withSEL:@selector(gl_setValuesForKeysWithDictionary:)];
    });
}

#pragma mark - Public
+ (void)swizzleClassSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL {
    
    [self swizzleClassSEL:originalSEL withSEL:swizzledSEL forClass:[self class]];
}

+ (void)swizzleClassSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL forClass:(Class)cls {
    
    Method originalMethod = class_getClassMethod(cls, originalSEL);
    Method swizzledMethod = class_getClassMethod(cls, swizzledSEL);
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

+ (void)swizzleInstanceSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL {
    
    [self swizzleInstanceSEL:originalSEL withSEL:swizzledSEL forClass:[self class]];
}

+ (void)swizzleInstanceSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL forClass:(Class)cls {
    
    Method originalMethod = class_getInstanceMethod(cls, originalSEL);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSEL);
    
    BOOL didAddMethod =
    class_addMethod(cls,
                    originalSEL,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(cls,
                            swizzledSEL,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }

}

+ (void)resolveException:(NSException *)exception withDescription:(NSString *)descripation {

#if DEBUG
    NSString *formatString =
    
@"\n\n \
======================================  GLFG Excaption  ======================================\n\n \
%@\n \
%@\n \
%@\n\n \
--------------------------------------- GLFG Stack Info --------------------------------------\n\n \
%@\n \
=======================================     GLFG End    ======================================\n\n \
";
    
    descripation = descripation.length ? descripation : @"default, only tyr and catch";
    GLLog(formatString, exception.name, exception.reason, descripation, exception.callStackSymbols);
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:exception.name message:exception.reason delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil];
    [alertView show];
#endif
}

#pragma mark - KVC - Swizzled Method
- (void)gl_setValue:(id)value forKey:(NSString *)key {
    
    @try {
        [self gl_setValue:value forKey:key];
    }
    @catch (NSException *exception) {
        [[self class] resolveException:exception withDescription:nil];
    }
}

- (void)gl_setValue:(id)value forKeyPath:(nonnull NSString *)keyPath {
    
    @try {
        [self gl_setValue:keyPath forKeyPath:keyPath];
    }
    @catch (NSException *exception) {
        [[self class] resolveException:exception withDescription:nil];
    }
}

- (void)gl_setValue:(id)value forUndefinedKey:(nonnull NSString *)key {
    
    @try {
        [self gl_setValue:value forUndefinedKey:key];
    }
    @catch (NSException *exception) {
        [[self class] resolveException:exception withDescription:nil];
    }
}

- (void)gl_setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues {
    
    @try {
        [self gl_setValuesForKeysWithDictionary:keyedValues];
    }
    @catch (NSException *exception) {
        [[self class] resolveException:exception withDescription:nil];
    }
}

@end

#endif
