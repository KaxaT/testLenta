//
//  OLNewsTableCell.m
//  TestOL
//
//  Created by Oles Byzhon on 30.10.16.
//  Copyright © 2016 testOL. All rights reserved.
//

#import "OLNewsTableCell.h"
#import "OLNetworkManager.h"
#import "OLImageCell.h"
#import "UIImageView+AFNetworking.h"
#import "OLGroupedNews.h"
#import "OLVCManager.h"

NSString * const kImageCellReuseIdentifiler = @"imageCell";

@implementation OLNewsTableCell

- (void)awakeFromNib {
    [_collectionView registerNib:[UINib nibWithNibName:@"OLImageCell" bundle:nil] forCellWithReuseIdentifier:kImageCellReuseIdentifiler];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateWithNews:(OLGroupedNews*)news{
    _news = news;
    [self setupLables];
    [_collectionView reloadData];
}

- (void)setupLables{
    _firstTitle.text = _news.firstNews.newsTitle;
    NSURL *imageUrl = [NSURL URLWithString:_news.firstNews.imageURL];
    [_firstImage setImageWithURL:imageUrl];
    _secondTitle.text = _news.secondNews.newsTitle;
    _secondDescription.text = _news.secondNews.newsDescription;
}
#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    int count = _news.imageURLs.count;
    return count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    OLImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kImageCellReuseIdentifiler forIndexPath:indexPath];
    NSString *urlStr = [_news.imageURLs objectAtIndex:indexPath.item];
    [cell.imageView setImageWithURL:[NSURL URLWithString:urlStr]];
    cell.clipsToBounds = YES;
    return cell;
}
- (IBAction)onFirst {
    NSArray *subarray = [_news.imageURLs subarrayWithRange:NSMakeRange(0,2)];
    [VCMANAGER showDetailViewWith:_news.firstNews andImages:subarray];
}
- (IBAction)onSecond:(id)sender {
    NSArray *subarray = [_news.imageURLs subarrayWithRange:NSMakeRange(1,2)];
    [VCMANAGER showDetailViewWith:_news.firstNews andImages:subarray];
}
@end
