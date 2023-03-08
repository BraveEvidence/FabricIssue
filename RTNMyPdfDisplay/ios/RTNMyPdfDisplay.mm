#import "RTNMyPdfDisplay.h"

#import <react/renderer/components/RTNMyPdfDisplaySpecs/ComponentDescriptors.h>
#import <react/renderer/components/RTNMyPdfDisplaySpecs/EventEmitters.h>
#import <react/renderer/components/RTNMyPdfDisplaySpecs/Props.h>
#import <react/renderer/components/RTNMyPdfDisplaySpecs/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@interface RTNMyPdfDisplay () <RCTRTNMyPdfDisplayViewProtocol>
@end

@implementation RTNMyPdfDisplay {
    UIView *_view;
    PDFView *_pdfView;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<RTNMyPdfDisplayComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        static const auto defaultProps = std::make_shared<const RTNMyPdfDisplayProps>();
        _props = defaultProps;
        
        _view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _pdfView = [[PDFView alloc] initWithFrame: _view.bounds];
        [_view addSubview:_pdfView];
        
        self.contentView = _view;
    }
    
    return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<RTNMyPdfDisplayProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<RTNMyPdfDisplayProps const>(props);
    
    if (oldViewProps.url != newViewProps.url) {
        NSString* strUrl = [[NSString alloc] initWithCString:newViewProps.url.c_str() encoding:NSASCIIStringEncoding];
        
        NSURL *url = [[NSURL alloc] initWithString:strUrl];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            PDFDocument * document = [[PDFDocument alloc] initWithURL: url];
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                self->_pdfView.document = document;
            });
        });
    }
    
    [super updateProps:props oldProps:oldProps];
}

@end

Class<RCTComponentViewProtocol> RTNMyPdfDisplayCls(void)
{
    return RTNMyPdfDisplay.class;
}
