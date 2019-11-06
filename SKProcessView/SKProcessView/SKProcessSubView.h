//
//  SKProcessSubView.h
//  SKProcessView
//
//  Created by sunke on 2019/10/29.
//  Copyright © 2019 sunke. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, SKProcessType) {
    SKProcessTypeNone  = 0, //未进行
    SKProcessTypeCurrent ,  //进行中
    SKProcessTypeFinish     //完毕
};
@interface SKProcessSubView : UIView
@property (nonatomic, assign) SKProcessType type;
/// 数字
@property (nonatomic, copy) NSString *num;
/// 文字内容
@property (nonatomic, copy) NSString *text;
@end

NS_ASSUME_NONNULL_END
