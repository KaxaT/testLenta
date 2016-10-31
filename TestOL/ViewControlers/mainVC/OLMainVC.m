//
//  OLMainVC.m
//  TestOL
//
//  Created by Oles Byzhon on 30.10.16.
//  Copyright © 2016 testOL. All rights reserved.
//

#import "OLMainVC.h"
#import "OLDataManager.h"
#import "OLNewsTableCell.h"

static  NSString * const kCellIdentifiler = @"mainCell";

@interface OLMainVC ()

@end

@implementation OLMainVC

#pragma marl - lifecircle
+ (instancetype)viewControllerFromDefaultNib {
    id vc = [[[self class] alloc] initWithNibName:NSStringFromClass([self class]) bundle:nil];
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateData) name:kDataUpdatedNotification object:nil];
    [_tableView registerNib:[UINib nibWithNibName:@"OLNewsTableCell" bundle:nil] forCellReuseIdentifier:kCellIdentifiler];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)updateData{
    [_tableView reloadData];
}
#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int count = [DATA newsSectionsCount];
    return count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OLNewsTableCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifiler forIndexPath:indexPath];
    if(!cell){
        cell = [[OLNewsTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifiler];
    }
    [cell updateWithNews:[DATA newsForItem:indexPath.item]];
    return cell;
}

@end
