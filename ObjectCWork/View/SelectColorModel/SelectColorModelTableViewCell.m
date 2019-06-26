//
//  SelectColorModelTableViewCell.m
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/25.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import "SelectColorModelTableViewCell.h"

@implementation SelectColorModelTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupCelltitle:(NSString *)title isSelectColor:(BOOL)isSelectColor {
    
    self.titleLabel.text = title;
    if (isSelectColor) {
        
        [self.titleImageView setHidden:NO];
    } else {
        
        
        [self.titleImageView setHidden:YES];
    }
}

@end
