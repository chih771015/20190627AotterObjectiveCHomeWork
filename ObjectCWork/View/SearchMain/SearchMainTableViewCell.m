//
//  SearchMainTableViewCell.m
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/22.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import "SearchMainTableViewCell.h"
#import <UIKit+AFNetworking.h>

@implementation SearchMainTableViewCell

- (void)setupCellWithTrackName:(NSString *)trackName
                    artistName:(NSString *)artistName
                collectionName:(NSString *)collectionName
               longDescription:(NSString *)longDescription
                     trackTime:(NSString *)trackTime
                  trackViewUrl:(NSString *)trackViewUrl
                        isLike:(BOOL)isLike
                      isExpend:(BOOL)isExpand {
    
    self.longDescriptionLabel.text = longDescription;
    self.trackNameLabel.text = trackName;
    self.trackTimeLabel.text = trackTime;
    self.artistNameLabel.text = artistName;
    self.collectionNameLabel.text = collectionName;
    NSURL *url = [[NSURL alloc]initWithString:trackViewUrl];
    [self.titleImageView setImageWithURL:url];
    
    [self isLike:isLike];
    //設定 expandButoon 狀態
    if (longDescription == nil) {
        
        [self.expandButton setHidden:YES];
        [self.expandButtonConstaint setConstant:0];
    } else {
        
        [self.expandButton setHidden:NO];
        [self.expandButtonConstaint setConstant: -36];
    }
    
    [self isExpand:isExpand];
}

-(void) isLike: (BOOL)isLike {
    
    //設定 cell likeButton 狀態
    if (isLike) {
        
        [self.likeButton setTitle:@"取消" forState: UIControlStateNormal];
        [self.likeButton setTitle:@"取消" forState: UIControlStateSelected];
    } else {
        
        [self.likeButton setTitle:@"收藏" forState: UIControlStateNormal];
        [self.likeButton setTitle:@"收藏" forState: UIControlStateNormal];
    }
}

-(void) isExpand: (BOOL)isExpand {
    //判斷是否展開且更改 cell 內容
    if (isExpand) {
        
        [self.expandButton setTitle:@"收起內容" forState:UIControlStateNormal];
        [self.expandButton setTitle:@"收起內容" forState:UIControlStateSelected];
        [self.longDescriptionLabel setNumberOfLines:0];
    } else {
        
        [self.expandButton setTitle:@"展開內容" forState:UIControlStateNormal];
        [self.expandButton setTitle:@"展開內容" forState:UIControlStateSelected];
        [self.longDescriptionLabel setNumberOfLines:2];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)prepareForReuse {
    [super prepareForReuse];
    self.titleImageView.image = [UIImage new];

}
- (IBAction)likeAction:(id)sender {
    
    [self.delegate getLikeButtonAction: self];
}

- (IBAction)expandAction:(id)sender {
    
    [self.delegate getExpandButtonAction:self];
}


@end
