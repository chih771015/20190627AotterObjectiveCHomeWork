//
//  SearchMainViewController.m
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/22.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import "SearchMainViewController.h"

@interface SearchMainViewController() <UITableViewDelegate, UITableViewDataSource, SearchMainTableViewCellDelegate, UITextFieldDelegate>

@property ITunesProvider *itunesProvider;

-(void)setupTableView;

@end

@implementation SearchMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.itunesProvider = [ITunesProvider new];
    [self setupTableView];
    self.textField.delegate = self;
}

- (void)setupTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName: @"SearchMainTableViewCell"
                                               bundle:nil]
         forCellReuseIdentifier: @"SearchMainTableViewCell"];

}

- (void)setupWithColorModel {
    self.view.backgroundColor = [self.userStatus returnNowColor];
    [self.tableView reloadData];
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
    
    BOOL isLike = [self.userStatus.likeArray containsObject:[data returnDictionary]];
    [cell setupCellWithTrackName: data.trackName
                      artistName: data.artistName
                  collectionName: data.collectionName
                 longDescription: data.longDescription
                       trackTime: [data getTimeString]
                    trackViewUrl: data.artworkUrl100
                          isLike: isLike
                        isExpend: data.isExpand];
    cell.delegate = self;
    cell.backgroundColor = [self.userStatus returnNowColor];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    //判斷有無資料 沒有就不給header
    if (section == 0) {
        
        if (self.itunesProvider.songArray.count == 0) {
            
            return @"";
        } else {
            
            return @"音樂";
        }
    } else {
        if (self.itunesProvider.movieArray.count == 0) {
            return @"";
        } else {
            return @"電影";
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //決定 cell 數量
    if (section == 0) {
        
        return _itunesProvider.songArray.count;
    } else if (section == 1) {
        
        return _itunesProvider.movieArray.count;
    } else {
    
        return 1;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //前往 url
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
    //轉換搜尋關鍵字 空格換成 +
    
    NSString *text = [self.textField.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    __weak __typeof(self) weakSelf = self;
    [self.itunesProvider getSearchITune: text completionHandler:^{
        
        [weakSelf.tableView reloadData];
    }];
}

//delegate 執行method 做出相對應的動作
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
    //判斷是否展開並更改狀態且重新讀取 cell
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    if (indexPath.section == 0) {
        
        self.itunesProvider.songArray[indexPath.row].isExpand = !self.itunesProvider.songArray[indexPath.row].isExpand;
    } else {
        
        self.itunesProvider.movieArray[indexPath.row].isExpand = !self.itunesProvider.movieArray[indexPath.row].isExpand;
    }
  
    [self.tableView reloadData];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:false];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //關鍵盤
    [textField resignFirstResponder];
    return YES;
}

@end
