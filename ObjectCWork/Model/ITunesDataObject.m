//
//  ITunesDataObject.m
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/24.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import "ITunesDataObject.h"

@interface ITunesDataObject()

@end

@implementation ITunesDataObject

@synthesize kind, artistName, trackTime, collectionName, longDescription, trackViewUrl, trackName, artworkUrl100;

- (instancetype)initWithkind: (NSString *)kind
                  artistName: (NSString *)artistName
                   tracktime: (NSNumber *)tracktime
              collectionName: (NSString *)collectionName
             longDescription: (NSString *)longDescription
                trackViewUrl: (NSString *)trackViewUrl
                   trackName: (NSString *)trackName
               artworkUrl100: (NSString *)artworkUrl100
{
    self = [super init];
    if (self) {
        self.artistName = artistName;
        self.trackTime = tracktime;
        self.collectionName = collectionName;
        self.kind = kind;
        self.longDescription = longDescription;
        self.trackViewUrl = trackViewUrl;
        self.trackName = trackName;
        self.artworkUrl100 = artworkUrl100;
    }
    return self;
}

-(NSString *)getTimeString {
    
    NSNumber *minSecond = @([trackTime intValue] % 100);
    if (@([minSecond intValue] % 10) == 0) {
        minSecond = @([minSecond intValue] / 10);
    }
    NSNumber *secondCount = @([trackTime intValue] / 100);
    NSNumber *second = @([secondCount intValue] % 60);
    NSNumber *min = @([secondCount intValue] / 60);
    NSNumber *minComplet = @([min intValue] % 60);
    NSNumber *hour = @([min intValue] / 60);
   // NSString *minSecondString = [minSecond stringValue];
    NSString *secondString = [second stringValue];
    NSString *minString = [minComplet stringValue];
    NSString *hourString = [hour stringValue];
    NSMutableString *allTimeString = [NSMutableString new];
    if (hour <= 0) {
        
        [allTimeString appendString:hourString];
        [allTimeString appendString:@":"];
    }
    [allTimeString appendString:minString];
    [allTimeString appendString:@":"];
    [allTimeString appendString:secondString];
//    [allTimeString appendString:@"."];
//    [allTimeString appendString:minSecondString];
    
    return allTimeString;
}

@end
