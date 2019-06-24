//
//  SearchMainViewController.m
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/22.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import "SearchMainViewController.h"

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

    SearchMainTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier: @"SearchMainTableViewCell" forIndexPath:indexPath];
    
    ITunesDataObject *data;
    if (indexPath.section == 0) {
        
        data = _itunesProvider.songArray[indexPath.row];
        
    }
    if (indexPath.section == 1) {
        
        data = _itunesProvider.movieArray[indexPath.row];
    }
    
    
    [cell setupCellWithTrackName:data.trackName artistName:data.artistName collectionName:data.collectionName longDescription:data.longDescription trackTime: [data getTimeString]
                    trackViewUrl:data.artworkUrl100];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return @"音樂";
    } else {
        
        return @"電影";
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return _itunesProvider.songArray.count;
    } else if (section == 1) {
        
        return _itunesProvider.movieArray.count;
    } else {
    
        return 1;
    }
}

- (IBAction)searchButtonAction:(id)sender {
    
    [self.itunesProvider getSearchITune: self.textField.text completionHandler:^{
        
        [self.tableView reloadData];
    }];
}
@end
