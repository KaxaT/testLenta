//
//  OLNews.h
//  TestOL
//
//  Created by Oles Byzhon on 31.10.16.
//  Copyright © 2016 testOL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OLNews : NSObject{

}
@property (nonatomic, readonly) NSString *newsTitle;
@property (nonatomic, readonly) NSString *newsDescription;
@property (nonatomic, readonly) NSString *imageURL;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;
@end
