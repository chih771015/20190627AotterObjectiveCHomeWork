//
//  UserLikeViewController.m
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/26.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import "UserLikeViewController.h"

@interface UserLikeViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewConstraint;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation UserLikeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollView.delegate = self;
    self.navigationItem.title = @"收藏項目";
}

- (void)setupWithColorModel {
    
    self.view.backgroundColor = [self.userStatus returnNowColor];
}
- (IBAction)musicButtonAction:(id)sender {
    
    [_scrollView setContentOffset: CGPointMake(0, 0) animated: YES];
}
- (IBAction)moiveButtonAction:(id)sender {
    
    CGFloat x = self.view.frame.size.width;
    [_scrollView setContentOffset: CGPointMake(x, 0) animated: YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat size = scrollView.contentOffset.x / 2;
    [self.viewConstraint setConstant:size];
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
