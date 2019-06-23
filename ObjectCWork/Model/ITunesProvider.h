//
//  ITunesProvider.h
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/23.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworkingObject.h"

@interface ITunesProvider : NSObject

@property AFNetworkngObject *afNetWorking;

-(void) getSearchITune:(NSString *)searchTitle;

@end
