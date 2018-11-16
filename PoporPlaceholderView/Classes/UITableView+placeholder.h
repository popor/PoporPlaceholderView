//
//  UITableView+placeholder.h
//  PoporPlaceholderView
//
//  Created by popor on 2018/4/18.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PoporPlaceholderView.h"

@interface UITableView (placeholder)

/* 占位图 */
@property (nonatomic, strong) UIView<PlaceholderViewProtocol> *placeHolderView;

@end
