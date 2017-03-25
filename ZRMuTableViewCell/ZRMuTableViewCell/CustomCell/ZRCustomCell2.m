//
//  ZRCustomCell2.m
//  ZRMuTableViewCell
//
//  Created by Seiko on 17/3/23.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import "ZRCustomCell2.h"

#import "Masonry.h"
#import "UIView+ZRCustomCellLine.h"
#import "ZRCustomCellData.h"

@implementation ZRCustomCell2

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSubviews];
    }
    return self;
}


#pragma mark - Load views.

- (void)loadSubviews {
    [self.contentView zrr_addBottomLineWithLeftMargin:0 rightMargin:0];
    
   
    _rightSwitchButton = [[UISwitch alloc] init];
    [_rightSwitchButton addTarget:self action:@selector(switchStatusChanged:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_rightSwitchButton];
    [_rightSwitchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).with.offset(-10);
    }];
}



- (void)setDescribeData:(ZRBaseDescribeData *)describeData {

    if ([describeData isKindOfClass:ZRCustomCellData.class]) {
        ZRCustomCellData *data2 = (ZRCustomCellData *)describeData;
       
        _rightSwitchButton.on = data2.switchStatus;
        _delegate = data2.cell2Delegate;
    }


}

#pragma mark - button  Action.

- (void)switchStatusChanged:(UISwitch *)swch {
    [_delegate switchStatusChanged:swch];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
