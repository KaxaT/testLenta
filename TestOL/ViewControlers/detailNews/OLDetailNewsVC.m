//
//  OLDetailNewsVC.m
//  TestOL
//
//  Created by Oles Byzhon on 01.11.16.
//  Copyright © 2016 testOL. All rights reserved.
//

#import "OLDetailNewsVC.h"
#import "OLNews.h"
#import "UIImageView+AFNetworking.h"

@interface OLDetailNewsVC ()

@end

@implementation OLDetailNewsVC

+ (instancetype)detailNewsVCWithNews:(OLNews *)news andImages:(NSArray*)imgURLs{
    id vc = [[[self class] alloc] initWithNews:news andImages:imgURLs];
    return vc;
}

-(instancetype)initWithNews:(OLNews*)news andImages:(NSArray*)imgURLs{
    if(self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil]){
        _news = news;
        _imgURLs = imgURLs;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupInfo];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupInfo{
    _titleLabel.text = _news.newsTitle;
    _descriptionLabel.text = _news.newsDescription;
    [_topImgView setImageWithURL:[NSURL URLWithString:_news.imageURL]];
    [_botomImgView1 setImageWithURL:[NSURL URLWithString:_imgURLs[0]]];
    [_bottomImgView2 setImageWithURL:[NSURL URLWithString:_imgURLs[1]]];

}
#pragma mark <UITouchDelegate>

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    if(touch.view == self.view){
        [self closeView];
    }
}

-(void)closeView{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
