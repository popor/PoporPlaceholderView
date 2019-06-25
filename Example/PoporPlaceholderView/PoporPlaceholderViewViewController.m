//
//  PoporPlaceholderViewViewController.m
//  PoporPlaceholderView
//
//  Created by popor on 11/16/2018.
//  Copyright (c) 2018 popor. All rights reserved.
//

#import "PoporPlaceholderViewViewController.h"

#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>
#import <PoporPlaceholderView/UITableView+placeholder.h>

@interface PoporPlaceholderViewViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView * infoTV;

@end

@implementation PoporPlaceholderViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Demo";
    
    self.infoTV = [self addTVs];
    [self setMJFreshTV:self.infoTV];
}

#pragma mark - UITableView
- (UITableView *)addTVs {
    UITableView * oneTV = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    oneTV.delegate   = self;
    oneTV.dataSource = self;
    
    oneTV.allowsMultipleSelectionDuringEditing = YES;
    oneTV.directionalLockEnabled = YES;
    
    oneTV.estimatedRowHeight           = 0;
    oneTV.estimatedSectionHeaderHeight = 0;
    oneTV.estimatedSectionFooterHeight = 0;
    
    [self.view addSubview:oneTV];
    
    [oneTV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    return oneTV;
}

- (void)setMJFreshTV:(UITableView *)tv {
    __weak typeof(self) weakSelf = self;
    __weak typeof(tv) weakTV = tv;
    
    weakTV.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf tableView:weakTV freshMore:NO];
    }];
    weakTV.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf tableView:weakTV freshMore:YES];
    }];
    
    [self tableView:weakTV freshMore:YES];
    
    weakTV.placeHolderView = [[PoporPlaceholderView alloc] initWithFrame:weakTV.bounds title:nil image:nil viewBlock:^(BOOL isShow, PoporPlaceholderView *placeholderView) {
        [weakTV.mj_header beginRefreshing];
        
    } showBlock:^(BOOL isShow, PoporPlaceholderView *placeholderView) {
        
    }];
    
}

- (void)tableView:(UITableView *)tableView freshMore:(BOOL)isMore {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView.mj_header endRefreshing];
        [tableView.mj_footer endRefreshing];
        
        tableView.tag = tableView.tag%PoporPlaceholderTypeServerError + 1;
        tableView.placeHolderView.pNewType = (PoporPlaceholderType)tableView.tag;
        [tableView reloadData];
    });
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellID = @"CellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%li", indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
