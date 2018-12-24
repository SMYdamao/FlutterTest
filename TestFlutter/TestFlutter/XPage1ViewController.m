//
//  XPage1ViewController.m
//  TestFlutter
//
//  Created by 生茂元 on 2018/12/20.
//  Copyright © 2018 生茂元. All rights reserved.
//

#import "XPage1ViewController.h"
#import "XURLRouter.h"

static NSInteger sNativeVCIdx = 0;

@interface XPage1ViewController ()

@end

@implementation XPage1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    sNativeVCIdx++;
    NSString *title = [NSString stringWithFormat:@"Custome Native demo page(%ld)",(long)sNativeVCIdx];
    self.title = title;
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)loadView{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [view setBackgroundColor:[UIColor whiteColor]];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    [btn setTitle:@"Click to jump Custome Native" forState:UIControlStateNormal];
    [view addSubview:btn];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setCenter:CGPointMake(view.center.x, view.center.y-100)];
    [btn addTarget:self action:@selector(onJumpCustomeNativePressed) forControlEvents:UIControlEventTouchUpInside];
    
    btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    [btn setTitle:@"Click to jump Native" forState:UIControlStateNormal];
    [view addSubview:btn];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setCenter:CGPointMake(view.center.x, view.center.y-50)];
    [btn addTarget:self action:@selector(onJumpNativePressed) forControlEvents:UIControlEventTouchUpInside];
    
    btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    [btn setTitle:@"Click to jump Flutter" forState:UIControlStateNormal];
    [view addSubview:btn];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setCenter:CGPointMake(view.center.x, view.center.y+50)];
    [btn addTarget:self action:@selector(onJumpFlutterPressed) forControlEvents:UIControlEventTouchUpInside];
    
    btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    [btn setTitle:@"Click to jump Custome Flutter" forState:UIControlStateNormal];
    [view addSubview:btn];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setCenter:CGPointMake(view.center.x, view.center.y+100)];
    [btn addTarget:self action:@selector(onJumpCustomeFlutterPressed) forControlEvents:UIControlEventTouchUpInside];
    
    self.view = view;
}

- (void)onJumpCustomeNativePressed
{
    XOpenURLWithQueryAndParams(@"hrd://npage1", nil, nil);
}

- (void)onJumpNativePressed{
    XOpenURLWithQueryAndParams(@"hrd://ndemo", nil, nil);
}

- (void)onJumpFlutterPressed{
    XOpenURLWithQueryAndParams(@"hrd://fdemo", @{@"flutter":@(true)}, nil);
}

- (void)onJumpCustomeFlutterPressed{
    XOpenURLWithQueryAndParams(@"hrd://fpage1", @{@"flutter":@(true)}, nil);
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
