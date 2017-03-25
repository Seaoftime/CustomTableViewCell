//
//  ZRTableViewController.m
//  ZRTableViewCell
//
//  Created by Seiko on 17/3/23.
//  Copyright © 2017年 RuiZhang. All rights reserved.
//

#import "ZRTableViewController.h"

#import "ZRCustomCellData.h"
#import "ZRCustomCell1.h"
#import "UITableView+ZRRegisterCell.h"
#import "ZRCustomCell2.h"

@interface ZRTableViewController ()<UITableViewDelegate, UITableViewDataSource, ZRCustomCell2Delegate>
@property (nonatomic, strong) UITableView *zrTableView;
@property (nonatomic, strong) NSArray<NSArray<ZRCustomCellData *> *> *cellDatas;


@end

@implementation ZRTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.title = @"我";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addSubviews];
    [self getCustomCellData];
    
}

//
//- (void)viewWillLayoutSubviews {
//    [super viewWillLayoutSubviews];
//    _zrTableView.frame = self.view.bounds;
//}




- (void)addSubviews {
    _zrTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _zrTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _zrTableView.backgroundColor = [UIColor colorWithRed:240/255.f green:240/255.f blue:240/255.f alpha:1.0];
    
    //_zrTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    //_zrTableView.backgroundColor = [UIColor whiteColor];
    _zrTableView.delegate = self;
    _zrTableView.dataSource = self;
    [self.view addSubview:_zrTableView];
    
    
    // register cell class, use UITableView+MCRegisterCellClass
    [_zrTableView registerCellClasses:@[[ZRCustomCell1 class], [ZRCustomCell2 class]]];//注册自定义cell的类型
    
}


//////////////////////////////////数据驱动 ui
- (void)getCustomCellData {
    
    ZRCustomCellData *cellData = [[ZRCustomCellData alloc] init];
    cellData.cellClass = [ZRCustomCell1 class];
    cellData.iconNameStr = @"11.png";
    cellData.contentStr = @"时钟";
    
    ZRCustomCellData *cellData11 = [[ZRCustomCellData alloc] init];
    cellData11.cellClass = [ZRCustomCell1 class];
    cellData11.iconNameStr = @"15.jpg";
    cellData11.contentStr = @"头像";
    
    ZRCustomCellData *cellData22 = [[ZRCustomCellData alloc] init];
    cellData22.cellClass = [ZRCustomCell1 class];
    cellData22.iconNameStr = @"9.png";
    cellData22.contentStr = @"天气";
    
    
    ZRCustomCellData *cellData33 = [[ZRCustomCellData alloc] init];
    cellData33.cellClass = [ZRCustomCell2 class];
    cellData33.switchStatus = YES;
    cellData33.cell2Delegate = self;

    
    
    //_cellDatas = @[@[cellData], @[cellData11], @[cellData22]];//通过调整 array 的个数／顺序。。。来调整cell的位置／样式。
    
    _cellDatas = @[@[cellData, cellData11, cellData33], @[cellData11], @[cellData22]];
    
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _cellDatas.count;//方便获取，无需 if else 语句
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cellDatas[section].count;//方便获取，无需 if else 语句
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZRCustomCellData *data = _cellDatas[indexPath.section][indexPath.row];//通过 indexPath 获取 数据源 中的 DescribeData。DescribeData 中有足够的条件能够获取到所需的信息。
    
    UITableViewCell *cell = [_zrTableView dequeueReusableCellWithClassType:data.cellClass];
    
    
    data.customCellBlock((ZRBaseTableViewCell *)cell, data);//将自定义cell的代码从controller 移动到 cell
    
    
    return cell;
}


#pragma mark - UITableViewDelegate.

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZRCustomCellData *data = _cellDatas[indexPath.section][indexPath.row];
    UITableViewCell *cell = [_zrTableView dequeueReusableCellWithClassType:data.cellClass];
    
    data.customCellBlock((ZRBaseTableViewCell *)cell, data);
    
    return [data cellHeight];//自定义的 Cell 重写 sizeThatFits: 方法中是动态计算的高度并返回
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ZRCustomCellData *data = _cellDatas[indexPath.section][indexPath.row];
    
    if (data.selectCellBlock) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        data.selectCellBlock((ZRBaseTableViewCell *)cell, data);
    }
}

//////cell2   delegate
- (void)switchStatusChanged:(UISwitch *)switchhh {

    if (switchhh.on == YES) {
        NSLog(@"switch changed");

    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
