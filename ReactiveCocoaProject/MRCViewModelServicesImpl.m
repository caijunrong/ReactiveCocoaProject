//
//  MRCViewModelServicesImpl.m
//  ReactiveCocoaProject
//
//  Created by biyabi on 15/11/2.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import "MRCViewModelServicesImpl.h"

@implementation MRCViewModelServicesImpl

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void)pushViewModel:(id<MRCViewModelProtocol>)viewModel animated:(BOOL)animated {}

- (void)popViewModelAnimated:(BOOL)animated {}

- (void)popToRootViewModelAnimated:(BOOL)animated {}

- (void)presentViewModel:(id<MRCViewModelProtocol>)viewModel animated:(BOOL)animated completion:(VoidBlock)completion {}

- (void)dismissViewModelAnimated:(BOOL)animated completion:(VoidBlock)completion {}

- (void)resetRootViewModel:(id<MRCViewModelProtocol>)viewModel {}


@end
