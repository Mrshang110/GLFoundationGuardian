//
//  NSString+GLFoundationGuardian.m
//  GLFoundationGuardian
//
//  Created by Gaolin on 2018/3/14.
//  Copyright © 2018年 Gaolin. All rights reserved.
//

#import "NSString+GLFoundationGuardian.h"
#import "NSObject+GLFoundationGuardian.h"

#if _INTERNAL_FG_ENABLED

@implementation NSString (GLFoundationGuardian)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class cls = NSClassFromString(@"__NSCFConstantString");
        
        [self swizzleInstanceSEL:@selector(substringWithRange:)
                         withSEL:@selector(gl_substringWithRange:)
                        forClass:cls];
        
        [self swizzleInstanceSEL:@selector(substringToIndex:)
                         withSEL:@selector(gl_substringToIndex:)
                        forClass:cls];
        
        [self swizzleInstanceSEL:@selector(substringFromIndex:)
                         withSEL:@selector(gl_substringFromIndex:)];
        
        [self swizzleInstanceSEL:@selector(characterAtIndex:)
                         withSEL:@selector(gl_characterAtIndex:)];
        
        
    });
}

#pragma mark - Message - Swizzled Method
- (NSString *)gl_substringWithRange:(NSRange)range {
    
    NSString *string = nil;
    
    @try {
        string = [self gl_substringWithRange:range];
    }
    @catch (NSException *exception) {
        [[self class] resolveException:exception withDescription:nil];
    }
    @finally {
        return string;
    }
}

- (NSString *)gl_substringFromIndex:(NSUInteger)from {
    
    NSString *string = nil;
    
    @try {
        string = [self gl_substringFromIndex:from];
    }
    @catch (NSException *exception) {
        [[self class] resolveException:exception withDescription:nil];
    }
    @finally {
        return string;
    }
}

- (NSString *)gl_substringToIndex:(NSUInteger)to {
    
    NSString *string = nil;
    
    @try {
        string = [self gl_substringToIndex:to];
    }
    @catch (NSException *exception) {
        [[self class] resolveException:exception withDescription:nil];
    }
    @finally {
        return string;
    }
}

- (unichar)gl_characterAtIndex:(NSUInteger)index {
    
    unichar character = ' ';
    
    @try {
        character = [self gl_characterAtIndex:index];
    }
    @catch (NSException *exception) {
        [[self class] resolveException:exception withDescription:nil];
    }
    @finally {
        return character;
    }
}

@end

#endif
