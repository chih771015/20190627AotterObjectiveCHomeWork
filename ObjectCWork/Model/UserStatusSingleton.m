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

@synthesize colorSelect, colorArray;
//Singleton 設置
+ (UserStatusSingleton *)sharedInstance {
    
    static UserStatusSingleton *sharedInstance = nil;
    static dispatch_once_t onceToken;
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
        self.colorArray = [NSArray arrayWithObjects:@"淺色",@"深色", nil];
        [self setupLikesProperty];
        [self setupViewModel];
    }
    return self;
}

- (void)setupViewModel {
    
    NSString *color = [self.userDefault objectForKey:@"colorModel"];
    if (color == nil) {
        
        color = @"淺色";
    }
    self.colorSelect = color;
}

- (void)setupViewModelToUserDefault {
    
    [self.userDefault setObject: self.colorSelect forKey:@"colorModel"];
    [self.userDefault synchronize];
}

- (void)setupViewModelWithColorArrayIndex:(NSInteger)index {
    
    self.colorSelect = self.colorArray[index];
    [self setupViewModelToUserDefault];
}

//從userDefaults取出資料 設置物件的值
- (void)setupLikesProperty {
    
    NSMutableArray<NSDictionary *> *likeArray = [[self.userDefault objectForKey:@"LikeData"] mutableCopy];
    if (likeArray == nil) {
        
        likeArray = [NSMutableArray new];
    }
    
    self.likeArray = likeArray;
    self.songLikeArrayObject = [NSMutableArray new];
    self.movieLikeArrayObject = [NSMutableArray new];
    
    for (NSDictionary* dictionay in likeArray) {
        
        ITunesDataObject *iTuneObject = [[ITunesDataObject alloc] initWithDictionay:dictionay];
        if ([iTuneObject.kind isEqualToString:@"song"]) {
            
            [self.songLikeArrayObject addObject:iTuneObject];
        } else {
            
            [self.movieLikeArrayObject addObject:iTuneObject];
        }
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:nil];
}

- (BOOL)isLikeDataObject:(ITunesDataObject *)iTunesObject {
    
    return [self.likeArray containsObject:[iTunesObject returnDictionary]];
}

- (void)removeLikeDataObject:(ITunesDataObject *)iTunesObject {
    
    [self.likeArray removeObject: [iTunesObject returnDictionary]];
    [self saveToUserDefault];
}

- (void)saveLikeDataObject:(ITunesDataObject *)iTunesObject {
    
    [self.likeArray addObject: [iTunesObject returnDictionary]];
    [self saveToUserDefault];
}

- (void)saveToUserDefault {
    
    [self.userDefault setObject: self.likeArray forKey:@"LikeData"];
    [self.userDefault synchronize];
    [self setupLikesProperty];
}

- (UIColor *)returnNowColor {
    
    if ([self.colorSelect isEqualToString:self.colorArray[0]]) {
        
        return [UIColor whiteColor];
    } else {
        
        return [UIColor grayColor];
    }
}
@end
