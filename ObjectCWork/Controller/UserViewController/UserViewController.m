//
//  UserViewController.m
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/25.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *tableFooterView;
-(void)setupTableView;

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTableView];
    self.navigationItem.title = @"個人資料";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)setupWithColorModel {
    
    self.tableView.backgroundColor = [self.userStatus returnNowColor];
    self.tableFooterView.backgroundColor = [self.userStatus returnNowColor];
}

- (void)setupTableView {
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName: @"UserTableViewCell" bundle:nil] forCellReuseIdentifier: @"UserTableViewCell"];
    self.tableView.tableFooterView = self.tableFooterView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserTableViewCell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        NSMutableString *description = [[NSMutableString alloc]initWithString: self.userStatus.colorSelect];
        [description appendString:@"主題"];
        [cell setupCellTitle:@"主題顏色" description: description];
    }
    if (indexPath.section == 1) {
        
        NSUInteger likeCount = [self.userStatus.likeArray count];
        NSNumber *count = [[NSNumber alloc] initWithInteger:likeCount];
        NSMutableString *description = [[NSMutableString alloc]initWithString:@"共有"];
        [description appendString:[count stringValue]];
        [description appendString:@"收藏"];
        [cell setupCellTitle:@"收藏項目" description:description];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
 
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
 
    return 12;
}

//進入 webViewController
- (IBAction)aboutITunesAction:(id)sender {
    
    WebViewController *nextVC = [self.storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    [self presentViewController:nextVC animated:YES completion:nil];
}


//進入不同的ViewController
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        UIViewController *nextVC = [self.storyboard instantiateViewControllerWithIdentifier: @"SelectColorModelViewController"];
        [self.navigationController pushViewController:nextVC animated:YES];
    }
    if (indexPath.section == 1) {
        
        UIViewController *nextVC = [self.storyboard instantiateViewControllerWithIdentifier: @"UserLikeViewController"];
        [self.navigationController pushViewController:nextVC animated:YES];
    }
}

@end
