//
//  PSPopListView.m
//  PSPopListView
//
//  Created by 思 彭 on 2017/5/11.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "PSPopListView.h"
#import "UIViewController+LewPopupViewController.h"
#import "LewPopupViewAnimationFade.h"
#import "LewPopupViewAnimationSlide.h"
#import "LewPopupViewAnimationSpring.h"
#import "LewPopupViewAnimationDrop.h"

static NSString *const identify = @"cellID";
#define showCount (6)

@interface PSPopListView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *listTableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation PSPopListView

+ (instancetype)psPopListViewWithDataArray: (NSArray *)dataArray frame: (CGRect)frame {
    
    return [[self alloc]initWithPopListViewWithDataArray:dataArray frame:frame];
}

- (instancetype)initWithPopListViewWithDataArray: (NSArray *)dataArray frame: (CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        _dataArray = dataArray;
        self.backgroundColor = [UIColor whiteColor];
        [self initialize];
        [self createSubViews];
    }
    return self;
}

#if 0
// frame创建
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
        [self createSubViews];
    }
    return self;
}

// nib创建
- (void)awakeFromNib {
    [super awakeFromNib];
    [self createSubViews];
}

#endif

#pragma mark - Initialize

- (void)initialize {
    
    self.textColor = [UIColor darkTextColor];
    self.fontSize = 15;
    self.textAliment = NSTextAlignmentCenter;
    self.dismissAnimationType = FadeAnimation;
}

#pragma mark - setupUI

- (void)createSubViews {
    
    [self addSubview:self.listTableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.textColor = self.textColor;
    cell.textLabel.textAlignment = self.textAliment;
    cell.textLabel.font = [UIFont systemFontOfSize:self.fontSize];
    return cell;
}

#pragma mark - UITableViewDelegate 

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    !self.block ? : self.block(indexPath.row, self.dataArray[indexPath.row]);
    switch (self.dismissAnimationType) {
        case 0:
        {
            [_parentVC lew_dismissPopupViewWithanimation:[LewPopupViewAnimationFade new]];
            break;
        }
        case 1:
        {
            LewPopupViewAnimationSlide *animation = [[LewPopupViewAnimationSlide alloc]init];
            animation.type = LewPopupViewAnimationSlideTypeTopBottom;
            [_parentVC lew_dismissPopupViewWithanimation:animation];
            break;
        }
        case 2:
        {
            [_parentVC lew_dismissPopupViewWithanimation:[LewPopupViewAnimationSpring new]];
            break;
        }
        case 3:
        {
            [_parentVC lew_dismissPopupViewWithanimation:[LewPopupViewAnimationDrop new]];
            break;
        }
        default:
            
            [_parentVC lew_dismissPopupView];
            break;
    }
}

#pragma mark - 懒加载

- (UITableView *)listTableView {
    
    if (!_listTableView) {
        _listTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, showCount * 44) style:UITableViewStylePlain];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.backgroundColor = [UIColor whiteColor];
        _listTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _listTableView.tableFooterView = [UIView new];
        _listTableView.tableHeaderView = [UIView new];
        // 注册cell
        [_listTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identify];
    }
    return _listTableView;
}

#pragma mark - Setter

- (void)setTextColor:(UIColor *)textColor {
    
    _textColor = textColor;
}

- (void)setFontSize:(NSInteger)fontSize {
    
    _fontSize = fontSize;
}

- (void)setTextAliment:(NSTextAlignment)textAliment {
    
    _textAliment = textAliment;
}

- (void)setDismissAnimationType:(DismissAnimationType)dismissAnimationType {
    
    _dismissAnimationType = dismissAnimationType;
    
}

@end
