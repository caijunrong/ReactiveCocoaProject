//
//  MRCRouter.h
//  ReactiveCocoaProject
//
//  Created by biyabi on 15/11/2.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "MRCViewModelProtocol.h"

@protocol MRCViewProtocol;

@interface MRCRouter : NSObject

// Retrieves the shared router instance.
//
// Returns the shared router instance.
+ (instancetype)sharedInstance;

// Retrieves the view corresponding to the given view model.
//
// viewModel - The view model
//
// Returns the view corresponding to the given view model.
- (id<MRCViewProtocol>)viewControllerForViewModel:(id<MRCViewModelProtocol>)viewModel;

@end
