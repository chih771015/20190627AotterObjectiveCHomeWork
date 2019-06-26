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

- (instancetype)initWithDictionay:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        
        NSString *kind = dictionary[@"kind"],
        *artistName = dictionary[@"artistName"],
        *collectionName = dictionary[@"collectionName"],
        *longDescription = dictionary[@"longDescription"],
        *trackName = dictionary[@"trackName"],
        *trackViewUrl = dictionary[@"trackViewUrl"],
        *artworkUrl100 = dictionary[@"artworkUrl100"];
        NSNumber  *trackTimeMillis = dictionary[@"trackTimeMillis"];
        self.artistName = artistName;
        self.trackTime = trackTimeMillis;
        self.collectionName = collectionName;
        self.kind = kind;
        self.longDescription = longDescription;
        self.trackViewUrl = trackViewUrl;
        self.trackName = trackName;
        self.artworkUrl100 = artworkUrl100;
    }
    return self;
}

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

//將時間轉乘 Stromg 的形式並回傳
-(NSString *)getTimeString {

    NSNumber *secondCount = @([trackTime intValue] / 1000);
    NSNumber *second = @([secondCount intValue] % 60);
    NSNumber *min = @([secondCount intValue] / 60);
    NSNumber *minComplet = @([min intValue] % 60);
    NSNumber *hour = @([min intValue] / 60);
    NSString *secondString = [second stringValue];
    NSString *minString = [minComplet stringValue];
    NSString *hourString = [hour stringValue];
    NSMutableString *allTimeString = [NSMutableString new];
    if ([hour integerValue] > 0) {
        
        [allTimeString appendString:hourString];
        [allTimeString appendString:@":"];
    }
    if ([minComplet integerValue] < 10) {
        
        [allTimeString appendString:@"0"];
    }
    [allTimeString appendString:minString];
    [allTimeString appendString:@":"];
    if ([second integerValue] < 10) {
        
        [allTimeString appendString:@"0"];
    }
    [allTimeString appendString:secondString];

    return allTimeString;
}

//將物件轉換成 dictionary
- (NSDictionary *)returnDictionary {
    
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    [dictionary setValue:self.artistName forKey:@"artistName"];
    [dictionary setValue:self.artworkUrl100 forKey:@"artworkUrl100"];
    [dictionary setValue:self.collectionName forKey:@"collectionName"];
    [dictionary setValue:self.longDescription forKey:@"longDescription"];
    [dictionary setValue:self.trackTime forKey:@"trackTimeMillis"];
    [dictionary setValue:self.trackViewUrl forKey:@"trackViewUrl"];
    [dictionary setValue:self.kind forKey:@"kind"];
    [dictionary setValue:self.trackName forKey:@"trackName"];
    
    return dictionary;
}

@end
