//
//  ZRCustomCell2.h
//  ZRMuTableViewCell
//
//  Created by Seiko on 17/3/23.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import "ZRBaseTableViewCell.h"

@protocol ZRCustomCell2Delegate <NSObject>

@optional
- (void)switchStatusChanged:(UISwitch *)switchhh;

@end

@interface ZRCustomCell2 : ZRBaseTableViewCell

@property (nonatomic, strong) UISwitch *rightSwitchButton;
@property (nonatomic, weak)   id<ZRCustomCell2Delegate> delegate;

@end
