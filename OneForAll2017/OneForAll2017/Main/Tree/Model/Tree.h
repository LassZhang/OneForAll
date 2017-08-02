//
//  Tree.h
//  OneForAll2017
//
//  Created by dany on 2017/8/2.
//  Copyright © 2017年 Joseph. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tree : NSObject

/** catalogName*/
@property (nonatomic,copy) NSString*  sectionTitle;


/** catalogList */
@property (nonatomic,strong) NSMutableArray<NSMutableDictionary*>*                         cellTreeList;


/** isExpand */
@property (nonatomic,assign) BOOL     isExpand;
@end
