//
//  UserStatusSingleton.m
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/25.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import "UserStatusSingleton.h"

@interface UserStatusSingleton()

@property NSUserDefaults *userDefault;

-(void) setupLikesProperty;
-(void) saveToUserDefault;
-(void) setupViewModel;
-(void) setupViewModelToUserDefault;

@end

@implementation UserStatusSingleton

+ (UserStatusSingleton *)sharedInstance {
    
    static UserStatusSingleton *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[UserStatusSingleton alloc] init];
    });
    
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.userDefault = [NSUserDefaults standardUserDefaults];
        self.songLikeArrayObject = [NSMutableArray new];
        self.movieLikeArrayObject = [NSMutableArray new];
        [self setupLikesProperty];
        [self setupViewModel];
    }
    return self;
}

- (void)setupViewModel {
    
    NSString *color = [self.userDefault objectForKey:@"colorModel"];
    if (color == nil) {
        
        color = @"白色";
    }
    self.colorSelect = color;
}

- (void)setupViewModelToUserDefault {
    
    [self.userDefault setObject: self.colorSelect forKey:@"colorModel"];
    [self.userDefault synchronize];
}

- (void)viewModelToGray {
    
    self.colorSelect = @"灰色";
    [self setupViewModelToUserDefault];
}

- (void)viewModelToWhite {
    
    self.colorSelect = @"白色";
    [self setupViewModelToUserDefault];
}
- (void)setupLikesProperty {
    
    NSMutableArray<NSDictionary *> *likeArray = [[self.userDefault objectForKey:@"LikeData"] mutableCopy];
    if (likeArray == nil) {
        
        likeArray = [NSMutableArray new];
    }
    
    self.likeArray = likeArray;
    
    for (NSDictionary* dictionay in likeArray) {
        
        ITunesDataObject *iTuneObject = [[ITunesDataObject alloc] initWithDictionay:dictionay];
        if ([iTuneObject.kind isEqualToString:@"song"]) {
            
            [self.songLikeArrayObject addObject:iTuneObject];
        } else {
            
            [self.movieLikeArrayObject addObject:iTuneObject];
        }
    }
}

- (BOOL)isLikeDataObject:(ITunesDataObject *)iTunesObject {
    
    return [self.likeArray containsObject:[iTunesObject returnDictionay]];
}

- (void)removeLikeDataObject:(ITunesDataObject *)iTunesObject {
    
    [self.likeArray removeObject: [iTunesObject returnDictionay]];
    [self saveToUserDefault];
}

- (void)saveLikeDataObject:(ITunesDataObject *)iTunesObject {
    
    [self.likeArray addObject: [iTunesObject returnDictionay]];
    [self saveToUserDefault];
}

- (void)saveToUserDefault {
    
    [self.userDefault setObject: self.likeArray forKey:@"LikeData"];
    [self.userDefault synchronize];
    [self setupLikesProperty];
}
@end
