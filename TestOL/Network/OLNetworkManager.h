//
//  OLNetworkManager.h
//  TestOL
//
//  Created by Oles Byzhon on 30.10.16.
//  Copyright © 2016 testOL. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void(^OLResponseBlock)(NSDictionary *response, NSError *error);
#define NETWORK [OLNetworkManager sharedInstance]

@interface OLNetworkManager : AFHTTPSessionManager{

}
+ (instancetype)sharedInstance;

- (void)requestListWithCompletion:(OLResponseBlock)completion;
@end
