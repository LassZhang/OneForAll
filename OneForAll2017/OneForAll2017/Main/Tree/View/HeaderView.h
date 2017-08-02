//
//  HeaderView.h
//  OneForAll2017
//
//  Created by dany on 2017/8/2.
//  Copyright © 2017年 Joseph. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tree.h"
typedef void (^headerClickHandle)(BOOL,Tree*);
@interface HeaderView : UIView

/** subject */
@property (nonatomic,strong) Tree*                         treeSubject;

/** headerClickHandle*/
@property (nonatomic,copy) headerClickHandle  headerClick;
@end
