//
//  UIBarButtonItem+FQBarButtonBadge.h
//  FQBaseKit
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (FQBarButtonBadge)

@property (strong, atomic) UILabel *jk_badge;

// Badge value to be display
@property (nonatomic) NSString *jk_badgeValue;
// Badge background color
@property (nonatomic) UIColor *jk_badgeBGColor;
// Badge text color
@property (nonatomic) UIColor *jk_badgeTextColor;
// Badge font
@property (nonatomic) UIFont *jk_badgeFont;
// Padding value for the badge
@property (nonatomic) CGFloat jk_badgePadding;
// Minimum size badge to small
@property (nonatomic) CGFloat jk_badgeMinSize;
// Values for offseting the badge over the BarButtonItem you picked
@property (nonatomic) CGFloat jk_badgeOriginX;
@property (nonatomic) CGFloat jk_badgeOriginY;
// In case of numbers, remove the badge when reaching zero
@property BOOL jk_shouldHideBadgeAtZero;
// Badge has a bounce animation when value changes
@property BOOL jk_shouldAnimateBadge;

@end

NS_ASSUME_NONNULL_END
