//
//  BaseViewController.h
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/26.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserStatusSingleton.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@property UserStatusSingleton *userStatus;

-(void)setupWithColorModel;

@end

NS_ASSUME_NONNULL_END
