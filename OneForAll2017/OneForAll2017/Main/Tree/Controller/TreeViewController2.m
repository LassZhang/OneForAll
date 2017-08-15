//
//  TreeViewController2.m
//  OneForAll2017
//
//  Created by dany on 2017/8/14.
//  Copyright © 2017年 Joseph. All rights reserved.
//

#import "TreeViewController2.h"
#import "MultiTree.h"
#import "TreeTableViewCell.h"
static NSString * treeCellID = @"TreeCellID";

@interface TreeViewController2 ()<UITableViewDelegate,UITableViewDataSource>

/** tableView */
@property (nonatomic,strong) UITableView*                         tableView;

/** dataSource - 总数据 */
@property (nonatomic,strong) NSMutableArray*                      dataArray;

/** resultArray - 展示的*/
@property (nonatomic,copy) NSMutableArray*                        resultArray;

@end

@implementation TreeViewController2

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (NSMutableArray *)resultArray {
    if (!_resultArray) {
        _resultArray = [NSMutableArray array];
    }
    return _resultArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    [self loadData];
    // Do any additional setup after loading the view.
}
- (void)initTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width , SCREEN_Height) style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerNib:[UINib nibWithNibName:@"TreeTableViewCell" bundle:nil] forCellReuseIdentifier:treeCellID];
    tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
}
- (void)loadData {
    NSDictionary * dic = @{@"data":@[
  @{
                                         @"title" : @"走进中国",
                                         @"openUrl":@"===",
                                         @"level":@"0",
                                         @"isOpen":@"0",
                                         @"detailArray":@[@{ @"title" : @"走进河南",
                                                             @"openUrl":@"==---",
                                                             @"level":@"1",
                                                             @"isOpen":@"0",
                                                             @"detailArray":@[@{ @"title" : @"走进三门峡",
                                                                                 @"openUrl":@"==---",
                                                                                 @"level":@"2",
                                                                                 @"isOpen":@"0",
                                                                                 @"detailArray":@[]
                                                                                 }]
                                                             },
                                                          @{ @"title" : @"走进陕西",
                                                                  @"openUrl":@"==---",
                                                                  @"level":@"1",
                                                                  @"isOpen":@"0",
                                                             @"detailArray":@[@{ @"title" : @"走进延安",
                                                                                 @"openUrl":@"==---",
                                                                                 @"level":@"2",
                                                                                 @"isOpen":@"0",
                                                                                 @"detailArray":@[]
                                                                                 }]
                                                            }
                                                           ]
},
@{
                                         @"title" : @"走进美国",
                                         @"openUrl":@"===",
                                         @"level":@"0",
                                         @"isOpen":@"0",
                                         @"detailArray":@[@{ @"title" : @"走进华盛顿",
                                                             @"openUrl":@"==---",
                                                             @"level":@"1",
                                                             @"isOpen":@"0",
                                                             @"detailArray":@[@{ @"title" : @"走进西雅图",
                                                                                 @"openUrl":@"==---",
                                                                                 @"level":@"2",
                                                                                 @"isOpen":@"0",
                                                                                 @"detailArray":@[]
                                                                                 }]
                                                             },
                                                          @{ @"title" : @"走进加州",
                                                             @"openUrl":@"==---",
                                                             @"level":@"1",
                                                             @"isOpen":@"0",
                                                             @"detailArray":@[@{ @"title" : @"走进洛杉矶",
                                                                                 @"openUrl":@"==---",
                                                                                 @"level":@"2",
                                                                                 @"isOpen":@"0",
                                                                                 @"detailArray":@[]
                                                                                 }]
                                                             }
                                                          ]
},
 @{
                                         @"title" : @"走进美国",
                                         @"openUrl":@"===",
                                         @"level":@"0",
                                         @"isOpen":@"0",
                                         @"detailArray":@[@{ @"title" : @"走进华盛顿",
                                                             @"openUrl":@"==---",
                                                             @"level":@"1",
                                                             @"isOpen":@"0",
                                                             @"detailArray":@[@{ @"title" : @"走进西雅图",
                                                                                 @"openUrl":@"==---",
                                                                                 @"level":@"2",
                                                                                 @"isOpen":@"0",
                                                                                 @"detailArray":@[]
                                                                                 }]
                                                             },
                                                          @{ @"title" : @"走进加州",
                                                             @"openUrl":@"==---",
                                                             @"level":@"1",
                                                             @"isOpen":@"0",
                                                             @"detailArray":@[@{ @"title" : @"走进洛杉矶",
                                                                                 @"openUrl":@"==---",
                                                                                 @"level":@"2",
                                                                                 @"isOpen":@"0",
                                                                                 @"detailArray":@[]
                                                                                 }]
                                                             }
                                                          ]
},
@{
                                         @"title" : @"走进美国",
                                         @"openUrl":@"===",
                                         @"level":@"0",
                                         @"isOpen":@"0",
                                         @"detailArray":@[@{ @"title" : @"走进华盛顿",
                                                             @"openUrl":@"==---",
                                                             @"level":@"1",
                                                             @"isOpen":@"0",
                                                             @"detailArray":@[@{ @"title" : @"走进西雅图",
                                                                                 @"openUrl":@"==---",
                                                                                 @"level":@"2",
                                                                                 @"isOpen":@"0",
                                                                                 @"detailArray":@[]
                                                                                 }]
                                                             },
                                                          @{ @"title" : @"走进加州",
                                                             @"openUrl":@"==---",
                                                             @"level":@"1",
                                                             @"isOpen":@"0",
                                                             @"detailArray":@[@{ @"title" : @"走进洛杉矶",
                                                                                 @"openUrl":@"==---",
                                                                                 @"level":@"2",
                                                                                 @"isOpen":@"0",
                                                                                 @"detailArray":@[]
                                                                                 }]
                                                             }
                                                          ]
},
@{
                                         @"title" : @"走进美国",
                                         @"openUrl":@"===",
                                         @"level":@"0",
                                         @"isOpen":@"0",
                                         @"detailArray":@[@{ @"title" : @"走进华盛顿",
                                                             @"openUrl":@"==---",
                                                             @"level":@"1",
                                                             @"isOpen":@"0",
                                                             @"detailArray":@[@{ @"title" : @"走进西雅图",
                                                                                 @"openUrl":@"==---",
                                                                                 @"level":@"2",
                                                                                 @"isOpen":@"0",
                                                                                 @"detailArray":@[]
                                                                                 }]
                                                             },
                                                          @{ @"title" : @"走进加州",
                                                             @"openUrl":@"==---",
                                                             @"level":@"1",
                                                             @"isOpen":@"0",
                                                             @"detailArray":@[@{ @"title" : @"走进洛杉矶",
                                                                                 @"openUrl":@"==---",
                                                                                 @"level":@"2",
                                                                                 @"isOpen":@"0",
                                                                                 @"detailArray":@[]
                                                                                 }]
                                                             }
                                                          ]
},
@{
                                         @"title" : @"走进美国",
                                         @"openUrl":@"===",
                                         @"level":@"0",
                                         @"isOpen":@"0",
                                         @"detailArray":@[@{ @"title" : @"走进华盛顿",
                                                             @"openUrl":@"==---",
                                                             @"level":@"1",
                                                             @"isOpen":@"0",
                                                             @"detailArray":@[@{ @"title" : @"走进西雅图",
                                                                                 @"openUrl":@"==---",
                                                                                 @"level":@"2",
                                                                                 @"isOpen":@"0",
                                                                                 @"detailArray":@[]
                                                                                 }]
                                                             },
                                                          @{ @"title" : @"走进加州",
                                                             @"openUrl":@"==---",
                                                             @"level":@"1",
                                                             @"isOpen":@"0",
                                                             @"detailArray":@[@{ @"title" : @"走进洛杉矶",
                                                                                 @"openUrl":@"==---",
                                                                                 @"level":@"2",
                                                                                 @"isOpen":@"0",
                                                                                 @"detailArray":@[]
                                                                                 }]
                                                             }
                                                          ]
},
  @{
      @"title" : @"走进美国",
      @"openUrl":@"===",
      @"level":@"0",
      @"isOpen":@"0",
      @"detailArray":@[@{ @"title" : @"走进华盛顿",
                          @"openUrl":@"==---",
                          @"level":@"1",
                          @"isOpen":@"0",
                          @"detailArray":@[@{ @"title" : @"走进西雅图",
                                              @"openUrl":@"==---",
                                              @"level":@"2",
                                              @"isOpen":@"0",
                                              @"detailArray":@[]
                                              }]
                          },
                       @{ @"title" : @"走进加州",
                          @"openUrl":@"==---",
                          @"level":@"1",
                          @"isOpen":@"0",
                          @"detailArray":@[@{ @"title" : @"走进洛杉矶",
                                              @"openUrl":@"==---",
                                              @"level":@"2",
                                              @"isOpen":@"0",
                                              @"detailArray":@[]
                                              }]
                          }
                       ]
      },
  @{
      @"title" : @"走进美国",
      @"openUrl":@"===",
      @"level":@"0",
      @"isOpen":@"0",
      @"detailArray":@[@{ @"title" : @"走进华盛顿",
                          @"openUrl":@"==---",
                          @"level":@"1",
                          @"isOpen":@"0",
                          @"detailArray":@[@{ @"title" : @"走进西雅图",
                                              @"openUrl":@"==---",
                                              @"level":@"2",
                                              @"isOpen":@"0",
                                              @"detailArray":@[]
                                              }]
                          },
                       @{ @"title" : @"走进加州",
                          @"openUrl":@"==---",
                          @"level":@"1",
                          @"isOpen":@"0",
                          @"detailArray":@[@{ @"title" : @"走进洛杉矶",
                                              @"openUrl":@"==---",
                                              @"level":@"2",
                                              @"isOpen":@"0",
                                              @"detailArray":@[]
                                              }]
                          }
                       ]
      },@{
      @"title" : @"走进美国",
      @"openUrl":@"===",
      @"level":@"0",
      @"isOpen":@"0",
      @"detailArray":@[@{ @"title" : @"走进华盛顿",
                          @"openUrl":@"==---",
                          @"level":@"1",
                          @"isOpen":@"0",
                          @"detailArray":@[@{ @"title" : @"走进西雅图",
                                              @"openUrl":@"==---",
                                              @"level":@"2",
                                              @"isOpen":@"0",
                                              @"detailArray":@[]
                                              }]
                          },
                       @{ @"title" : @"走进加州",
                          @"openUrl":@"==---",
                          @"level":@"1",
                          @"isOpen":@"0",
                          @"detailArray":@[@{ @"title" : @"走进洛杉矶",
                                              @"openUrl":@"==---",
                                              @"level":@"2",
                                              @"isOpen":@"0",
                                              @"detailArray":@[]
                                              }]
                          }
                       ]
      },@{
      @"title" : @"走进美国",
      @"openUrl":@"===",
      @"level":@"0",
      @"isOpen":@"0",
      @"detailArray":@[@{ @"title" : @"走进华盛顿",
                          @"openUrl":@"==---",
                          @"level":@"1",
                          @"isOpen":@"0",
                          @"detailArray":@[@{ @"title" : @"走进西雅图",
                                              @"openUrl":@"==---",
                                              @"level":@"2",
                                              @"isOpen":@"0",
                                              @"detailArray":@[]
                                              }]
                          },
                       @{ @"title" : @"走进加州",
                          @"openUrl":@"==---",
                          @"level":@"1",
                          @"isOpen":@"0",
                          @"detailArray":@[@{ @"title" : @"走进洛杉矶",
                                              @"openUrl":@"==---",
                                              @"level":@"2",
                                              @"isOpen":@"0",
                                              @"detailArray":@[]
                                              }]
                          }
                       ]
      },
  @{
      @"title" : @"走进美国",
      @"openUrl":@"===",
      @"level":@"0",
      @"isOpen":@"0",
      @"detailArray":@[@{ @"title" : @"走进华盛顿",
                          @"openUrl":@"==---",
                          @"level":@"1",
                          @"isOpen":@"0",
                          @"detailArray":@[@{ @"title" : @"走进西雅图",
                                              @"openUrl":@"==---",
                                              @"level":@"2",
                                              @"isOpen":@"0",
                                              @"detailArray":@[]
                                              }]
                          },
                       @{ @"title" : @"走进加州",
                          @"openUrl":@"==---",
                          @"level":@"1",
                          @"isOpen":@"0",
                          @"detailArray":@[@{ @"title" : @"走进洛杉矶",
                                              @"openUrl":@"==---",
                                              @"level":@"2",
                                              @"isOpen":@"0",
                                              @"detailArray":@[]
                                              }]
                          }
                       ]
      },
  @{
      @"title" : @"走进美国",
      @"openUrl":@"===",
      @"level":@"0",
      @"isOpen":@"0",
      @"detailArray":@[@{ @"title" : @"走进华盛顿",
                          @"openUrl":@"==---",
                          @"level":@"1",
                          @"isOpen":@"0",
                          @"detailArray":@[@{ @"title" : @"走进西雅图",
                                              @"openUrl":@"==---",
                                              @"level":@"2",
                                              @"isOpen":@"0",
                                              @"detailArray":@[]
                                              }]
                          },
                       @{ @"title" : @"走进加州",
                          @"openUrl":@"==---",
                          @"level":@"1",
                          @"isOpen":@"0",
                          @"detailArray":@[@{ @"title" : @"走进洛杉矶",
                                              @"openUrl":@"==---",
                                              @"level":@"2",
                                              @"isOpen":@"0",
                                              @"detailArray":@[]
                                              }]
                          }
                       ]
      }

  
                                     ]
                           };
    
    self.dataArray = [MultiTree mj_objectArrayWithKeyValuesArray:dic[@"data"]];
    NSLog(@"%@",self.dataArray);
    [self dealWithDataArray:self.dataArray];
    [self.tableView reloadData];
    
}
#pragma mark - 私有方法
// 处理数据源
- (void)dealWithDataArray:(NSMutableArray *)dataArray {
    for (MultiTree * tree in dataArray) {
        [self.resultArray addObject:tree];
        if (tree.isOpen && tree.detailArray.count > 0) { // 会将可展开的模型的子模型展示出来
            [self dealWithDataArray:tree.detailArray];
        }
    }
}
/*
 * 点击同一层的数据比较，然后删除要收起的数据和插入要展开的数据
 @param model 点击cell 对应的model
 @param row   点击的 tableView 的indexpath.row ,也对应 _resultArray 的下标
 */
