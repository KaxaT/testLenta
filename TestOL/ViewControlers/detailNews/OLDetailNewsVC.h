//
//  OLDetailNewsVC.h
//  TestOL
//
//  Created by Oles Byzhon on 01.11.16.
//  Copyright © 2016 testOL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OLNews;
@interface OLDetailNewsVC : UIViewController{
    OLNews *_news;
    NSArray *_imgURLs;
    IBOutlet UILabel *_titleLabel;
    IBOutlet UILabel *_descriptionLabel;
    IBOutlet UIImageView *_bottomImgView2;
    IBOutlet UIImageView *_botomImgView1;
    IBOutlet UIImageView *_topImgView;
}
+ (instancetype)detailNewsVCWithNews:(OLNews *)news andImages:(NSArray*)imgURLs;

@end
