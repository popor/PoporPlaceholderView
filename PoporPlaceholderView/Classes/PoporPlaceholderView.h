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
typedef void(^PoporPlaceholderViewBlock) (PoporPlaceholderView * placeholderView);

@interface PoporPlaceholderView : UIView <PlaceholderViewProtocol>

@property (nonatomic, strong) NSString    * title; // 只在初始化时候用到,以后可以在freshStatus使用NSMutableAttributedString
@property (nonatomic, strong) UIImage     * image;
@property (nonatomic, strong) UILabel     * l;
@property (nonatomic, strong) UIImageView * iv;

@property (nonatomic, copy  ) PoporPlaceholderViewShowBlock showBlock;
@property (nonatomic, strong) UITapGestureRecognizer * viewTapGR;
@property (nonatomic, strong) UITapGestureRecognizer * lTapGR;
@property (nonatomic, strong) UITapGestureRecognizer * ivTapGR;

@property (nonatomic, copy  ) PoporPlaceholderViewBlock viewClickBlock;
@property (nonatomic, copy  ) PoporPlaceholderViewBlock lClickBlock; // 需要单独设置
@property (nonatomic, copy  ) PoporPlaceholderViewBlock ivClickBlock; // 需要单独设置

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image viewBlock:(PoporPlaceholderViewBlock)viewBlock;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image viewBlock:(PoporPlaceholderViewBlock)viewBlock showBlock:(PoporPlaceholderViewShowBlock)showBlock;

@end