- (void)compareSameLevelWithModel:(MultiTree *)model row:(NSInteger)row {
    NSInteger count = 0;
    NSInteger index = 0;// 需要收起的起始位置
    // 如果直接使用_resultArray,在for 循环完成之前，_resultArray 会发生改变，是程序崩溃。
    NSMutableArray * copyArray = [self.resultArray mutableCopy];
    for (NSInteger i = 0; i < copyArray.count; i++) {
        // openModel 为同一层级打开的模型
        MultiTree * openModel = copyArray[i];
        if (openModel.level == model.level) { // 统一层次的比较
            if (openModel.isOpen) {// 且是打开的
                // 删除 openModel 所有的下一层
               count = [self deleteObjectWithDataArray:openModel.detailArray count:count];
                index = i; // copyArray中第几个Model 是展开的
                openModel.isOpen = NO; // 将其置反
                break;
            }
            
            
        
            
        }
    }
    // 插入的位置在删除的位置后面，则需要减去删除的数量
    if (row > index && row > count) {
        row -= count;
    }
    
    [self addObjectWithDataArray:model.detailArray row:row+1];
    
    
}

/**
 在指定位置插入要展示的数据
 @param dataArray 数据数组
 @param row       需要插入的数组下标
 */
- (void)addObjectWithDataArray:(NSMutableArray *)dataArray row:(NSInteger)row {
    for (NSInteger i = 0; i < dataArray.count; i ++) {
        MultiTree * tree  = dataArray[i];
        tree.isOpen = NO;
        [self.resultArray insertObject:tree atIndex:row];
        row +=1;
    }
}


