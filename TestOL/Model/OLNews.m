//
//  OLNews.m
//  TestOL
//
//  Created by Oles Byzhon on 31.10.16.
//  Copyright © 2016 testOL. All rights reserved.
//

#import "OLNews.h"

@implementation OLNews

- (instancetype)initWithDictionary:(NSDictionary*)dictionary{
    if (self = [super init]) {
        _newsTitle = dictionary[@"title"];
        _newsDescription = dictionary[@"description"];
        _imageURL = dictionary[@"image_url"];
    }
    return self;
}


@end
