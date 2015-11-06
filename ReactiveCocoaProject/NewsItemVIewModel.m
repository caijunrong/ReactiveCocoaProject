//
//  NewsItemVIewModel.m
//  ReactiveCocoaProject
//
//  Created by biyabi on 15/11/6.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import "NewsItemVIewModel.h"

@interface NewsItemVIewModel()
@property (nonatomic, strong, readwrite) ModelObject *event;

@end

@implementation NewsItemVIewModel
- (instancetype)initWithEvent:(ModelObject *)event {
    self = [super init];
    if (self) {
        self.event = event;
    }
    return self;
}
@end
