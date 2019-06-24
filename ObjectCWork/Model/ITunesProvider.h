//
//  ITunesProvider.h
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/23.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworkingObject.h"
#import "ITunesDataObject.h"

@interface ITunesProvider : NSObject

@property AFNetworkngObject *afNetWorking;
@property NSMutableArray<ITunesDataObject *> *songArray, *movieArray;

-(void) getSearchITune:(NSString *)searchTitle completionHandler: (void(^)(void))completionHandler;

@end
