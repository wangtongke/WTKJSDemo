//
//  ViewController.m
//  WTKJSDemo
//
//  Created by 王同科 on 2017/2/27.
//  Copyright © 2017年 王同科. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"
@interface ViewController ()
//@property (weak, nonatomic) IBOutlet UIWebView *webView;/


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}

- (IBAction)btnClick:(id)sender {
    TwoViewController *vc = [[TwoViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
