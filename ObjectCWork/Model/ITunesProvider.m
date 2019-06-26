//
//  ITunesProvider.m
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/23.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import "ITunesProvider.h"

@interface ITunesProvider()


@end

@implementation ITunesProvider

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.afNetWorking = [AFNetworkngObject new];
    }
    return self;
}

- (void) getSearchITune:(NSString *)searchTitle completionHandler: (void(^)(void))completionHandler {
    
    self.songArray = [NSMutableArray new];
    self.movieArray = [NSMutableArray new];
    completionHandler();
    
    [self.afNetWorking postRequest:searchTitle completionHandler:^(NSDictionary *dictionary) {

        NSArray *allArray = dictionary[@"results"];
        for (NSDictionary *dictionary in allArray) {
            
            NSString *kind = dictionary[@"kind"],
                        *artistName = dictionary[@"artistName"],
                        *collectionName = dictionary[@"collectionName"],
                        *longDescription = dictionary[@"longDescription"],
                        *trackName = dictionary[@"trackName"],
                        *trackViewUrl = dictionary[@"trackViewUrl"],
                        *artworkUrl100 = dictionary[@"artworkUrl100"];
            NSNumber  *trackTimeMillis = dictionary[@"trackTimeMillis"];
            
            ITunesDataObject *data = [[ITunesDataObject alloc] initWithkind:kind
                                                                 artistName:artistName
                                                                  tracktime:trackTimeMillis
                                                             collectionName:collectionName
                                                            longDescription:longDescription
                                                               trackViewUrl:trackViewUrl
                                                                  trackName:trackName
                                                              artworkUrl100:artworkUrl100];
            
            if ([data.kind isEqualToString:@"song"]) {
                
                [self.songArray addObject:data];
            } else {
                
                [self.movieArray addObject:data];
            };
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler();
        });
    }];
}

@end
