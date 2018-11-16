//
//  PoporPlaceholderView.m
//  PoporPlaceholderView
//
//  Created by popor on 2018/4/18.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "PoporPlaceholderView.h"
#import <Masonry/Masonry.h>
#import <PoporUI/UIImage+create.h>

@implementation PoporPlaceholderView
@synthesize pOldType, pNewType;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image clickBlock:(BlockPVoid)clickBlock {
    return [self initWithFrame:frame title:title image:image clickBlock:clickBlock showBlock:nil];
}
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image clickBlock:(BlockPVoid)clickBlock showBlock:(PoporPlaceholderViewShowBlock)showBlock {
    if (self = [super init]) {
        self.frame = frame;
        self.backgroundColor = [UIColor clearColor];
        self.title = title ? : @"";
        self.image = image ? : [UIImage imageFromColor:[UIColor clearColor] size:CGSizeMake(1, 1)];
        self.clickBlock = clickBlock;
        self.showBlock  = showBlock;
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
    if (!self.tapGR) {
        self.tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGRAction)];
        [self addGestureRecognizer:self.tapGR];
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
- (void)tapGRAction {
    if (self.clickBlock) {
        self.clickBlock();
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

#pragma mark - 刷新图片文字
- (void)freshStatus {
    if (self.pNewType != self.pOldType) {
        self.pOldType = pNewType;
        switch (self.pOldType) {
            case PoporPlaceholderTypeNullInfo:
                self.iv.image = [self imageBundleNamed:PoporPlaceholderTypeNullInfoImage];
                self.l.text   = @"暂时还没有数据";
                break;
            case PoporPlaceholderTypeNullMessage:
                self.iv.image = [self imageBundleNamed:PoporPlaceholderTypeNullMessageImage];
                self.l.text   = @"暂无相关内容";
                break;
            case PoporPlaceholderTypeNullSearch:
                self.iv.image = [self imageBundleNamed:PoporPlaceholderTypeNullSearchImage];
                self.l.text   = @"没有搜到相关内容";
                break;
            case PoporPlaceholderTypeNetError:
                self.iv.image = [self imageBundleNamed:PoporPlaceholderTypeNetErrorImage];
                self.l.text   = @"网络连接失败";
                break;
            case PoporPlaceholderTypeServerError:
                self.iv.image = [self imageBundleNamed:PoporPlaceholderTypeServerErrorImage];
                self.l.text   = @"系统出错，请稍后再试";
                break;
                
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
