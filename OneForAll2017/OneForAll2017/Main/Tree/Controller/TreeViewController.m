//
//  TreeViewController.m
//  OneForAll2017
//
//  Created by dany on 2017/8/2.
//  Copyright © 2017年 Joseph. All rights reserved.
//

#import "TreeViewController.h"
#import "Tree.h"
#import <MJExtension/MJExtension.h>
#import "TreeTableViewCell.h"
#import <Masonry/Masonry.h>
#import "HeaderView.h"
static NSString * treeCellID = @"TreeCellID";
#define screenWidth = [UIScreen mainScreen].bounds.size.width;
#define screenHeight = [UIScreen mainScreen].bounds.size.height;

@interface TreeViewController ()<UITableViewDelegate,UITableViewDataSource>

/** tableView */
@property (nonatomic,strong) UITableView*                         tableView;

/** dataSource */
@property (nonatomic,strong) NSMutableArray*                      dataArray;
/** subjectArray */
@property (nonatomic,strong) NSMutableArray*                         subjectArray;
@end

@implementation TreeViewController

- (void)initTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerNib:[UINib nibWithNibName:@"TreeTableViewCell" bundle:nil] forCellReuseIdentifier:treeCellID];
    tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tableView];
    self.tableView = tableView;

}

- (NSMutableArray *)subjectArray {
    if (!_subjectArray) {
        _subjectArray = [NSMutableArray array];
    }
    return _subjectArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubViews];
    [self loadData];


}
- (void)loadData {
    
    NSDictionary * dic = @{@"data":@[@{
                                         @"sectionTitle" : @"走进延安",
                                         @"cellTreeList":@[@{
                                                               @"cellTitleName":@"党在延安十三年",
                                                               @"end":@"1"},
                                                           @{ @"cellTitleName":@"延安精神",
                                                              @"end":@"1"},
                                                           @{ @"cellTitleName":@"第三方眼中的延安",
                                                              @"end":@"1"},
                                                           @{ @"cellTitleName":@"我爱延安",
                                                              @"end":@"1"}
                                                           ]
                                         },
                                     @{
                                         @"sectionTitle" : @"走进大别山",
                                         @"cellTreeList":@[@{
                                                               @"cellTitleName":@"党在大别山十三年",
                                                               @"end":@"1"},
                                                           @{ @"cellTitleName":@"大别山精神",
                                                              @"end":@"1"},
                                                           @{ @"cellTitleName":@"第三方眼中的大别山",
                                                              @"end":@"1"},
                                                           @{ @"cellTitleName":@"我爱延安",
                                                              @"end":@"1"}
                                                           ]
                                         },
                                     @{
                                         @"sectionTitle" : @"走进三门峡",
                                         @"cellTreeList":@[@{
                                                               @"cellTitleName":@"党在三门峡十三年",
                                                               @"end":@"1"},
                                                           @{ @"cellTitleName":@"三门峡精神",
                                                              @"end":@"1"},
                                                           @{ @"cellTitleName":@"第三方眼中的三门峡",
                                                              @"end":@"1"},
                                                           @{ @"cellTitleName":@"我爱三门峡",
                                                              @"end":@"1"}
                                                           ]
                                         },
                                     @{
                                         @"sectionTitle" : @"走进北京",
                                         @"cellTreeList":@[@{
                                                               @"cellTitleName":@"党在北京十三年",
                                                               @"end":@"1"},
                                                           @{ @"cellTitleName":@"北京精神",
                                                              @"end":@"1"},
                                                           @{ @"cellTitleName":@"第三方眼中的北京",
                                                              @"end":@"1"},
                                                           @{ @"cellTitleName":@"我爱北京",
                                                              @"end":@"1"}
                                                           ]
                                         }]};
    self.subjectArray = [Tree mj_objectArrayWithKeyValuesArray:dic[@"data"]];
    NSLog(@"%@",self.subjectArray);
    [self.tableView reloadData];
 
    
}
- (void)initSubViews {
    [self initTableView];
    [self.view addSubview:self.tableView];
}
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.subjectArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    Tree * subject = self.subjectArray[section];
    return subject.isExpand ? subject.cellTreeList.count :0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:treeCellID];
    Tree * subject = self.subjectArray[ indexPath.section];
    NSDictionary * dic  = subject.cellTreeList[indexPath.row];
    cell.cellTitleLable.text =dic[@"cellTitleName"];
    return cell;
}
#pragma mark - UITableViewDelegate
-  (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HeaderView * headerView = [[ HeaderView alloc] initWithFrame:CGRectMake(0, 0, 350, 100)];
    headerView.treeSubject = self.subjectArray[section];
    __weak  typeof(self) weakself = self;
    headerView.headerClick = ^(BOOL isExpand,Tree * subject){
        {
            subject.isExpand = !isExpand;
            [weakself.subjectArray replaceObjectAtIndex:section withObject:subject];
                       [tableView reloadSections:[[NSIndexSet alloc] initWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
//            [tableView reloadData];
        }
    };
    
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 100.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}
@end
