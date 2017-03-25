//
//  ZRBaseDescribeData.m
//  ZRTableViewCell
//
//  Created by Seiko on 17/3/23.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import "ZRBaseDescribeData.h"

#import "ZRBaseTableViewCell.h"

@interface ZRBaseDescribeData ()

@property (nonatomic, weak) ZRBaseTableViewCell *customCell;

@end

@implementation ZRBaseDescribeData

- (instancetype)init {
    if (self = [super init]) {
        _customCellBlock = [self defaultCustomCellBlock];
    }
    
    return self;
}

- (CustomCellBlock)defaultCustomCellBlock {
    return ^(ZRBaseTableViewCell *cell, ZRBaseDescribeData *describeData) {
        _customCell = cell;
        cell.describeData = describeData;
    };
}

- (CGFloat)cellHeight {
    return [_customCell sizeThatFits:CGSizeZero].height;
}






@end
