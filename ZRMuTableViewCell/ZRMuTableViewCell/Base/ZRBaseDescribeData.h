//
//  ZRBaseDescribeData.h
//  ZRTableViewCell
//
//  Created by Seiko on 17/3/23.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@class ZRBaseTableViewCell;
@class ZRBaseDescribeData;

typedef void (^CustomCellBlock)(ZRBaseTableViewCell *cell, ZRBaseDescribeData *describeData);
typedef void (^SelectCellBlock)(ZRBaseTableViewCell *cell, ZRBaseDescribeData *describeData);

@interface ZRBaseDescribeData : NSObject

@property (nonatomic, copy) Class cellClass;
@property (nonatomic, copy) CustomCellBlock customCellBlock;
@property (nonatomic, copy) SelectCellBlock selectCellBlock;


- (CGFloat)cellHeight;
- (CustomCellBlock)defaultCustomCellBlock;



@end
