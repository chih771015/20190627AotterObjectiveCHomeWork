//
//  SearchMainTableViewCell.m
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/22.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import "SearchMainTableViewCell.h"

@implementation SearchMainTableViewCell

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

@end
