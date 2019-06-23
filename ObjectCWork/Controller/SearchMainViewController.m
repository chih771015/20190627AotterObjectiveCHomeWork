//
//  SearchMainViewController.m
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/22.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import "SearchMainViewController.h"
#import "ITunesProvider.h"

@interface SearchMainViewController() <UITableViewDelegate, UITableViewDataSource>

@property ITunesProvider *itunesProvider;

@end

@implementation SearchMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.itunesProvider = [ITunesProvider new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName: @"SearchMainTableViewCell" bundle:nil] forCellReuseIdentifier: @"SearchMainTableViewCell"];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier: @"SearchMainTableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = @"DDDD";
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (IBAction)searchButtonAction:(id)sender {
    
    [self.itunesProvider getSearchITune: self.textField.text];
}
@end
