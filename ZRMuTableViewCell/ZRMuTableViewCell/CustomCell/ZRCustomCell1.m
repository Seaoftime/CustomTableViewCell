//
//  ZRCustomCell1.m
//  ZRMuTableViewCell
//
//  Created by Seiko on 17/3/23.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import "ZRCustomCell1.h"

#import "Masonry.h"
#import "ZRCustomCellData.h"
#import "UIView+ZRCustomCellLine.h"

@implementation ZRCustomCell1


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSubviews];
    }
    return self;
}


//自定义cell
- (void)loadSubviews {
    [self.contentView zrr_addBottomLineWithLeftMargin:0 rightMargin:0];
    _iconImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_iconImageView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.left.equalTo(self.contentView).with.offset(12);
        make.centerY.equalTo(self.contentView);
        make.width.equalTo(@25);
        make.height.equalTo(@25);
    }];
    
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.textColor = [UIColor orangeColor];
    _contentLabel.font = [UIFont systemFontOfSize:17];
    _contentLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.left.equalTo(@(12 + 25 + 10));
        make.centerY.equalTo(self.contentView);
        make.width.equalTo(@100);
        make.height.equalTo(@40);
    }];
    
}


//数据赋值
//setter && getter
- (void)setDescribeData:(ZRBaseDescribeData *)describeData {
    if ([describeData isKindOfClass:[ZRCustomCellData class]]) {
        
        ZRCustomCellData *celldata = (ZRCustomCellData *)describeData;
        _iconImageView.image = [UIImage imageNamed:celldata.iconNameStr];
        _contentLabel.text = celldata.contentStr;
        //[self setNeedsLayout];
        
        // 如果使用的是 frame 布局，这里需要更新布局
    }

}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
