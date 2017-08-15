//
//  FollowViewController.m
//  OneForAll2017
//
//  Created by dany on 2017/8/4.
//  Copyright © 2017年 Joseph. All rights reserved.
//
/**
 * 功能列表
 * 就来实现两种展开收起的方法
 * 1 - 使用TableViewheader - 支持两级（使用起来也比较方便）
 * 2 - 利用UITableView 的这个方法  [tableView insertRowsAtIndexPaths:temp withRowAnimation:UITableViewRowAnimationFade]; - 支持多级目录展开收起
 * ps:两种都是模型驱动，根据自己的需要

 */
#import "FollowViewController.h"
#import "TreeViewController.h"
#import "TreeViewController2.h"
#import "Tree.h"
@interface FollowViewController ()<UITableViewDelegate,UITableViewDataSource>

/** tableView */
@property (nonatomic,strong) UITableView*                         tableView;

/** dataSource */
@property (nonatomic,strong) NSMutableArray*                      funcArray; // 整体数据源

/** copy */
@property (nonatomic,strong) NSMutableArray*                      dataArray; // 当前需要展示的数据源



@end

@implementation FollowViewController
#pragma mark - lazyLoad
- (NSMutableArray *)funcArray {
    if (!_funcArray) {
        _funcArray = [NSMutableArray array];
    }
    return _funcArray;
}
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view makeToast:@"haha!perfect!"];
    [self loadData];
    [self initTableView];
}


- (void)loadData {
    [self.funcArray addObjectsFromArray:@[@"TreeTableView",@"TreeTableView"]];
        [self.tableView reloadData];
    
    
}
- (void)initTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.automaticallyAdjustsScrollViewInsets = NO; // add by wz - 2017年08月14日10:07:53 - 解决下拉后 tableView 头部空出一段的问题
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.and.right.equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(20);
    }];
}



#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.funcArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
   ;
    cell.textLabel.text = [NSString stringWithFormat:@" %@ %zd", self.funcArray[indexPath.row],indexPath.row+1];
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50.f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        TreeViewController * treeVC = [[TreeViewController alloc] init];
        [self.navigationController pushViewController:treeVC animated:YES];
    }else{
        NSLog(@"===");
        
        TreeViewController2 *treeVC2 = [[TreeViewController2 alloc] init];
        [self.navigationController pushViewController:treeVC2 animated:YES];
    }
}
/**
 * 计算需要插入的IndexPath 数组
 */
//-(NSMutableArray * )indexPathsToInsertFromTrees:(NSMutableArray *)trees {
//    
//}
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
