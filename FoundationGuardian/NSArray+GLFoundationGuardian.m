//
//  NSArray+GLFoundationGuardian.m
//  GLFoundationGuardian
//
//  Created by Gaolin on 2018/3/13.
//  Copyright © 2018年 Gaolin. All rights reserved.
//

#import "NSArray+GLFoundationGuardian.h"
#import "NSObject+GLFoundationGuardian.h"

#if _INTERNAL_FG_ENABLED

@implementation NSArray (GLFoundationGuardian)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self swizzleClassSEL:@selector(arrayWithObjects:count:)
                      withSEL:@selector(gl_arrayWithObjects:count:)];
        
        [self swizzleInstanceSEL:@selector(objectAtIndexedSubscript:)
                         withSEL:@selector(gl_objectAtIndexedSubscript:)
                        forClass:NSClassFromString(@"__NSArrayI")];
        
        [self swizzleInstanceSEL:@selector(objectAtIndex:)
                         withSEL:@selector(gl_objectAtIndex:)];
        
        [self swizzleInstanceSEL:@selector(objectAtIndex:)
                         withSEL:@selector(gl___NSArrayI_objectAtIndex:)
                        forClass:NSClassFromString(@"__NSArrayI")];
        
        [self swizzleInstanceSEL:@selector(objectAtIndex:)
                         withSEL:@selector(gl___NSSingleObjectArrayI_objectAtIndex:)
                        forClass:NSClassFromString(@"__NSSingleObjectArrayI")];
        
        [self swizzleInstanceSEL:@selector(objectAtIndex:)
                         withSEL:@selector(gl___NSArray0_objectAtIndex:)
                        forClass:NSClassFromString(@"__NSArray0")];
        
        [self swizzleInstanceSEL:@selector(objectsAtIndexes:)
                         withSEL:@selector(gl_objectsAtIndexes:)];
    });
}


+ (NSArray *)gl_arrayWithObjects:(const id [])objects count:(NSUInteger)cnt {
    
    id instance = nil;
    
    @try {
        instance = [self gl_arrayWithObjects:objects count:cnt];
    }
    @catch (NSException *exception) {
        [[self class] resolveException:exception withDescription:nil];
    }
    @finally {
        return instance;
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

- (id)gl___NSArrayI_objectAtIndex:(NSUInteger)index {
    
    id object = nil;
    
    @try {
        object = [self gl___NSArrayI_objectAtIndex:index];
    }
    @catch (NSException *excaption) {
        [[self class] resolveException:excaption withDescription:nil];
    }
    @finally {
        return object;
    }
}

- (id)gl___NSArray0_objectAtIndex:(NSUInteger)index {
    
    id object = nil;
    
    @try {
        object = [self gl___NSArray0_objectAtIndex:index];
    }
    @catch (NSException *excaption) {
        [[self class] resolveException:excaption withDescription:nil];
    }
    @finally {
        return object;
    }
}

- (id)gl___NSSingleObjectArrayI_objectAtIndex:(NSUInteger)index {
    
    id object = nil;
    
    @try {
        object = [self gl___NSSingleObjectArrayI_objectAtIndex:index];
    }
    @catch (NSException *excaption) {
        [[self class] resolveException:excaption withDescription:nil];
    }
    @finally {
        return object;
    }
}

- (NSArray *)gl_objectsAtIndexes:(NSIndexSet *)indexes {
    
    id object = nil;
    
    @try {
        object = [self gl_objectsAtIndexes:indexes];
    }
    @catch (NSException *excaption) {
        [[self class] resolveException:excaption withDescription:nil];
    }
    @finally {
        return object;
    }
}

@end

#endif
