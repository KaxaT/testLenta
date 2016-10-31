//
//  OLAboutVC.m
//  TestOL
//
//  Created by Oles Byzhon on 30.10.16.
//  Copyright © 2016 testOL. All rights reserved.
//

#import "OLAboutVC.h"

@interface OLAboutVC ()

@end

@implementation OLAboutVC

+ (instancetype)viewControllerFromDefaultNib {
    id vc = [[[self class] alloc] initWithNibName:NSStringFromClass([self class]) bundle:nil];
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
