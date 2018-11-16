#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "PlaceholderViewProtocol.h"
#import "PoporPlaceholderView.h"
#import "UICollectionView+placeholder.h"
#import "UITableView+placeholder.h"

FOUNDATION_EXPORT double PoporPlaceholderViewVersionNumber;
FOUNDATION_EXPORT const unsigned char PoporPlaceholderViewVersionString[];

