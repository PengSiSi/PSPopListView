//
//  ViewController.m
//  PSPopListView
//
//  Created by 思 彭 on 2017/5/11.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "ViewController.h"
#import "LewPopupViewController.h"
#import "PSPopListView.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = @[@"PopUpView fade", @"PopUpView slide", @"PopUpView spring", @"PopUpView drop"];
    [self setupUI];
}

#pragma mark - 设置界面

- (void)setupUI {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width , self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = [[UIView alloc]init];
    // 注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview: self.tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.array[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self didClick:indexPath];
}

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

@end
