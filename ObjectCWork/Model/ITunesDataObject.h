//
//  ITunesDataObject.h
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/24.
//  Copyright © 2019 姜旦旦. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface ITunesDataObject : NSObject

@property NSString *kind, *artistName, *collectionName, *longDescription, *trackViewUrl, *trackName, *artworkUrl100;
@property NSNumber *trackTime;

- (instancetype)initWithkind: (NSString *)kind
                  artistName: (NSString *)artistName
                   tracktime: (NSNumber *)tracktime
              collectionName: (NSString *)collectionName
             longDescription: (NSString *)longDescription
                trackViewUrl: (NSString *)trackViewUrl
                   trackName: (NSString *)trackName
               artworkUrl100: (NSString *)artworkUrl100;

- (instancetype)initWithDictionay: (NSDictionary *)dictionary;

- (NSString*)getTimeString;

- (NSDictionary*)returnDictionay;
@end
