//
//  NewsViewModel.m
//  ReactiveCocoaProject
//
//  Created by biyabi on 15/11/6.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import "NewsViewModel.h"
#import "APPManager.h"
#import "NewsModel.h"
#import "NewsSubListModel.h"
#import "NewsItemVIewModel.h"
#import "ModelObject.h"

@interface NewsViewModel()

@property (nonatomic, copy, readwrite) NSArray *events;

@property (nonatomic, strong, readwrite) RACCommand *didClickLinkCommand;

@end

@implementation NewsViewModel


- (instancetype)initWithParams:(id)params{
    self = [super initWithParams:params];
    
    if (self) {
        
    }
    return self;
}

- (void)initialize{
    [super initialize];
    
    self.title = @"首页";
    
    self.shouldPullToRefresh = YES;
//    
//    self.didSelectCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(NSIndexPath *indexPath) {
//       
//        NSLog(@"index:%@",indexPath);
//        return [RACSignal empty];
//    }];
//    
//    APPManager *appManager = [[APPManager alloc]init];
//    RACSignal *signal = [[appManager requestNewsWithSpecialID:1 andPageIndex:1 Model:NewsModel.class]
//                         doNext:^(NewsModel *nsModel) {
//                             NSLog(@"nsModel:%@",nsModel);
//                             
//                         }];
//    [signal subscribeNext:^(NewsModel *nsModel) {
//                NSLog(@"nsModel:%@",nsModel);
//    }];
    
    
    //???
//    RAC(self, events) = [self.requestRemoteDataCommand 
}

- (BOOL (^)(NSError *))requestRemoteDataErrorsFilter {
    return ^BOOL(NSError *error) {
        if (error != nil) {
            CJRLogError(error);
            return NO;
        }
        return YES;
    };
}

- (id)fetchLocalData {
    NSArray *events = nil;
//
//    if (self.isCurrentUser) {
//        if (self.type == MRCNewsViewModelTypeNews) {
//            events = [OCTEvent mrc_fetchUserReceivedEvents];
//        } else if (self.type == MRCNewsViewModelTypePublicActivity) {
//            events = [OCTEvent mrc_fetchUserPerformedEvents];
//        }
//    }
//    
    return events;
}


- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page {
    RACSignal *fetchSignal = [RACSignal empty];
    
    APPManager *appManager = [[APPManager alloc]init];
    
    fetchSignal = [appManager requestNewsWithSpecialID:self.page andPageIndex:page Model:NewsModel.class];
    [[[fetchSignal doNext:^(NewsModel *model) {
        if (self.page == 1) {
            //这里最好是开启一个异步保存本地
            
        }
    }]map:^(NewsModel *model) {
        self.events = model.listArray;
        return model.listArray;
    }]subscribeNext:^(NSArray *modelArray) {
        self.events = modelArray;
    }];
    return fetchSignal;
}

- (NSArray *)dataSourceWithEvents:(NSArray *)eventst{
    if (eventst.count == 0) {
        return nil;
    }
    
    NSArray *viewModels = [eventst.rac_sequence map:^id(ModelObject *even) {
        NewsItemVIewModel *viewModel = [[NewsItemVIewModel alloc]initWithEvent:even];
        return viewModel;
    }].array;

    return viewModels;
}

@end
