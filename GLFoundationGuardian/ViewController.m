//
//  ViewController.m
//  GLFoundationGuardian
//
//  Created by Gaolin on 2018/3/13.
//  Copyright © 2018年 Gaolin. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+GLFoundationGuardian.h"
#import "NSObject+GLFoundationGuardian.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[@[@1, @1]  mutableCopy] removeObjectsInRange:NSMakeRange(0, 100)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
