//
//  ViewController.m
//  SKProcessView
//
//  Created by sunke on 2019/10/29.
//  Copyright © 2019 sunke. All rights reserved.
//

#import "ViewController.h"
#import "SKProcessView.h"

//屏幕宽高
#define nScreenWidth        [[UIScreen mainScreen] bounds].size.width
#define nScreenHeight       [[UIScreen mainScreen] bounds].size.height
// 获取RGB颜色
#define SKRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define SKRGB(r,g,b) SKRGBA(r,g,b,1.0f)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    SKProcessView *processView = [[SKProcessView alloc] initWithFrame:CGRectMake(0, 100, nScreenWidth, 32)];
    processView.backgroundColor = SKRGB(249, 249, 249);
    [self.view addSubview:processView];
    //传入标题文字数组
    processView.titleArray = @[@"进程一", @"进程二",@"进程三", @"进程四"];
    processView.selectIndex = 0; //索引从0开始
    
}


@end
