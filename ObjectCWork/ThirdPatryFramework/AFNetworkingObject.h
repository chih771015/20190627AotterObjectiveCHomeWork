//
//  AFNetworkingObject.h
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/23.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface AFNetworkngObject : NSObject


-(void)postRequest:(NSString *)url completionHandler:(void(^)(NSURLResponse*))completionHandler;

@end
