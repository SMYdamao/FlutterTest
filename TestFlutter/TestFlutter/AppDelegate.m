//
//  AppDelegate.m
//  TestFlutter
//
//  Created by 生茂元 on 2018/12/20.
//  Copyright © 2018 生茂元. All rights reserved.
//

#import "AppDelegate.h"
#import "XRootController.h"
#import "XURLRouter.h"
#import "XDemoController.h"
#import "HybridStackManager.h"
#include "GeneratedPluginRegistrant.h"
#import "XPage1ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    UINavigationController * baseNav = [[UINavigationController alloc] initWithRootViewController:[[XRootController alloc] init]];
    self.window.rootViewController = baseNav;
    [self.window makeKeyAndVisible];
    [self setupNativeOpenUrlHandler];
    [GeneratedPluginRegistrant registerWithRegistry:self];
    
    return YES;
}

- (void)setupNativeOpenUrlHandler{
    [[XURLRouter sharedInstance] setNativeOpenUrlHandler:^UIViewController *(NSString *url,NSDictionary *query,NSDictionary *params){
        NSURL *tmpUrl = [NSURL URLWithString:url];
        if([@"ndemo" isEqualToString:tmpUrl.host]){
            return [XDemoController new];
        } else if ([@"npage1" isEqualToString:tmpUrl.host]) {
            return [XPage1ViewController new];
        }
        return nil;
    }];
}

@end
