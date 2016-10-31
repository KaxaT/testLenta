//
//  OLAppMenu.m
//  TestOL
//
//  Created by Oles Byzhon on 30.10.16.
//  Copyright © 2016 testOL. All rights reserved.
//

#import "OLAppMenu.h"
#import "OLVCManager.h"

@interface OLAppMenu ()

@end

@implementation OLAppMenu

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onMain {
    [VCMANAGER showMainScreen];
}

- (IBAction)onAbout {
    [VCMANAGER showAboutScreen];
}


@end
