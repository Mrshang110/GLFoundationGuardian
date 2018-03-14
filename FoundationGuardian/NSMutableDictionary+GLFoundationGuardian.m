//
//  NSMutableDictionary+GLFoundationGuardian.m
//  GLFoundationGuardian
//
//  Created by Gaolin on 2018/3/14.
//  Copyright © 2018年 Gaolin. All rights reserved.
//

#import "NSMutableDictionary+GLFoundationGuardian.h"
#import "NSObject+GLFoundationGuardian.h"

#if _INTERNAL_FG_ENABLED

@implementation NSMutableDictionary (GLFoundationGuardian)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        
    });
}

@end

#endif
