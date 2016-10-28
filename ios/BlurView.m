#import "BlurView.h"
#import "BlurAmount.m"

@implementation BlurView {
  UIVisualEffectView *_visualEffectView;
  BlurView *blurEffect;
}

- (void)setBlurType:(NSString *)blurType
{
  if (_visualEffectView) {
    [_visualEffectView removeFromSuperview];
  }

  UIBlurEffect *blurEffect;

  if ([blurType isEqual: @"xlight"]) {
    blurEffect = [BlurAmount effectWithStyle:UIBlurEffectStyleExtraLight];
  } else if ([blurType isEqual: @"light"]) {
    blurEffect = [BlurAmount effectWithStyle:UIBlurEffectStyleLight];
  } else if ([blurType isEqual: @"dark"]) {
    blurEffect = [BlurAmount effectWithStyle:UIBlurEffectStyleDark];
  } else {
    blurEffect = [BlurAmount effectWithStyle:UIBlurEffectStyleDark];
  }

   _visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
}

- (void)setBlurAmount:(NSNumber *)blurAmount
{
    [BlurAmount updateBlurAmount:blurAmount];
}

- (void)layoutSubviews
{
  [super layoutSubviews];

  _visualEffectView.frame = self.bounds;
  [self insertSubview:_visualEffectView atIndex:0];
}

@end
