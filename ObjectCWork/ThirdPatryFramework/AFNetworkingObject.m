//
//  AFNetworkingObject.m
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/23.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import "AFNetworkingObject.h"

@interface AFNetworkngObject()


@end

@implementation AFNetworkngObject

-(void)postRequest:(NSString *)url completionHandler:(void(^)(NSDictionary*))completionHandler {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSString *urlAdd = @"https://itunes.apple.com/search?term=";
    NSString *complet = [NSString stringWithFormat:@"%@%@", urlAdd, url];
    NSURL *URL = [NSURL URLWithString: complet];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
      
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSDictionary *data = responseObject;
//            NSLog(@"%@", data);
            completionHandler(data);
        }
    }];
    [dataTask resume];
}

@end
