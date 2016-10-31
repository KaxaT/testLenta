//
//  OLNetworkManager.m
//  TestOL
//
//  Created by Oles Byzhon on 30.10.16.
//  Copyright © 2016 testOL. All rights reserved.
//

#import "OLNetworkManager.h"

@implementation OLNetworkManager

+ (instancetype)sharedInstance {
    static OLNetworkManager *__instance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        __instance = [[OLNetworkManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.lenta.ru"]];
    });

    return __instance;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [self.requestSerializer setHTTPShouldHandleCookies:NO];
        NSMutableSet *contentTypes = [NSMutableSet setWithSet:self.responseSerializer.acceptableContentTypes];
        [contentTypes addObject:@"text/html"];
        [contentTypes addObject:@"application/json"];
        self.responseSerializer.acceptableContentTypes = contentTypes;
    }

    return self;
}

- (void) requestListWithCompletion:(OLResponseBlock)completion
{
    [self GET:@"/lists/latest" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //no neded
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completion(nil, error);
    }];
}

@end
