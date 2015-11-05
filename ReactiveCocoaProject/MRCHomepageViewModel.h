//
//  MRCHomepageViewModel.h
//  ReactiveCocoaProject
//
//  Created by biyabi on 15/11/2.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import "MRCTabBarViewModel.h"

typedef NS_ENUM(NSUInteger, MRCNewsViewModelType) {
    MRCNewsViewModelTypeNews,
    MRCNewsViewModelTypePublicActivity
};

@interface MRCHomepageViewModel : MRCTabBarViewModel

@property (nonatomic, assign, readonly) MRCNewsViewModelType type;


@end
