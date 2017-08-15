//
//  MultiTree.m
//  OneForAll2017
//
//  Created by dany on 2017/8/14.
//  Copyright © 2017年 Joseph. All rights reserved.
//

#import "MultiTree.h"

@implementation MultiTree
- (instancetype)init{
    self = [super init];
    if (self) {
        // 这个方法可以递归解析
        [MultiTree mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"detailArray":[MultiTree class]
                     };
        }];
    }
    return self;
}
@end
