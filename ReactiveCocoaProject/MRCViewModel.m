//
//  MRCViewModel.m
//  ReactiveCocoaProject
//
//  Created by biyabi on 15/11/2.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import "MRCViewModel.h"

@interface MRCViewModel()

@property (nonatomic, strong, readwrite) id params;

@end


@implementation MRCViewModel
@synthesize params   = _params;
@synthesize title    = _title;
@synthesize subtitle = _subtitle;
@synthesize callback = _callback;
@synthesize errors   = _errors;
@synthesize titleViewType = _titleViewType;
@synthesize willDisappearSignal = _willDisappearSignal;
@synthesize shouldFetchLocalDataOnViewModelInitialize = _shouldFetchLocalDataOnViewModelInitialize;
@synthesize shouldRequestRemoteDataOnViewDidLoad = _shouldRequestRemoteDataOnViewDidLoad;

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    MRCViewModel *viewModel = [super allocWithZone:zone];
    
    @weakify(viewModel)
    [[viewModel
      rac_signalForSelector:@selector(initWithParams:)]
    	subscribeNext:^(id x) {
            @strongify(viewModel)
            [viewModel initialize];
        }];
    
    return viewModel;
}

- (instancetype)initWithParams:(id)params {
    self = [super init];
    if (self) {
        self.shouldFetchLocalDataOnViewModelInitialize = YES;
        self.shouldRequestRemoteDataOnViewDidLoad = YES;
        self.title    = params[@"title"];
        self.params   = params;
    }
    return self;
}

- (RACSubject *)errors {
    if (!_errors) _errors = [RACSubject subject];
    return _errors;
}

- (RACSubject *)willDisappearSignal {
    if (!_willDisappearSignal) _willDisappearSignal = [RACSubject subject];
    return _willDisappearSignal;
}

- (void)initialize {}

@end
