//
//  SKProcessView.h
//  SKProcessViewDemo
//
//  Created by mac on 2019/8/9.
//  Copyright © 2019 KentSun. All rights reserved.
//

// 单个进程view
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface SKProcessView : UIView

@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, copy) NSArray *titleArray;

@end

NS_ASSUME_NONNULL_END
