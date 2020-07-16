//
//  PoporPlaceholderView.m
//  PoporPlaceholderView
//
//  Created by popor on 2018/4/18.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "PoporPlaceholderView.h"
#import <Masonry/Masonry.h>
#import <PoporUI/UIImage+pCreate.h>

@implementation PoporPlaceholderView
@synthesize pOldType, pNewType;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image viewBlock:(PoporPlaceholderViewBlock)viewBlock {
    return [self initWithFrame:frame title:title image:image viewBlock:viewBlock showBlock:nil];
}
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image viewBlock:(PoporPlaceholderViewBlock)viewBlock showBlock:(PoporPlaceholderViewShowBlock)showBlock {
    if (self = [super init]) {
        self.frame           = frame;
        self.backgroundColor  = [UIColor clearColor];
        self.title            = title ? : @"";
        self.image            = image ? : [UIImage imageFromColor:[UIColor clearColor] size:CGSizeMake(1, 1)];
        self.viewClickBlock   = viewBlock;
        self.showBlock        = showBlock;

        self.text_nullInfo    = @"暂时还没有数据";
        self.text_nullMessage = @"暂无相关内容";
        self.text_nullSearch  = @"没有搜到相关内容";
        self.text_netError    = @"网络连接失败";
        self.text_serverError = @"系统出错，请稍后再试";
        self.text_unlogin     = @"您还未登录";

        [self addViews];
    }
    return self;
}

- (void)layoutSubviews {
    [self.iv mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.iv.image.size.width);
        make.height.mas_equalTo(self.iv.image.size.height);
    }];
}

- (void)addViews {
    if (!self.iv) {
        self.iv = [UIImageView new];
        self.iv.image = self.image;
        [self addSubview:self.iv];
    }
    if (!self.l) {
        self.l = [UILabel new];
        self.l.frame = CGRectMake(0, 0, 0, 20);
        self.l.font = [UIFont systemFontOfSize:16];
        self.l.textColor = [UIColor grayColor];
        self.l.textAlignment = NSTextAlignmentCenter;
        
        self.l.text = self.title;
        
        [self.l setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        self.l.numberOfLines =0;
        
        [self addSubview:self.l];
    }
    if (!self.viewTapGR) {
        self.viewTapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapGRAction)];
        [self addGestureRecognizer:self.viewTapGR];
    }
    
    if (!self.lTapGR) {
        self.lTapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lTapGRAction)];
        [self.l addGestureRecognizer:self.lTapGR];
    }
    
    if (!self.ivTapGR) {
        self.ivTapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ivTapGRAction)];
        [self.iv addGestureRecognizer:self.ivTapGR];
    }
    
    [self.iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.iv.image.size.width);
        make.height.mas_equalTo(self.iv.image.size.height);
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(self.mas_bottom).multipliedBy(0.3);
    }];
    [self.l mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.right.mas_equalTo(-25);
        make.top.mas_equalTo(self.iv.mas_bottom).mas_offset(5);
    }];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    if (self.showBlock) {
        self.showBlock(YES, self);
    }
}

- (void)removeFromSuperview {
    [super removeFromSuperview];
    if (self.showBlock) {
        self.showBlock(NO, self);
    }
}

- (void)viewTapGRAction {
    if (self.viewClickBlock) {
        self.viewClickBlock(self);
    }
}

- (void)lTapGRAction {
    if (self.lClickBlock) {
        self.lClickBlock(self);
    }
}

- (void)ivTapGRAction {
    if (self.ivClickBlock) {
        self.ivClickBlock(self);
    }
}

- (void)setTitle:(NSString *)title {
    if (_title) {
        _title = title;
        [self setNeedsLayout];
    }else{
        _title = title;
    }
}

- (void)setImage:(UIImage *)image {
    if (_image) {
        _image = image;
        [self setNeedsLayout];
    }else{
        _image = image;
    }
}

- (void)setLClickBlock:(PoporPlaceholderViewBlock)lClickBlock {
    _lClickBlock = lClickBlock;
    _l.userInteractionEnabled = lClickBlock ? YES:NO ;
    
}

- (void)setIvClickBlock:(PoporPlaceholderViewBlock)ivClickBlock {
    _ivClickBlock = ivClickBlock;
    _iv.userInteractionEnabled = ivClickBlock ? YES:NO ;
    
}

#pragma mark - 刷新图片文字
- (void)freshStatus {
    if (self.pNewType != self.pOldType) {
        self.pOldType = self.pNewType;
        switch (self.pOldType) {
            case PoporPlaceholderTypeNullInfo: {
                self.iv.image = [UIImage imageNamed:self.image_nullInfo];
                self.l.text   = self.text_nullInfo;
                break;
            }
            case PoporPlaceholderTypeNullMessage: {
                self.iv.image = [UIImage imageNamed:self.image_nullMessage];
                self.l.text   = self.text_nullMessage;
                break;
            }
            case PoporPlaceholderTypeNullSearch: {
                self.iv.image = [UIImage imageNamed:self.image_nullSearch];
                self.l.text   = self.text_nullSearch;
                break;
            }
            case PoporPlaceholderTypeNetError: {
                self.iv.image = [UIImage imageNamed:self.image_netError];
                self.l.text   = self.text_netError;
                break;
            }
            case PoporPlaceholderTypeServerError: {
                self.iv.image = [UIImage imageNamed:self.image_serverError];
                self.l.text   = self.text_serverError;
                break;
            }
            case PoporPlaceholderTypeUnlogin: {
                self.iv.image = [UIImage imageNamed:self.image_unlogin];
                self.l.text   = self.text_unlogin;
                break;
            }
                
            default:
                break;
        }
    }
}

- (UIImage *)imageBundleNamed:(NSString *)imageName {
    UIImage * (^ imageBundleBlock)(NSString *) = ^(NSString *imageName){
        static NSBundle * bundle;
        if (!bundle) {
            bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[self class]] pathForResource:@"PoporPlaceholderView" ofType:@"bundle"]];
        }
        return [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
    };
    return imageBundleBlock(imageName);
}

@end
