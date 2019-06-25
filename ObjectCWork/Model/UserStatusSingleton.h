//
//  UserStatusSingleton.h
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/25.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITunesDataObject.h"
@interface UserStatusSingleton : NSObject

@property NSMutableArray<NSDictionary *> *likeArray;
@property NSMutableArray<ITunesDataObject *> *songLikeArrayObject;
@property NSMutableArray<ITunesDataObject *> *movieLikeArrayObject;
@property NSString *colorSelect;

+ (UserStatusSingleton *)sharedInstance;

- (BOOL)isLikeDataObject: (ITunesDataObject *) iTunesObject;
- (void)saveLikeDataObject: (ITunesDataObject *) iTunesObject;
- (void)removeLikeDataObject: (ITunesDataObject *) iTunesObject;

@end
