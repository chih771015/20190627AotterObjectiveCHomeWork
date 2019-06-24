//
//  SearchMainTableViewCell.h
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/22.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchMainTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;

@property (weak, nonatomic) IBOutlet UILabel *trackNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *collectionNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *trackTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longDescriptionLabel;


-(void) setupCellWithTrackName: (NSString *)trackName
                    artistName: (NSString *)artistName
                collectionName: (NSString *)collectionName
               longDescription: (NSString *)longDescription
                     trackTime: (NSString *)trackTime
                  trackViewUrl: (NSString *)trackViewUrl;;

@end

NS_ASSUME_NONNULL_END
