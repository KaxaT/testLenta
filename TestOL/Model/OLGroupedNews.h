//
//  OLGroupedNews.h
//  TestOL
//
//  Created by Oles Byzhon on 31.10.16.
//  Copyright © 2016 testOL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OLNews.h"

@interface OLGroupedNews : NSObject{

}
@property (nonatomic, readonly) OLNews *firstNews;
@property (nonatomic, readonly) OLNews *secondNews;
@property (nonatomic, readonly) NSArray *imageURLs;

-(instancetype)initWithFirst:( OLNews*)first second:( OLNews*)second andImageURLs:( NSArray*)imageURLs;
@end
