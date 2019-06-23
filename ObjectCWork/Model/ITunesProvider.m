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

- (void) getSearchITune:(NSString *)searchTitle {
    
    [self.afNetWorking postRequest:searchTitle completionHandler:^(NSURLResponse *response) {
       
        NSLog(@"%@", response);
        
    }];
}

@end
