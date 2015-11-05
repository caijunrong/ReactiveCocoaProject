//`
//  ViewController.m
//  ReactiveCocoaProject
//
//  Created by biyabi on 15/10/27.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import "ViewController.h"
#import "APPClient.h"
#import "NewsModel.h"
#import "NewsSubListModel.h"
#import "APPManager.h"

@interface ViewController ()
@property (nonatomic, strong) NewsModel *newsViewModel;
@property (nonatomic, strong) NewsModel *newsViewModel2;
@property (nonatomic, strong, readwrite) RACCommand *requestRemoteDataCommand;
@property (nonatomic, strong) NSError *errors;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    APPClient *client = [[APPClient alloc]init];
//    
//    [client GetRequest:[NSString stringWithFormat:@"http://magazine.78dian.com/list/1-1-1-12.html"] parameter:nil complete:^(id responseObject, NSError *error) {
////        NSLog(@"responseObject:%@",responseObject);
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
//        
//        NewsModel *newsModel = [MTLJSONAdapter modelOfClass:[NewsModel class] fromJSONDictionary:dic error:nil];
//        NSLog(@"newsModel:%@",newsModel);
//        NSLog(@"newsMode summaryl:%@",((NewsSubListModel *)newsModel.listArray[0]).summary);
//    
//    }];

    [self updateNewsInfoDataWithpage:1];
    
    [RACObserve(self, newsViewModel) subscribeNext:^(NewsModel *x) {
        NSLog(@"newsViewModel--------------:%@",self.newsViewModel);
        NSLog(@"x----------:%@",x);
    }];
    
//    self.newsViewModel = [[NewsModel alloc] init];
//    self.newsViewModel = nil;
    
//    RACObserve(self, newsViewModel)subscribe:(id<RACSubscriber>)
    
    
//    [client PostRequest:@"http://mws.biyabi.com/WebService.asmx/GetTraderListByCommodity" parameter:[NSDictionary dictionaryWithObjectsAndKeys:@"52036",@"p_iCommodityTagID",@"1",@"p_iCount", nil] complete:^(id responseObject, NSError *error) {
//        NSLog(@"responseObject:%@",responseObject);
//        NSLog(@"error:%@",error);
//    }];

    
}
     
 - (BOOL (^)(NSError *error))requestRemoteDataErrorsFilter {
     return ^(NSError *error) {
         return YES;
     };
}
     
//订阅者对象就藏在subscribeNext方法,任何简化的不完全的subscribeNext方法都可以拓展成一个完整的subscribeNext方法
- (RACSignal *)updateNewsInfoDataWithpage:(NSInteger)page{
    APPManager *appManager = [[APPManager alloc]init];
    RACSignal *signal = [[appManager requestNewsWithSpecialID:1 andPageIndex:page Model:NewsModel.class]
    doNext:^(NewsModel *nsModel) {
        NSLog(@"nsModel:%@",nsModel);
        self.newsViewModel = nsModel;
    }];
    [signal subscribeNext:^(NewsModel *nsModel) {
//        NSLog(@"nsModel:%@",nsModel);
    }];
    
    return signal;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
