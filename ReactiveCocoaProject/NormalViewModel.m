//
//  NormalViewModel.m
//  ReactiveCocoaProject
//
//  Created by biyabi on 15/11/5.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import "NormalViewModel.h"
#import "APPManager.h"

@implementation NormalViewModel

- (void)initialize{
    
    [self updateNewsInfoDataWithpage:1];
    
//    RAC(self, viewColor) = [[RACObserve(self, newsViewModel)
//    map:^id(NewsModel *newsViewModel) {
//        if (newsViewModel != nil) {
//            return [UIColor blueColor];
//        }
//        return [UIColor redColor];
//    }]
//    distinctUntilChanged];
    
    

}

- (RACSignal *)updateNewsInfoDataWithpage:(NSInteger)page{
    APPManager *appManager = [[APPManager alloc]init];
    RACSignal *signal = [appManager requestNewsWithSpecialID:1 andPageIndex:page Model:NewsModel.class];
//                         doNext:^(NewsModel *nsModel) {
//                             NSLog(@"nsModel:%@",nsModel);
//                             self.newsViewModel = nsModel;
//                         }];
    [signal subscribeNext:^(NewsModel *nsModel) {
        //        NSLog(@"nsModel:%@",nsModel);
        self.newsViewModel = nsModel;
    }];
    
    return signal;
}

@end
