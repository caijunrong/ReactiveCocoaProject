//
//  MRCRouter.m
//  ReactiveCocoaProject
//
//  Created by biyabi on 15/11/2.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import "MRCRouter.h"
#import "MRCViewProtocol.h"

static MRCRouter *_sharedInstance = nil;

@interface MRCRouter ()

@property (nonatomic, copy) NSDictionary *viewModelViewMappings; // viewModel到view的映射

@end

@implementation MRCRouter

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[super allocWithZone:NULL] init];
    });
    return _sharedInstance;
}

- (id<MRCViewProtocol>)viewControllerForViewModel:(id<MRCViewModelProtocol>)viewModel {
    NSString *viewController = [self.viewModelViewMappings valueForKey:NSStringFromClass(((NSObject *)viewModel).class)];
    
    NSParameterAssert([NSClassFromString(viewController) conformsToProtocol:@protocol(MRCViewProtocol)]);
    NSParameterAssert([NSClassFromString(viewController) instancesRespondToSelector:@selector(initWithViewModel:)]);
    
    return [[NSClassFromString(viewController) alloc] initWithViewModel:viewModel];
}

- (NSDictionary *)viewModelViewMappings {
    return @{
             @"MRCLoginViewModel": @"MRCLoginViewController",
             @"MRCHomepageViewModel": @"MRCHomepageViewController",
             @"MRCRepoDetailViewModel": @"MRCRepoDetailViewController",
             @"MRCWebViewModel": @"MRCWebViewController",
             @"MRCRepoReadmeViewModel": @"MRCRepoReadmeController",
             @"MRCSelectBranchOrTagViewModel": @"MRCSelectBranchOrTagViewController",
             @"MRCGitTreeViewModel": @"MRCGitTreeViewController",
             @"MRCSourceEditorViewModel": @"MRCSourceEditorViewController",
             @"MRCSettingsViewModel": @"MRCSettingsViewController",
             @"MRCAboutViewModel": @"MRCAboutViewController",
             @"MRCFeedbackViewModel": @"MRCFeedbackViewController",
             @"MRCRepoSettingsViewModel": @"MRCRepoSettingsViewController",
             @"MRCUserListViewModel": @"MRCUserListViewController",
             @"MRCUserDetailViewModel": @"MRCUserDetailViewController",
             @"MRCOwnedReposViewModel": @"MRCOwnedReposViewController",
             @"MRCStarredReposViewModel": @"MRCStarredReposViewController",
             @"MRCPublicReposViewModel": @"MRCPublicReposViewController",
             @"MRCNewsViewModel": @"MRCNewsViewController",
             @"MRCSearchViewModel": @"MRCSearchViewController",
             @"MRCTrendingViewModel": @"MRCTrendingViewController",
             @"MRCTrendingSettingsViewModel": @"MRCTrendingSettingsViewController",
             };
}

@end
