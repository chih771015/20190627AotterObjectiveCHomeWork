//
//  WebViewController.m
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/25.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>

@end

@implementation WebViewController

// 設定 webView 的 URL
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView setDelegate:self];
    NSString *urlAddress = @"https://support.apple.com/itunes";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];
}

- (IBAction)dismissAction:(id)sender {
    
    [self dismissViewControllerAnimated: YES completion:nil];
}

@end
