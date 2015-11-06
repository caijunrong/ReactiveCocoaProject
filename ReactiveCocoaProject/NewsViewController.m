//
//  NewsViewController.m
//  ReactiveCocoaProject
//
//  Created by biyabi on 15/11/5.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModel.h"
#import "NewsItemVIewModel.h"
#import "NewsSubListModel.h"
#import "NewsViewModel.h"
#import "APPManager.h"

#import "UserCenterViewController.h"

@interface NewsViewController ()

@property (nonatomic, strong, readonly) NewsViewModel *viewModel;

@property (nonatomic, strong) NewsModel *getModel;

@end

@implementation NewsViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blueColor]];
    [self configTabBarHiddenWhenPush];
//    UserCenterViewController *userCenter = [[UserCenterViewController alloc]init];
//    [self.navigationController pushViewController:userCenter animated:NO];
    
    NSLog(@"self.viewModel:%@",self.viewModel);
    
    [[self.viewModel requestRemoteDataSignalWithPage:1]
     subscribeNext:^(NewsModel *x) {
        NSLog(@"x%@",x);
    }];
    
    [self updateNewsInfoDataWithpage:1];
    
    [RACObserve(self, getModel) subscribeNext:^(NewsModel *x) {
        NSLog(@"newsViewModel--------------:%@",x);
        NSLog(@"x----------:%@",x);
    }];
}

- (RACSignal *)updateNewsInfoDataWithpage:(NSInteger)page{
    APPManager *appManager = [[APPManager alloc]init];
    RACSignal *signal = [[appManager requestNewsWithSpecialID:1 andPageIndex:page Model:NewsModel.class]
                         doNext:^(NewsModel *nsModel) {
                             NSLog(@"nsModel:%@",nsModel);
//                             self.getModel = nsModel;
                         }];
    [signal subscribeNext:^(NewsModel *nsModel) {
                NSLog(@"nsModel:%@",nsModel);
    }];
    
    return signal;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
