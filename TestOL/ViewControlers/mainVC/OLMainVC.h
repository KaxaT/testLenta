//
//  OLMainVC.h
//  TestOL
//
//  Created by Oles Byzhon on 30.10.16.
//  Copyright © 2016 testOL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OLMainVC : UIViewController{
    NSArray *_feedData;

    IBOutlet UITableView *_tableView;
}



+ (instancetype)viewControllerFromDefaultNib;

@end
