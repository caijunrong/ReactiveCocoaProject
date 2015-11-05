//
//  MRCHomepageViewModel.m
//  ReactiveCocoaProject
//
//  Created by biyabi on 15/11/2.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import "MRCHomepageViewModel.h"

@interface MRCHomepageViewModel()

@property (nonatomic, assign, readwrite) MRCNewsViewModelType type;


@end

@implementation MRCHomepageViewModel

- (instancetype)initWithParams:(id)params{

    self = [super initWithParams:params];
    if (self) {
        self.type = [params[@"type"] unsignedIntegerValue];
        
    }
    return self;
}

- (void)initialize{

    [super initialize];
    
    if (self.type == MRCNewsViewModelTypeNews) {
        self.title = @"新闻";
    }else{
        self.title = @"活动";
    }
    
    

}


@end
