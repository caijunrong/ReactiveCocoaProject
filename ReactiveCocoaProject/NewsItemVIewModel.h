//
//  NewsItemVIewModel.h
//  ReactiveCocoaProject
//
//  Created by biyabi on 15/11/6.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelObject.h"

@interface NewsItemVIewModel : NSObject

@property (nonatomic, assign) CGFloat height;

- (instancetype)initWithEvent:(ModelObject *)event;

@end
