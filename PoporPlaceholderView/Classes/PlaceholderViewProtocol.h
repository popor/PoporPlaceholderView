//
//  PlaceholderViewProtocol.h
//  PoporPlaceholderView
//
//  Created by apple on 2018/4/18.
//  Copyright © 2018年 艾慧勇. All rights reserved.
//

#ifndef PlaceholderViewProtocol_h
#define PlaceholderViewProtocol_h

typedef NS_ENUM (int, PoporPlaceholderType) {
    PoporPlaceholderTypeNullInfo = 1, // 无数据
    PoporPlaceholderTypeNullMessage,  // 无消息
    PoporPlaceholderTypeNullSearch,   // 无搜索信息
    PoporPlaceholderTypeNetError,     // 网络出错
    PoporPlaceholderTypeServerError,  // 服务器出错
    PoporPlaceholderTypeUnlogin,      // 未登录
};

@protocol PlaceholderViewProtocol <NSObject>

@property (nonatomic        ) PoporPlaceholderType pOldType;
@property (nonatomic        ) PoporPlaceholderType pNewType;

- (void)freshStatus;

@end

#endif /* Header_h */
