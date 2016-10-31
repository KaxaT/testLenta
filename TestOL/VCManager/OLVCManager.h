//
//  OLVCManager.h
//  TestOL
//
//  Created by Oles Byzhon on 30.10.16.
//  Copyright © 2016 testOL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMDrawerController/MMDrawerController.h>
#import "OLAppMenu.h"

#define VCMANAGER [OLVCManager sharedInstance]
@class OLNews;

@interface OLVCManager : NSObject{
    OLAppMenu *_menuVC;
    MMDrawerController *_feedDrawerController;
}
@property(nonatomic, strong, readonly) UINavigationController *navigationController;
@property(nonatomic, strong, readonly) UIWindow *keyWindow;

+ (instancetype) sharedInstance;
- (void)initializeWithDefaultController;

- (void)showMainScreen;
- (void)showAboutScreen;
- (void)showMenu;
- (void)showDetailViewWith:(OLNews*)news andImages:(NSArray*)images;
//- (void)presentModalViewController:(UIViewController*)viewController;
- (void)setCenterViewController:(UIViewController *)viewControlle;

-(void)showAlertFor:(NSError*)error;
@end
