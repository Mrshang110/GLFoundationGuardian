//
//  NSMutableArray+GLFoundationGuardian.m
//  GLFoundationGuardian
//
//  Created by Gaolin on 2018/3/14.
//  Copyright © 2018年 Gaolin. All rights reserved.
//

#import "NSMutableArray+GLFoundationGuardian.h"
#import "NSObject+GLFoundationGuardian.h"

#if _INTERNAL_FG_ENABLED

@implementation NSMutableArray (GLFoundationGuardian)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class cls = NSClassFromString(@"__NSArrayM");
        [self swizzleInstanceSEL:@selector(objectAtIndex:)
                         withSEL:@selector(gl_objectAtIndex:)
                        forClass:cls];
        
        [self swizzleInstanceSEL:@selector(objectAtIndexedSubscript:)
                         withSEL:@selector(gl_objectAtIndexedSubscript:)
                        forClass:cls];
        
        [self swizzleInstanceSEL:@selector(setObject:atIndexedSubscript:)
                         withSEL:@selector(gl_setObject:atIndexedSubscript:)
                        forClass:cls];
        
        
        [self swizzleInstanceSEL:@selector(removeObjectAtIndex:)
                         withSEL:@selector(gl_removeObjectAtIndex:)
                        forClass:cls];
        
        [self swizzleInstanceSEL:@selector(insertObject:atIndex:)
                         withSEL:@selector(gl_insertObject:atIndex:)
                        forClass:cls];
    });
}

- (id)gl_objectAtIndex:(NSUInteger)index {
    
    id object = nil;
    
    @try {
        object = [self gl_objectAtIndex:index];
    }
    @catch (NSException *excaption) {
        [[self class] resolveException:excaption withDescription:nil];
    }
    @finally {
        return object;
    }
}

- (id)gl_objectAtIndexedSubscript:(NSUInteger)idx {
    
    id object = nil;
    
    @try {
        object = [self gl_objectAtIndexedSubscript:idx];
    }
    @catch (NSException *excaption) {
        [[self class] resolveException:excaption withDescription:nil];
    }
    @finally {
        return object;
    }
}

- (void)gl_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    
    @try {
        [self gl_setObject:obj atIndexedSubscript:idx];
    }
    @catch (NSException *excaption) {
        [[self class] resolveException:excaption withDescription:nil];
    }
}

- (void)gl_removeObjectAtIndex:(NSUInteger)index {
    
    @try {
        [self gl_removeObjectAtIndex:index];
    }
    @catch (NSException *excaption) {
        [[self class] resolveException:excaption withDescription:nil];
    }
}

- (void)gl_insertObject:(id)anObject atIndex:(NSUInteger)index {
    
    @try {
        [self gl_insertObject:anObject atIndex:index];
    }
    @catch (NSException *excaption) {
        [[self class] resolveException:excaption withDescription:nil];
    }
}

@end

#endif
