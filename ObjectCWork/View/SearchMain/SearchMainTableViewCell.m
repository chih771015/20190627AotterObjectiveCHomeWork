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
                     trackTime:(NSString *)trackTime trackViewUrl:(NSString *)trackViewUrl
                        isLike:(BOOL)isLike {
    
    self.longDescriptionLabel.text = longDescription;
    self.trackNameLabel.text = trackName;
    self.trackTimeLabel.text = trackTime;
    self.artistNameLabel.text = artistName;
    self.collectionNameLabel.text = collectionName;
    NSURL *url = [[NSURL alloc]initWithString:trackViewUrl];
    [self.titleImageView setImageWithURL:url];
    
    if (isLike) {
        
        [self.likeButton setTitle:@"取消" forState: UIControlStateNormal];
        [self.likeButton setTitle:@"取消" forState: UIControlStateSelected];
    } else {
        
        [self.likeButton setTitle:@"收藏" forState: UIControlStateNormal];
        [self.likeButton setTitle:@"收藏" forState: UIControlStateNormal];
    }
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.layer.borderWidth = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)prepareForReuse {
    [super prepareForReuse];

}
- (IBAction)likeAction:(id)sender {
    
    [self.delegate getLikeButtonAction: self];
}

@end
