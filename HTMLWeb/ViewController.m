//
//  ViewController.m
//  HTMLWeb
//
//  Created by 123 on 16/12/12.
//  Copyright © 2016年 123. All rights reserved.
//

#import "ViewController.h"

#define testStr @"<a href='https://www.baidu.com'  target='_blank'>百度网站</a>"

@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIWebView * wb=[[UIWebView alloc] initWithFrame:CGRectMake(20, 100, 320, 200)];
    [self.view addSubview:wb];
    wb.backgroundColor=[UIColor redColor];
    [wb sizeToFit];
    wb.delegate=self;
    [wb loadHTMLString:testStr baseURL:nil];
}

//点击web
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"url==%@",request.URL);
    [[UIApplication sharedApplication] openURL:request.URL];
    return YES;
}

//自适应高度
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    CGFloat webViewHeight=[webView.scrollView contentSize].height;
    CGRect newFrame = webView.frame;
    newFrame.size.height = webViewHeight;
    webView.frame = newFrame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
