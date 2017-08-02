//
//  ViewController.m
//  OneForAll2017
//
//  Created by 王震 on 2017/7/27.
//  Copyright © 2017年 Joseph. All rights reserved.
//

#import "ViewController.h"
#import "TreeViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tree,like it ?";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[[TreeViewController alloc] init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
