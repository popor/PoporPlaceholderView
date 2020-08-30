//
//  UITableView+placeholder.h
//  PoporPlaceholderView
//
//  Created by popor on 2018/4/18.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PoporPlaceholderView.h"

typedef BOOL(^UITableViewPlaceHolderEmptyBlock)(UITableView *tableView, UIView *placeHolderView);

@interface UITableView (placeholder)

/* 占位图 */
@property (nonatomic, strong) UIView<PlaceholderViewProtocol> *placeHolderView;

/* 自定义 判断是否显示placeHolderView的block
 例如: 假如section = 3, 只有最后section为空或者全部为空的时候显示placeHolderView, 这就需要自定义placeHolderEmptyBlock了.
 */
@property (nonatomic, copy  ) UITableViewPlaceHolderEmptyBlock placeHolderEmptyBlock;

@end
