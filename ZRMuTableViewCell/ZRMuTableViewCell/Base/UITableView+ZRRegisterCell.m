//
//  UITableView+ZRRegisterCell.m
//  ZRTableViewCell
//
//  Created by Seiko on 17/3/23.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import "UITableView+ZRRegisterCell.h"

@implementation UITableView (ZRRegisterCell)

- (void)registerCellClasses:(NSArray<Class> *)classes {
    for (Class classType in classes) {
        [self registerClass:classType forCellReuseIdentifier:NSStringFromClass(classType)];
    }
}

- (UITableViewCell *)dequeueReusableCellWithClassType:(Class)classType {
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(classType)];
}

@end
