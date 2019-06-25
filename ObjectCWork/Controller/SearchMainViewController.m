//
//  SearchMainViewController.m
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/22.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import "SearchMainViewController.h"

@interface SearchMainViewController() <UITableViewDelegate, UITableViewDataSource, SearchMainTableViewCellDelegate>

@property ITunesProvider *itunesProvider;
@property UserStatusSingleton *userStatus;

@end

@implementation SearchMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.itunesProvider = [ITunesProvider new];
    self.userStatus = [UserStatusSingleton sharedInstance];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName: @"SearchMainTableViewCell"
                                               bundle:nil]
         forCellReuseIdentifier: @"SearchMainTableViewCell"];
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
    
    BOOL isLike = [self.userStatus.likeArray containsObject:[data returnDictionay]];
    [cell setupCellWithTrackName:data.trackName artistName:data.artistName collectionName:data.collectionName longDescription:data.longDescription trackTime: [data getTimeString]
                    trackViewUrl:data.artworkUrl100 isLike: isLike];
    cell.delegate = self;
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: self.itunesProvider.songArray[indexPath.row].trackViewUrl]
                                           options: [NSDictionary new] completionHandler:^(BOOL success) {
            
        }];
    }
    
    if (indexPath.section == 1) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: self.itunesProvider.movieArray[indexPath.row].trackViewUrl]
                                           options: [NSDictionary new] completionHandler:^(BOOL success) {
                                               
                                           }];
    }
}

- (IBAction)searchButtonAction:(id)sender {
    
    NSString *text = [self.textField.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    [self.itunesProvider getSearchITune: text completionHandler:^{
        
        [self.tableView reloadData];
    }];
}

- (void)getLikeButtonAction:(UITableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    ITunesDataObject *data;
    if (indexPath.section == 0) {
        
        data = self.itunesProvider.songArray[indexPath.row];
    }
    if (indexPath.section == 1) {
        
        data = self.itunesProvider.movieArray[indexPath.row];
    }

    BOOL isLike = [self.userStatus isLikeDataObject: data];
    
    if (isLike) {
        
        [self.userStatus removeLikeDataObject:data];
    } else {
        
        [self.userStatus saveLikeDataObject:data];
    }
    NSMutableArray<NSIndexPath *> *indexArray = [NSMutableArray new];
    [indexArray addObject:indexPath];
    [self.tableView reloadRowsAtIndexPaths: indexArray withRowAnimation:UITableViewAutomaticDimension];
}

- (void)getExpandButtonAction:(UITableViewCell *)cell {
    
}
@end
