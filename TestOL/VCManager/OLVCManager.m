//
//  OLVCManager.m
//  TestOL
//
//  Created by Oles Byzhon on 30.10.16.
//  Copyright © 2016 testOL. All rights reserved.
//

#import "OLVCManager.h"
#import "OLMainVC.h"
#import "OLAboutVC.h"

@implementation OLVCManager

#pragma mark - Initialize

+ (instancetype)sharedInstance {
    static OLVCManager *__instance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        __instance = [[OLVCManager alloc] init];
    });
    return __instance;
}

- (void)initializeWithDefaultController {
    //init window
    _keyWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    //init navigation
    _navigationController = [[UINavigationController alloc] initWithNavigationBarClass:nil toolbarClass:nil];
    [_navigationController setNavigationBarHidden:YES];
    _menuVC = [[OLAppMenu alloc] init];
    _feedDrawerController = [[MMDrawerController alloc]
                             initWithCenterViewController:_navigationController leftDrawerViewController:_menuVC];
    [_feedDrawerController setRestorationIdentifier:@"MMDrawer"];
    [_feedDrawerController setMaximumLeftDrawerWidth:2*(_navigationController.view.frame.size.width/3)];
    [_feedDrawerController setShowsShadow:YES];
    [_feedDrawerController setShadowRadius:50];
    [_feedDrawerController setShouldStretchDrawer:NO];

    [_feedDrawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [_feedDrawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];

    _keyWindow.rootViewController = _feedDrawerController;
    [_keyWindow makeKeyAndVisible];


    [self showMainScreen];
}

#pragma mark - Navigation
- (void)showMainScreen{
    OLMainVC *viewController = [OLMainVC viewControllerFromDefaultNib];
    [self setCenterViewController:viewController];
}

- (void)showAboutScreen{
    OLAboutVC *viewController = [OLAboutVC viewControllerFromDefaultNib];
    [self setCenterViewController:viewController];
}

//- (void)presentModalViewController:(UIViewController *)viewController {
//    [_navigationController presentViewController:viewController animated:YES completion:nil];
//}

- (void)showMenu {
    if (_feedDrawerController.openSide == MMDrawerSideNone) {
        [_feedDrawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    } else {
        [_feedDrawerController closeDrawerAnimated:YES completion:nil];
    }
}

#pragma mark - Helpers

- (void)setCenterViewController:(UIViewController *)viewController {
    [_navigationController setViewControllers:@[viewController] animated:YES];
    [_feedDrawerController.centerViewController.view setAlpha:1.0f];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MSRViewControllerOpened" object:viewController];
    [self slideOutMenu];
}

- (void)slideOutMenu{
    [_feedDrawerController closeDrawerAnimated:YES completion:nil];
}

@end
