//
//  MultiTree.h
//  OneForAll2017
//
//  Created by dany on 2017/8/14.
//  Copyright © 2017年 Joseph. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MultiTree : NSObject
/** title*/
@property (nonatomic,copy) NSString*  title;
/** 决定偏移量大小 */
@property (nonatomic,assign) NSInteger  level;
/** 最后一层跳转的规则*/
@property (nonatomic,copy) NSString*  openUrl;
/** 下一层的数据*/
@property (nonatomic,copy) NSMutableArray*  detailArray;
/** 是否展开 */
@property (nonatomic,assign) BOOL  isOpen;


@end
