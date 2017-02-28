//
//  TwoViewController.m
//  WTKJSDemo
//
//  Created by 王同科 on 2017/2/27.
//  Copyright © 2017年 王同科. All rights reserved.
//

#import "TwoViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JSObjDelegate <JSExport>

- (void)callCamera;

- (void) share:(NSString *)shareInfo;

@end


@interface TwoViewController ()<UIWebViewDelegate,JSObjDelegate>

@property(nonatomic,strong)UIWebView *webView;


@property(nonatomic,strong)JSContext *jsContext;


@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"jsDemo" withExtension:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 20, 50, 25);
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)btnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    self.jsContext[@"Toyun"] = self;
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *ex){
        context.exception = ex;
        NSLog(@"异常信息%@",ex);
    };
}


//  JS调用的方法
- (void)callCamera
{
    NSLog(@"调用摄像头");
    JSValue *picCallBack = self.jsContext[@"picCallback"];
    [picCallBack callWithArguments:@[@"wangtongke"]];
}

- (void) share:(NSString *)shareInfo {
    NSLog(@"%@",shareInfo);
    JSValue *shareCallBack = self.jsContext[@"shareCallback"];
    [shareCallBack callWithArguments:nil];
}


- (void)dealloc
{
    NSLog(@"twoViewController 释放");
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
