//
//  ZRCustomCellData.h
//  ZRMuTableViewCell
//
//  Created by Seiko on 17/3/23.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import "ZRBaseDescribeData.h"

#import "ZRCustomCell2.h"

@interface ZRCustomCellData : ZRBaseDescribeData


//＊＊data类型中要包含页面所有 自定义类型的 Cell 所需的数据

//但每一个类型的 Cell 的 Data 用不到这么多属性，所以这样就浪费了一些内存资源。

//cell1
@property (nonatomic, copy) NSString *contentStr;
@property (nonatomic, copy) NSString *iconNameStr;

//cell2
@property (nonatomic, assign) BOOL switchStatus;

@property (nonatomic, weak) id<ZRCustomCell2Delegate> cell2Delegate;







@end
