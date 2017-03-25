//
//  UITableView+ZRRegisterCell.h
//  ZRTableViewCell
//
//  Created by Seiko on 17/3/23.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (ZRRegisterCell)

- (void)registerCellClasses:(NSArray<Class> *)classes;

- (UITableViewCell *)dequeueReusableCellWithClassType:(Class)classType;


@end
