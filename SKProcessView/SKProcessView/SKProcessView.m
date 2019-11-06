//
//  SKProcessView.m
//  SKProcessViewDemo
//
//  Created by mac on 2019/8/9.
//  Copyright © 2019 KentSun. All rights reserved.
//

#import "SKProcessView.h"
#import "SKProcessSubView.h"
#import "Masonry.h"

@interface SKProcessView()

@property (nonatomic, strong) NSMutableArray *processViewArr; //3个活动进程view

@end

@implementation SKProcessView

- (NSMutableArray *)processViewArr{
    if (_processViewArr == nil) {
        _processViewArr = [NSMutableArray array];
    }
    return _processViewArr;
}


- (void)setTitleArray:(NSArray *)titleArray{
    _titleArray = titleArray;
    [self setupSubViews];
}

//设置选中第几个
- (void)setSelectIndex:(NSInteger)selectIndex{
    _selectIndex = selectIndex;
    [self.processViewArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == selectIndex) {
            SKProcessSubView *processViewFirst = self.processViewArr[selectIndex];
            processViewFirst.type = SKProcessTypeCurrent;
            *stop = YES;
            return ;
        }
        SKProcessSubView *processViewFirst = self.processViewArr[idx];
        processViewFirst.type = SKProcessTypeFinish;
    }];
    
}

- (void)setupSubViews{
    NSInteger num = self.titleArray.count; //步骤数量
    CGFloat processViewW = self.frame.size.width / num;
    CGFloat processViewH = self.frame.size.height;
    
    [self.titleArray enumerateObjectsUsingBlock:^(NSString *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SKProcessSubView *processView = [[SKProcessSubView alloc] initWithFrame:CGRectMake(idx * processViewW, 0, processViewW, processViewH)];
        [self addSubview:processView];
        processView.num = [NSString stringWithFormat:@"%lu", (unsigned long)(idx+1)];
        processView.text = obj;
        [self.processViewArr addObject:processView];
    }];
    
}


@end
