//
//  SKProcessSubView.m
//  SKProcessView
//
//  Created by sunke on 2019/10/29.
//  Copyright © 2019 sunke. All rights reserved.
//

#import "SKProcessSubView.h"
#import "Masonry.h"

@interface SKProcessSubView()

@property (nonatomic ,weak) UIImageView *rightImageV;
@property (nonatomic ,weak) UIView *currentView;
@property (nonatomic ,weak) UILabel *numLabel;
@property (nonatomic ,weak) UILabel *textLabel;

@end

@implementation SKProcessSubView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    //背景色 , 默认没有
    self.backgroundColor = [UIColor clearColor];
    
    //1.选中状态 右边箭头image, 默认不显示
    UIImageView *rightImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"public_step_pic"]];
    [self addSubview:rightImageV];
    self.rightImageV = rightImageV;
    [rightImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(16);
    }];
    rightImageV.hidden = YES;
    
    //2.选中状态 ,背景View , 默认不显示
    UIView *currentView = [[UIView alloc] init];
    [self addSubview:currentView];
    self.currentView = currentView;
    currentView.backgroundColor = [UIColor colorWithRed:76/255.0 green:217/255.0 blue:100/255.0 alpha:1.0];
    [currentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.right.equalTo(rightImageV.mas_left);
    }];
    currentView.hidden = YES;
    
    //3.centerView
    UIView *centerView = [[UIView alloc] init];
    //    centerView.backgroundColor = [UIColor redColor];
    [self addSubview:centerView];
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self); //设置父视图居中
    }];
    
    //4.数字
    UILabel *numLabel = [[UILabel alloc] init];
    [centerView addSubview:numLabel];
    self.numLabel = numLabel;
    numLabel.backgroundColor = [UIColor whiteColor];
    numLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    numLabel.textColor = [UIColor colorWithRed:76/255.0 green:217/255.0 blue:100/255.0 alpha:1.0];//默认绿色
    numLabel.layer.cornerRadius = 8;
    numLabel.layer.masksToBounds = YES;
    numLabel.textAlignment = NSTextAlignmentCenter;
    [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.mas_equalTo(0);
        make.width.height.mas_equalTo(16);
    }];
    
    //5.文字
    UILabel *textLabel = [[UILabel alloc] init];
    [centerView addSubview:textLabel];
    self.textLabel = textLabel;
    textLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.textColor = [UIColor colorWithRed:136/255.0 green:136/255.0 blue:136/255.0 alpha:1.0];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_equalTo(0);
        make.left.equalTo(numLabel.mas_right).offset(4);
    }];
}

- (void)setNum:(NSString *)num{
    _num = num;
    self.numLabel.text = num;
}


- (void)setText:(NSString *)text{
    _text = text;
    self.textLabel.text = text;
}


- (void)setType:(SKProcessType)type{
    _type = type;
    if (type == SKProcessTypeNone) {
        self.backgroundColor = [UIColor clearColor];
        self.rightImageV.hidden = YES;
        self.currentView.hidden = YES;
        self.numLabel.backgroundColor = [UIColor whiteColor];
        self.numLabel.textColor = [UIColor colorWithRed:76/255.0 green:217/255.0 blue:100/255.0 alpha:1.0]; //绿色
        self.textLabel.textColor = [UIColor colorWithRed:136/255.0 green:136/255.0 blue:136/255.0 alpha:1.0]; //color888888
    }else if (type == SKProcessTypeCurrent){
        self.backgroundColor = [UIColor clearColor];
        self.rightImageV.hidden = NO;
        self.currentView.hidden = NO;
        
        self.numLabel.backgroundColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0]; //color222222
        self.numLabel.textColor = [UIColor colorWithRed:76/255.0 green:217/255.0 blue:100/255.0 alpha:1.0]; //绿色;
        self.textLabel.textColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0]; //color222222
    }else{ // SKProcessTypeFinish
        self.backgroundColor = [UIColor colorWithRed:76/255.0 green:217/255.0 blue:100/255.0 alpha:1.0]; //绿色;;
        self.rightImageV.hidden = YES;
        self.currentView.hidden = YES;
        
        self.numLabel.backgroundColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0]; //color222222
        self.numLabel.textColor = [UIColor colorWithRed:76/255.0 green:217/255.0 blue:100/255.0 alpha:1.0]; //绿色;
        self.textLabel.textColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0]; //color222222
    }
    
}



@end
