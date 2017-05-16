//
//  PSPopListView.h
//  PSPopListView
//
//  Created by 思 彭 on 2017/5/11.
//  Copyright © 2017年 思 彭. All rights reserved.

// 参考链接: https://github.com/pljhonglu/LewPopupViewController

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DismissAnimationType) {
    FadeAnimation = 0, // 逐渐消失
    SlideAnimation, // 直线消失
    SpringAnimation, // 弹性消失
    DropAnimation // 落下消失
};

/**
 选中项的回调
 @param index 选中项的index
 @param titleName 选中项的内容
 */
typedef void(^SelectListItemBlock)(NSInteger index, NSString *titleName);

@interface PSPopListView : UIView

/**
 self所在的控制器
 */
@property (nonatomic, weak) UIViewController *parentVC;

/**
 dismiss动画类型
 */
@property (nonatomic, assign) DismissAnimationType dismissAnimationType;

/**
 选中Block回调
 */
@property (nonatomic, copy) SelectListItemBlock block;

/**
 文字颜色
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 文字大小
 */
@property (nonatomic, assign) NSInteger fontSize;

/**
 文字对齐方式
 */
@property (nonatomic, assign) NSTextAlignment textAliment;

// 类方法创建
+ (instancetype)psPopListViewWithDataArray: (NSArray *)dataArray frame: (CGRect)frame;

/**
 实例方法创建

 @param dataArray 数据源数组
 @param frame 展示view的frame,只需要给定width和height即可
 @return popListView
 */
- (instancetype)initWithPopListViewWithDataArray: (NSArray *)dataArray frame: (CGRect)frame;

@end
