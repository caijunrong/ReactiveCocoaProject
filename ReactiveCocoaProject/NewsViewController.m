//
//  NewsViewController.m
//  ReactiveCocoaProject
//
//  Created by biyabi on 15/11/5.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import "NewsViewController.h"
#import "HomeViewController.h"
#import "NewsModel.h"
#import "UserCenterViewController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blueColor]];
    [self configTabBarHiddenWhenPush];
    UserCenterViewController *userCenter = [[UserCenterViewController alloc]init];
    [self.navigationController pushViewController:userCenter animated:NO];
    
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
