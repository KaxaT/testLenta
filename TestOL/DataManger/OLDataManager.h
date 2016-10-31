//
//  OLDataManager.h
//  TestOL
//
//  Created by Oles Byzhon on 30.10.16.
//  Copyright © 2016 testOL. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DATA [OLDataManager sharedInstance]
extern NSString * const kDataUpdatedNotification;
@class OLGroupedNews;

@interface OLDataManager : NSObject{
    
}
@property(strong, nonatomic, readonly) NSArray *newsData;


+ (instancetype)sharedInstance;
- (void)requestData;
- (NSInteger)newsSectionsCount;
- (OLGroupedNews*)newsForItem:(NSInteger)item;

@end
