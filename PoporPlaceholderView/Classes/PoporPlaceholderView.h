//
//  PoporPlaceholderView.h
//  PoporPlaceholderView
//
//  Created by popor on 2018/4/18.
//  Copyright © 2018年 popor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PoporFoundation/PrefixBlock.h>
#import "PlaceholderViewProtocol.h"

@class PoporPlaceholderView;
typedef void(^PoporPlaceholderViewShowBlock) (BOOL isShow, PoporPlaceholderView * placeholderView);

@interface PoporPlaceholderView : UIView <PlaceholderViewProtocol>

@property (nonatomic, strong) NSString        * title;
@property (nonatomic, strong) UIImage         * image;

@property (nonatomic, strong) UILabel         * l;
@property (nonatomic, strong) UIImageView     * iv;
@property (nonatomic, copy  ) BlockPVoid clickBlock;
@property (nonatomic, copy  ) PoporPlaceholderViewShowBlock showBlock;
@property (nonatomic, strong) UITapGestureRecognizer * tapGR;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image clickBlock:(BlockPVoid)clickBlock;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image clickBlock:(BlockPVoid)clickBlock showBlock:(PoporPlaceholderViewShowBlock)showBlock;

@end