/**
   删除要收起的数据
 @param dataArray 数据
 @param count 统计删除数据的个数
 @return 删除数据的个数
 */

- (CGFloat)deleteObjectWithDataArray:(NSMutableArray *)dataArray count:(NSInteger)count {
    for (MultiTree * tree in dataArray) {
        count +=1;
        if (tree.isOpen && tree.detailArray.count > 0) {
            count = [self deleteObjectWithDataArray:tree.detailArray count:count];
        }
        tree.isOpen = NO;
        [self.resultArray removeObject:tree];
    }
    
    
    return count;
}
#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.resultArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    return 50.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:treeCellID];
    MultiTree * tree = [self.resultArray objectAtIndex:indexPath.row];
    cell.indentationLevel = tree.level;
    cell.indentationWidth = 15;
    cell.cellTitleLable.text =tree.title;
    cell.leadingConstraint.constant = cell.indentationWidth * cell.indentationLevel;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"==");
    MultiTree *tree = self.resultArray[indexPath.row];
    if (tree.isOpen) {//点击需要收起
        // 原来是展开的，现在要收起，则删除model.detailArray 存储的数据
        
        [self deleteObjectWithDataArray:tree.detailArray count:0];
    }else{// 点击需要展开
        if (tree.detailArray.count >0) {
            // 原来是收起的，现在要展开
            // 1- 需要将同层次展开的收起
            // 2- 然后再把点击的该model展开
            NSLog(@"%ld",(long)indexPath.row);
            [self compareSameLevelWithModel:tree row:indexPath.row];
            
            
            
        }else{ //最后一层
            NSLog(@"%@",tree.openUrl);
        
        }
        
    }
    tree.isOpen = !tree.isOpen;
    // 优化体验，将所展开的组滑动到顶部
    for (NSInteger i = 0; i < self.resultArray.count; i++) {
        MultiTree * openTree = self.resultArray[i];
        // 将点击的Cell所在的根目录滑动到顶部
        if (openTree.isOpen && openTree.level == 0) {
            NSIndexPath * selectIndexPath = [NSIndexPath indexPathForRow:i inSection:0];
            NSLog(@"%ld",i);
            [tableView scrollToRowAtIndexPath:selectIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        }
    }
    [self.tableView reloadData];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
