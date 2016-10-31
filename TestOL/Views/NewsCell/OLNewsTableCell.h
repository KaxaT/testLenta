//
//  OLNewsTableCell.h
//  TestOL
//
//  Created by Oles Byzhon on 30.10.16.
//  Copyright © 2016 testOL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OLGroupedNews;
@interface OLNewsTableCell : UITableViewCell{
    OLGroupedNews *_news;

    IBOutlet UILabel *_firstTitle;
    IBOutlet UIImageView *_firstImage;
    IBOutlet UILabel *_secondTitle;
    IBOutlet UILabel *_secondDescription;
    IBOutlet UICollectionView *_collectionView;
    
}

- (void)updateWithNews:(OLGroupedNews*)news;

@end
