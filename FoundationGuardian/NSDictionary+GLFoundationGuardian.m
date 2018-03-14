//
//  NSDictionary+GLFoundationGuardian.m
//  GLFoundationGuardian
//
//  Created by Gaolin on 2018/3/14.
//  Copyright © 2018年 Gaolin. All rights reserved.
//

#import "NSDictionary+GLFoundationGuardian.h"
#import "NSObject+GLFoundationGuardian.h"

#if _INTERNAL_FG_ENABLED

@implementation NSDictionary (GLFoundationGuardian)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self swizzleClassSEL:@selector(dictionaryWithObjects:forKeys:count:)
                      withSEL:@selector(gl_dictionaryWithObjects:forKeys:count:)];
    });
}

#pragma mark - Message - Swizzled Method
+ (instancetype)gl_dictionaryWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt {
    
    id instance = nil;
    
    @try {
        instance = [self gl_dictionaryWithObjects:objects forKeys:keys count:cnt];
    }
    @catch (NSException *exception) {
        [[self class] resolveException:exception withDescription:nil];
    }
    @finally {
        return instance;
    }
}

@end

#endif
