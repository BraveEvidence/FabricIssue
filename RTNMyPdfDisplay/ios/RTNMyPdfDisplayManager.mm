#import <React/RCTLog.h>
#import <React/RCTUIManager.h>
#import <React/RCTViewManager.h>

@interface RTNMyPdfDisplayManager : RCTViewManager
@end

@implementation RTNMyPdfDisplayManager

RCT_EXPORT_MODULE(RTNMyPdfDisplay)

RCT_EXPORT_VIEW_PROPERTY(url, NSString)

@end