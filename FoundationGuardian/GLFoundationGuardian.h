//
//  GLFoundationGuardian.h
//  GLFoundationGuardian
//
//  Created by Gaolin on 2018/3/13.
//  Copyright © 2018年 Gaolin. All rights reserved.
//

#ifndef GLFoundationGuardian_h
#define GLFoundationGuardian_h

#define FOUNDATION_GUARDIAN_ENABLED 1

#ifdef FOUNDATION_GUARDIAN_ENABLED
#define _INTERNAL_FG_ENABLED FOUNDATION_GUARDIAN_ENABLED
#else

#if DEBUG
#define _INTERNAL_FG_ENABLED 0
#else
#define _INTERNAL_FG_ENABLED 1
#endif

#endif

#if DEBUG
#define GLLog(...) NSLog(__VA_ARGS__)
#else
#define GLLog(...)
#endif

#endif /* GLFoundationGuardian_h */
