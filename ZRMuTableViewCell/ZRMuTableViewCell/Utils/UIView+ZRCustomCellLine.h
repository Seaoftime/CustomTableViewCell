//
//  UIView+ZRCustomCellLine.h
//  ZRMuTableViewCell
//
//  Created by Seiko on 17/3/23.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZRCustomCellLine)

//Add bottom one pixel line for view.
- (UIView *)zrr_addBottomLineWithLeftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin;

@end
