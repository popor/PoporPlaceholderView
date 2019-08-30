//
//  UICollectionView+placeholder.m
//  PoporPlaceholderView
//
//  Created by popor on 2018/4/18.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "UICollectionView+placeholder.h"

#import <objc/runtime.h>
#import <PoporFoundation/NSObject+pSwizzling.h>
#import <MJRefresh/MJRefresh.h>

@implementation UICollectionView (placeholder)
@dynamic placeHolderView;

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self methodSwizzlingWithOriginalSelector:@selector(reloadData) bySwizzledSelector:@selector(gy_reloadData)];
    });
}

- (void)gy_reloadData {
    [self gy_checkEmpty];
    [self gy_reloadData];
}

- (void)gy_checkEmpty {
    if (!self.placeHolderView) {
        return;
    }
    BOOL isEmpty = YES;
    id<UICollectionViewDataSource> src = self.dataSource;
    NSInteger sections = 1;
    if ([src respondsToSelector:@selector(numberOfSectionsInCollectionView:)]) {
        sections = [src numberOfSectionsInCollectionView:self];
        //[src numberOfSectionsInTableView:self];
    }
    for (int i = 0; i < sections; i++) {
        NSInteger rows = [src collectionView:self numberOfItemsInSection:i];
        if (rows>0) {
            isEmpty = NO;
            break;
        }
    }
    if (isEmpty) {
        [self addSubview:self.placeHolderView];
        [self.placeHolderView freshStatus];
    }else{
        [self.placeHolderView removeFromSuperview];
    }
    self.mj_footer.hidden = isEmpty;
}

#pragma mark - set get
- (void)setPlaceHolderView:(UIView *)placeHolderView {
    objc_setAssociatedObject(self, @"placeHolderView", placeHolderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self reloadData];
}

- (UIView *)placeHolderView {
    return objc_getAssociatedObject(self, @"placeHolderView");
}

@end
