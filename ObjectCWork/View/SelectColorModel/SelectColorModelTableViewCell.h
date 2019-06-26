//
//  SelectColorModelTableViewCell.h
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/25.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SelectColorModelTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;

-(void) setupCelltitle: (NSString *)title isSelectColor: (BOOL)isSelectColor;

@end

NS_ASSUME_NONNULL_END
