//
//  HeaderView.m
//  OneForAll2017
//
//  Created by dany on 2017/8/2.
//  Copyright © 2017年 Joseph. All rights reserved.
//

#import "HeaderView.h"
#import <Masonry/Masonry.h>

@interface HeaderView ()
/** label */
@property (nonatomic,strong) UILabel*                         label;
@end
@implementation HeaderView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
        [self setup];
    }
    return self;
    
}
- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init ];
        _label.backgroundColor = [UIColor cyanColor];
        _label.textColor = [UIColor blackColor];
    }
    return _label;
}
- (void)setup {
    self.backgroundColor = [UIColor whiteColor];
}
- (void)setTreeSubject:(Tree *)treeSubject {
    _treeSubject = treeSubject;
    self.label.text = treeSubject.sectionTitle;
}
- (void)initSubViews {
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTheHeaderView)];
    [self addGestureRecognizer:tap];

    
    [self addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self).offset(-15);
    }];
}
- (void)tapTheHeaderView {
    if (self.headerClick) {
        self.headerClick(self.treeSubject.isExpand, self.treeSubject);
    }
}
@end
