//
//  SelectColorModelViewController.m
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/25.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import "SelectColorModelViewController.h"

@interface SelectColorModelViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

-(void)setupTableView;

@end

@implementation SelectColorModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    self.navigationItem.title = @"主題顏色";
    // Do any additional setup after loading the view.
}

- (void)setupWithColorModel {
 
    self.tableView.backgroundColor = self.userStatus.returnNowColor;
}

-(void)setupTableView {
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"SelectColorModelTableViewCell" bundle:nil] forCellReuseIdentifier:@"SelectColorModelTableViewCell"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SelectColorModelTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SelectColorModelTableViewCell" forIndexPath:indexPath];
    
    NSString *title = self.userStatus.colorArray[indexPath.row];
    BOOL isSelect = [self.userStatus.colorSelect isEqualToString:title];
    [cell setupCelltitle:title isSelectColor:isSelect];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.userStatus.colorArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.userStatus setupViewModelWithColorArrayIndex:indexPath.row];
    [self setupWithColorModel];
    [self.tableView reloadData];
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
