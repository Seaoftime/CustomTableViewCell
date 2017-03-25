//
//  UIView+ZRCustomCellLine.m
//  ZRMuTableViewCell
//
//  Created by Seiko on 17/3/23.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import "UIView+ZRCustomCellLine.h"

#import <objc/runtime.h>
#import "Masonry.h"

static char const *kBottomLineKey;


@implementation UIView (ZRCustomCellLine)


+ (instancetype)mc_line {
    UIView *line = [[UIView alloc] init];
    line.frame = CGRectMake(0, 0, 1.0/[UIScreen mainScreen].scale, 1.0/[UIScreen mainScreen].scale);
    line.backgroundColor = [UIColor lightGrayColor];
    return line;
}


#pragma mark - Public methods.

- (UIView *)zrr_addBottomLineWithLeftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin {
    UIView *line = [self yws_getCellLineByKey:&kBottomLineKey];
    [line removeFromSuperview];
    [self addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.left.equalTo(self).with.offset(leftMargin);
        make.right.equalTo(self).with.offset(-rightMargin);
        make.height.equalTo(@(1.0/[UIScreen mainScreen].scale));
    }];
    
    return line;
}


#pragma mark - Private methods.

- (UIView *)yws_getCellLineByKey:(void *)key {
    UIView *line = objc_getAssociatedObject(self, key);
    if (!line) {
        line = [UIView mc_line];
        objc_setAssociatedObject(self, key, line, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return line;
}


@end
