//
//  ScrollBezierCurveView.h
//  The_Month_Club
//
//  Created by BaoBaoDaRen on 16/11/9.
//  Copyright © 2016年 康振超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "customBezierView.h"
@interface ScrollBezierCurveView : UIView<UIScrollViewDelegate>

@property (nonatomic, strong) NSArray * verticalLineArray;

@property (nonatomic, strong) NSArray * horizonLineArray;

/**
 *  体重label
 */
@property (nonatomic, strong) UILabel * B_WeightLab;

/**
 *  体重kg...
 */
@property (nonatomic, strong) UILabel * B_WNumLab;

/**
 *  体重时间分割线view
 */
@property (nonatomic, strong) UIView * B_BreakView;

/**
 *  时间label...
 */
@property (nonatomic, strong) UILabel * B_TimeLabel;

/**
 *  周/月button...
 */
@property (nonatomic, strong) UIButton * B_TimeTypeBtn;

/**
 *  月label...
 */
@property (nonatomic, strong) UILabel * B_MonthLab;

/**
 *  周label...
 */
@property (nonatomic, strong) UILabel * B_WeekLab;

/**
 *  遮罩
 */
@property (nonatomic, strong) UIView * shadeLabelView;

// 曲线
@property (nonatomic, strong) CALayer * bezierLayer;

// 贝塞尔曲线图...
@property (nonatomic, strong) customBezierView * bezierView;

@property (nonatomic, strong) UIScrollView * bezierScrollView;

@property (nonatomic, strong) NSArray * bezierDataArray;

@property (nonatomic, strong) NSArray * bezierDataTimeArray;

// x轴分成多少个分区
@property (nonatomic, assign) NSInteger bezierNumber;

// 所有的数组...
@property (nonatomic, strong) NSMutableArray * sortedDataArray;

// 健康数据最大值
@property (nonatomic, assign) CGFloat HD_MaxValue;

// 健康数据最小值...
@property (nonatomic, assign) CGFloat HD_MinimumValue;

///**
// *  数据标示
// */
//@property (nonatomic, strong) NSMutableArray * typeTimeArray;

/**
 *  类型标示
 */
@property (nonatomic, strong) NSString * beizierTypeString;

- (UIColor *)colorWithHexString:(NSString *)stringToConvert;


- (void)setBezierViewSubViewsWithArray:(NSArray *)valueArray timeArray:(NSArray *)timeArray BezierType:(NSString *)beizierType;

@end





