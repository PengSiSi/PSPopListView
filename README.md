# PSPopListView
弹出列表视图选择 - A Awesome PopUp View

---

![image](https://github.com/PengSiSi/PSPopListView/blob/master/popListView.gif)

---

```objc
- (void)didClick: (NSIndexPath *)indexPath {
    
    // 创建
    PSPopListView *popListView = [PSPopListView psPopListViewWithDataArray:@[@"思思1", @"思思2", @"思思3", @"思思4", @"思思5",@"思思6",@"思思7", @"思思8"] frame:CGRectMake(0, 0, 230, 250)];
    // 文字颜色
    popListView.textColor = [UIColor redColor];
    popListView.parentVC = self;
    // dismiss动画
    popListView.dismissAnimationType = FadeAnimation;
    
    switch (indexPath.row) {
        case 0: {
        [self lew_presentPopupView:popListView animation:[LewPopupViewAnimationFade new] dismissed:^{
                NSLog(@"动画结束");
            }];
            break;
        }
        case 1: {
            LewPopupViewAnimationSlide *animation = [[LewPopupViewAnimationSlide alloc]init];
            // 此动画样式可以设置位置type
            animation.type = LewPopupViewAnimationSlideTypeBottomBottom;
            [self lew_presentPopupView:popListView animation:animation dismissed:^{
                NSLog(@"动画结束");
            }];
            break;
        }
        case 2: {
            [self lew_presentPopupView:popListView animation:[LewPopupViewAnimationSpring new] dismissed:^{
                NSLog(@"动画结束");
            }];
            break;
        }
        case 3: {
            [self lew_presentPopupView:popListView animation:[LewPopupViewAnimationDrop new] dismissed:^{
                NSLog(@"动画结束");
            }];
            break;
        }
        default:
            break;
    }
    popListView.block = ^(NSInteger index, NSString *titleName) {
        NSLog(@"选中第%ld行: %@", index, titleName);
    };
}
```

---

## 期待
* 如果在使用过程中遇到BUG，希望你能Issues我，谢谢（或者尝试下载最新的代码看看BUG修复没有）
* 如果在使用过程中发现功能不够用，希望你能Issues我，我非常想为这个框架增加更多好用的功能，谢谢


