//
//  OLDataManager.m
//  TestOL
//
//  Created by Oles Byzhon on 30.10.16.
//  Copyright © 2016 testOL. All rights reserved.
//

#import "OLDataManager.h"
#import "OLNetworkManager.h"
#import "OLNews.h"
#import "OLGroupedNews.h"

static const int kNumberOfImagesAtCell = 4;
NSString * const kDataUpdatedNotification = @"dataUpdated";
@implementation OLDataManager

+ (instancetype)sharedInstance {
    static OLDataManager *__instance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        __instance = [[OLDataManager alloc] init];
    });

    return __instance;
}

-(void)requestData{

    [NETWORK requestListWithCompletion:^(NSDictionary *response, NSError *error) {
        if(!error){
            _newsData = [response objectForKey:@"headlines"];
            [[NSNotificationCenter defaultCenter] postNotificationName:kDataUpdatedNotification object:nil];
        }else{
            //TODO: алерт
        }
    }];
}

- (NSInteger)newsSectionsCount{
    NSInteger count = (int)(_newsData.count/2);
    return count;
}


- (OLGroupedNews*)newsForItem:(NSInteger)item{
    int newsCursor = 2*item;
    NSArray *chosenImagesURLs;
    OLNews *first = nil;
    OLNews *second = nil;
    OLGroupedNews *result = nil;
    if(newsCursor <= _newsData.count){
        first = [self makeReflowNewsWithCursor:newsCursor];
        second = [self makeReflowNewsWithCursor:newsCursor+1];;
    }else{
        first = [self makeReflowNewsWithCursor:newsCursor];
    }
    chosenImagesURLs = [self makeImageURLsArray];
    result = [[OLGroupedNews alloc] initWithFirst:first second:second andImageURLs:chosenImagesURLs];
    return result;
}

-(OLNews*)makeReflowNewsWithCursor:(NSInteger)cursor{

    return  [[OLNews alloc] initWithDictionary:[NSDictionary dictionaryWithObjectsAndKeys:
                                                [[[_newsData objectAtIndex:cursor] objectForKey:@"info"] objectForKey:@"title"], @"title",
                                                [[[_newsData objectAtIndex:cursor] objectForKey:@"title_image"] objectForKey:@"url"],@"image_url",
                                                [[[_newsData objectAtIndex:cursor] objectForKey:@"info"] objectForKey:@"rightcol"],@"description"
                                                ,nil]];
}

-(NSArray*)makeImageURLsArray{
    NSArray *chosenForImages;
    NSRange imagesRange = NSMakeRange(arc4random_uniform((_newsData.count-1) - kNumberOfImagesAtCell), kNumberOfImagesAtCell);
    chosenForImages = [NSArray arrayWithArray:[_newsData subarrayWithRange:imagesRange]];

    NSMutableArray *imageURLs = [NSMutableArray arrayWithCapacity:4];
    for(NSDictionary *dict in chosenForImages){
        NSString *urlStr = [[dict objectForKey:@"title_image"] objectForKey:@"url"];
        if(urlStr){
            [imageURLs addObject:urlStr];
        }
    }

    return [imageURLs copy];
}
@end
