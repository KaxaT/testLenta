//
//  OLGroupedNews.m
//  TestOL
//
//  Created by Oles Byzhon on 31.10.16.
//  Copyright © 2016 testOL. All rights reserved.
//

#import "OLGroupedNews.h"


@implementation OLGroupedNews

-(instancetype)initWithFirst:(OLNews*)first second:(nullable OLNews*)second andImageURLs:(nullable NSArray*)imageURLs{
    if (self = [super init]) {
        _firstNews = first;
        _secondNews = second;
        _imageURLs = imageURLs;
    }
    return self;
}

@end
