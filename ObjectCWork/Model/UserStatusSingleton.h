//
//  UserStatusSingleton.h
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/25.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITunesDataObject.h"
@interface UserStatusSingleton : NSObject

@property NSMutableArray<NSDictionary *> *likeArray;
@property NSMutableArray<ITunesDataObject *> *songLikeArrayObject;
@property NSMutableArray<ITunesDataObject *> *movieLikeArrayObject;
@property NSString *colorSelect;
@property NSArray<NSString *> *colorArray;

+ (UserStatusSingleton *)sharedInstance;

- (BOOL)isLikeDataObject: (ITunesDataObject *) iTunesObject;
- (void)saveLikeDataObject: (ITunesDataObject *) iTunesObject;
- (void)removeLikeDataObject: (ITunesDataObject *) iTunesObject;
- (void)setupViewModelWithColorArrayIndex: (NSInteger)index;
- (UIColor*)returnNowColor;
@end
