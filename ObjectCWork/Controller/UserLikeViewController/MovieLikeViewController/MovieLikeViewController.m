//
//  MovieLikeViewController.m
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/26.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import "MovieLikeViewController.h"

@interface MovieLikeViewController () <UITableViewDelegate, UITableViewDataSource, SearchMainTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MovieLikeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTableView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotification:) name:@"reloadData" object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)getNotification:(NSNotification *)notification {
    
    [self.tableView reloadData];
}

- (void)setupTableView {
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"SearchMainTableViewCell" bundle:nil] forCellReuseIdentifier:@"SearchMainTableViewCell"];
}
- (void)setupWithColorModel {
    
    self.tableView.backgroundColor = [self.userStatus returnNowColor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SearchMainTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier: @"SearchMainTableViewCell" forIndexPath:indexPath];
    
    ITunesDataObject *data = self.userStatus.movieLikeArrayObject[indexPath.row];
    
    [cell setupCellWithTrackName: data.trackName
                      artistName: data.artistName
                  collectionName: data.collectionName
                 longDescription: data.longDescription
                       trackTime: [data getTimeString]
                    trackViewUrl: data.artworkUrl100
                          isLike: YES
                        isExpend: data.isExpand];
    cell.delegate = self;
    cell.backgroundColor = [self.userStatus returnNowColor];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.userStatus.movieLikeArrayObject.count;
}

- (void)getLikeButtonAction:(UITableViewCell *)cell {
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    [self.userStatus removeLikeDataObject:self.userStatus.movieLikeArrayObject[indexPath.row]];
    [self.tableView reloadData];
}

- (void)getExpandButtonAction:(UITableViewCell *)cell {
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    self.userStatus.movieLikeArrayObject[indexPath.row].isExpand = !self.userStatus.movieLikeArrayObject[indexPath.row].isExpand;
    [self.tableView reloadData];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:false];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: self.userStatus.movieLikeArrayObject[indexPath.row].trackViewUrl]
                                       options: [NSDictionary new] completionHandler:^(BOOL success) {
                                           
                                       }];
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
