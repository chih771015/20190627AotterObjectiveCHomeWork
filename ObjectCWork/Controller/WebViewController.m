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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.webView setDelegate:self];
    NSString *urlAddress = @"https://support.apple.com/itunes";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)dismissAction:(id)sender {
    
    [self dismissViewControllerAnimated: YES completion:nil];
}

@end
