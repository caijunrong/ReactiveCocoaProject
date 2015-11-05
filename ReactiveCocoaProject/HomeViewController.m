//
//  HomeViewController.m
//  ReactiveCocoaProject
//
//  Created by biyabi on 15/11/5.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import "HomeViewController.h"
#import "NewsViewController.h"
#import "CategoryViewController.h"
#import "UserCenterViewController.h"
#import "MRCNavigationController.h"
#import "UIImage+MRCOcticons.h"
#import "MRCNavigationController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationController *newsNavigationController = ({
        NewsViewController *newsViewController = [[NewsViewController alloc] init];
        
        UIImage *newsImage = [UIImage octicon_imageWithIdentifier:@"1z" size:CGSizeMake(25, 25)];
        newsViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"资讯" image:newsImage tag:1];
        
        [[UINavigationController alloc] initWithRootViewController:newsViewController];
    });
    
    self.tabBarController.viewControllers = @[newsNavigationController];
    
    
//    AppDelegate *appDel = ((AppDelegate *)[UIApplication sharedApplication].delegate);
    
//    [MRCSharedAppDelegate.navigationControllerStack pushNavigationController:newsNavigationController];
    
    [[self
      rac_signalForSelector:@selector(tabBarController:didSelectViewController:)
      fromProtocol:@protocol(UITabBarControllerDelegate)]
     subscribeNext:^(RACTuple *tuple) {
//         [MRCSharedAppDelegate.navigationControllerStack popNavigationController];
//         [MRCSharedAppDelegate.navigationControllerStack pushNavigationController:tuple.second];
         NSLog(@"--");
     }];
    self.tabBarController.delegate = self;

    
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
