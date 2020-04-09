# SKProcessView
简单的进程视图


<img src="./img/SKProcessView2.png" style="zoom:100%; width=300;"  alt="SKProcessView"></img>

## SKProcessView使用方法


```
SKProcessView *processView = [[SKProcessView alloc] initWithFrame:CGRectMake(0, 100, nScreenWidth, 32)];
processView.backgroundColor = SKRGB(249, 249, 249);
[self.view addSubview:processView];
//传入标题文字数组
processView.titleArray = @[@"进程一", @"进程二",@"进程三", @"进程四"];
//从0个进程开始
processView.selectIndex = 0; 

```
