//
//  NSMutableString+GLFoundationGuardian.m
//  GLFoundationGuardian
//
//  Created by Gaolin on 2018/3/14.
//  Copyright © 2018年 Gaolin. All rights reserved.
//

#import "NSMutableString+GLFoundationGuardian.h"
#import "NSObject+GLFoundationGuardian.h"

#if _INTERNAL_FG_ENABLED

@implementation NSMutableString (GLFoundationGuardian)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class cls = NSClassFromString(@"__NSCFString");
        
        [self swizzleInstanceSEL:@selector(insertString:atIndex:)
                         withSEL:@selector(gl_insertString:atIndex:)
                        forClass:cls];
        
        [self swizzleInstanceSEL:@selector(deleteCharactersInRange:)
                         withSEL:@selector(gl_deleteCharactersInRange:)
                        forClass:cls];
        
        [self swizzleInstanceSEL:@selector(replaceCharactersInRange:withString:)
                         withSEL:@selector(gl_replaceCharactersInRange:withString:)
                        forClass:cls];
    });
}

#pragma mark - Message - Swizzled Method
- (void)gl_insertString:(NSString *)aString atIndex:(NSUInteger)loc {
    
    @try {
        [self gl_insertString:aString atIndex:loc];
    }
    @catch (NSException *exception) {
        [[self class] resolveException:exception withDescription:nil];
    }
}

- (void)gl_deleteCharactersInRange:(NSRange)range {
    
    @try {
        [self gl_deleteCharactersInRange:range];
    }
    @catch (NSException *exception) {
        [[self class] resolveException:exception withDescription:nil];
    }
}

- (void)gl_replaceCharactersInRange:(NSRange)range withString:(NSString *)aString {
    
    @try {
        [self gl_replaceCharactersInRange:range withString:aString];
    }
    @catch (NSException *exception) {
        [[self class] resolveException:exception withDescription:nil];
    }
}

@end

#endif
