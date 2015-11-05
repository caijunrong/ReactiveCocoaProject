//
//  NormalViewModel.h
//  ReactiveCocoaProject
//
//  Created by biyabi on 15/11/5.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import "MRCViewModel.h"
#import "NewsModel.h"

@interface NormalViewModel : MRCViewModel

@property (nonatomic, strong) NewsModel *newsViewModel;

@property (nonatomic, strong) UIColor *viewColor;

@end
