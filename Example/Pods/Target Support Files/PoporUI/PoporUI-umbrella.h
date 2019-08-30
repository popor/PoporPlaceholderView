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

#import "UIImage+pCreate.h"
#import "UIImage+pGradient.h"
#import "UIImage+pRead.h"
#import "UIImage+pSave.h"
#import "UIImage+pTool.h"

FOUNDATION_EXPORT double PoporUIVersionNumber;
FOUNDATION_EXPORT const unsigned char PoporUIVersionString[];

