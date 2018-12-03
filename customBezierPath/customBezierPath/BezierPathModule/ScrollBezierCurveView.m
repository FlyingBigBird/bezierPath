//
//  ScrollBezierCurveView.m
//  The_Month_Club
//
//  Created by BaoBaoDaRen on 16/11/9.
//  Copyright © 2016年 康振超. All rights reserved.
//

#import "ScrollBezierCurveView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@implementation ScrollBezierCurveView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        NSLog(@"width:%f---height:%f",frame.size.width,frame.size.height);
      
        _bezierNumber = 7;// 屏幕几等分...
        
        self.bezierScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 45, SCREEN_WIDTH, 130)];
        [self addSubview:self.bezierScrollView];
        
        self.bezierView = [[customBezierView alloc] init];
        [self.bezierScrollView addSubview:self.bezierView];

        
        UIView * topHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
        topHeaderView.backgroundColor = [self colorWithHexString:@"#eeeeee"];
        [self addSubview:topHeaderView];
        self.B_WeightLab = [[UILabel alloc] init];
        [topHeaderView addSubview:self.B_WeightLab];
        self.B_WNumLab = [[UILabel alloc] init];
        [topHeaderView addSubview:self.B_WNumLab];
        self.B_BreakView = [[UIView alloc] init];
        [topHeaderView addSubview:self.B_BreakView];
        self.B_BreakView.backgroundColor = [self colorWithHexString:@"#d5d5d5"];
        self.B_TimeLabel = [[UILabel alloc] init];
        [topHeaderView addSubview:self.B_TimeLabel];
        
        self.shadeLabelView = [[UIView alloc] init];
        [topHeaderView addSubview:self.shadeLabelView];
        self.shadeLabelView.backgroundColor = [UIColor clearColor];
        
        // 月/周...
        self.shadeLabelView.frame = CGRectMake(SCREEN_WIDTH - 10 - 60, 0, 60 + 10, 45);

        self.B_TimeTypeBtn = [[UIButton alloc] init];
        self.B_TimeTypeBtn.backgroundColor = [UIColor lightGrayColor];
        self.B_TimeTypeBtn.frame = CGRectMake(0, 7.5, 60, 30);
        [self.shadeLabelView addSubview:self.B_TimeTypeBtn];

        self.B_WeekLab = [[UILabel alloc] initWithFrame:CGRectMake(1, 1, 28, 28)];
        self.B_WeekLab.backgroundColor = [UIColor lightGrayColor];
        
        [self resetLabel:self.B_WeekLab TextAlignment:NSTextAlignmentCenter andFont:[UIFont systemFontOfSize:14] andTextColor:[UIColor whiteColor] andText:@"周"];

        [self.B_TimeTypeBtn addSubview:self.B_WeekLab];
        
        self.B_MonthLab = [[UILabel alloc] initWithFrame:CGRectMake(31, 1, 28, 28)];
        self.B_MonthLab.backgroundColor = [UIColor whiteColor];

        [self resetLabel:self.B_MonthLab TextAlignment:NSTextAlignmentCenter andFont:[UIFont systemFontOfSize:14] andTextColor:[UIColor lightGrayColor] andText:@"月"];

        [self.B_TimeTypeBtn addSubview:self.B_MonthLab];
        
        CGFloat labToTopBottomWidth = 12.5;
        CGFloat labHeight = 20;
        CGFloat weightLabToLeftMargin = 15;
        
        self.B_WeightLab.frame = CGRectMake(weightLabToLeftMargin, labToTopBottomWidth, 60, labHeight);
        self.B_WNumLab.frame = CGRectMake(15 + 60, labToTopBottomWidth, SCREEN_WIDTH / 2 - 15 - 60 - 10, labHeight);
        self.B_BreakView.frame = CGRectMake(SCREEN_WIDTH / 2 - 0.5, labToTopBottomWidth, 1, labHeight);
        self.B_TimeLabel.frame = CGRectMake(SCREEN_WIDTH / 2 + 10, labToTopBottomWidth, SCREEN_WIDTH / 2 - 10 - 15 - 40, labHeight);
        
        [self BabyTimeTypeBtnDidClicked];
    }
    return self;
}

- (NSArray *)bezierDataArray
{
    if (!_bezierDataArray) {
        
        _bezierDataArray = [NSArray array];
    }
    return _bezierDataArray;
}
- (NSArray *)bezierDataTimeArray
{
    if (!_bezierDataTimeArray) {
        
        _bezierDataTimeArray = [NSArray array];
    }
    return _bezierDataTimeArray;
}

- (void)BabyTimeTypeBtnDidClicked
{
    _bezierNumber = 7;
    
    self.B_WeekLab.backgroundColor = [UIColor lightGrayColor];
    [self resetLabel:self.B_WeekLab TextAlignment:NSTextAlignmentCenter andFont:[UIFont systemFontOfSize:14] andTextColor:[UIColor whiteColor] andText:@"周"];
    
    self.B_MonthLab.backgroundColor = [UIColor whiteColor];
    [self resetLabel:self.B_MonthLab TextAlignment:NSTextAlignmentCenter andFont:[UIFont systemFontOfSize:14] andTextColor:[UIColor lightGrayColor] andText:@"月"];
    
    
    [self.bezierView removeFromSuperview];
    [self.bezierScrollView removeFromSuperview];
    
    self.bezierScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 45, SCREEN_WIDTH, 130)];
    [self addSubview:self.bezierScrollView];
    self.bezierView = [[customBezierView alloc] init];
    [self.bezierScrollView addSubview:self.bezierView];
    
    [self setBezierScrollViewWithArray:_bezierDataArray];
}



- (void)setBezierViewSubViewsWithArray:(NSArray *)valueArray timeArray:(NSArray *)timeArray BezierType:(NSString *)beizierType
{
    if (self.bezierView) {
        
        [self.bezierView removeFromSuperview];
    }
    if (self.bezierScrollView) {
        
        [self.bezierScrollView removeFromSuperview];
    }
    
    self.bezierScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 45, SCREEN_WIDTH, 130)];
    [self addSubview:self.bezierScrollView];
    self.bezierView = [[customBezierView alloc] init];
    [self.bezierScrollView addSubview:self.bezierView];
    
    self.bezierDataArray = valueArray;
    self.bezierDataTimeArray = timeArray;
    [self setBezierScrollViewWithArray:self.bezierDataArray];
    
    [self scrollViewDidEndDecelerating:self.bezierScrollView];
}

- (void)setBezierScrollViewWithArray:(NSArray *)valueArray
{
    NSLog(@"width:%f---height:%f",self.bounds.size.width,self.bounds.size.height);

    CGFloat contentIndex = self.bezierScrollView.frame.size.width / _bezierNumber;
    self.bezierScrollView.contentSize = CGSizeMake(contentIndex * (valueArray.count + _bezierNumber), self.bezierScrollView.frame.size.height);
    self.bezierScrollView.scrollEnabled = YES;
    self.bezierScrollView.showsHorizontalScrollIndicator = YES;
    self.bezierScrollView.delegate = self;
    
    self.bezierScrollView.contentOffset = CGPointMake(valueArray.count / 2 * contentIndex , 0);
    
    self.bezierView.frame = CGRectMake(contentIndex * (_bezierNumber / 2) + contentIndex * (_bezierNumber % 2) / 2, 0, contentIndex * (valueArray.count), self.bezierScrollView.frame.size.height);
    
    [self setHealthyDataBezierViewLine];
    
    self.bezierView.bezierHorizonSection = valueArray.count;
    self.bezierView.bezierVerticalSection = _bezierNumber;
    
    self.bezierView.backgroundColor = [UIColor clearColor];
    
    NSLog(@"width:%f----height:%f",self.bezierScrollView.contentSize.width,self.bezierScrollView.contentSize.height);
    NSLog(@"viewWidth:%f----viewHeight:%f",self.bezierView.frame.size.width,self.bezierView.frame.size.height);
}

#pragma mark - 画折线图...
- (void)setHealthyDataBezierViewLine
{
    CGFloat width = self.bezierView.bounds.size.width / self.bezierDataArray.count;
    CGFloat height = self.bezierView.bounds.size.height;
    CGFloat space = height;//每°代表的高度
    UIColor * roomColor = [UIColor whiteColor];
    NSLog(@"%f--%f---%f",width,height,space);
    
    self.bezierLayer = [CALayer layer];
    self.bezierLayer.position = CGPointMake(self.bezierView.bounds.size.width/2, self.bezierView.bounds.size.height/2);
    self.bezierLayer.bounds = self.bezierView.bounds;
    self.bezierLayer.backgroundColor = [UIColor clearColor].CGColor;
    [self.bezierView.layer addSublayer:_bezierLayer];
    
    UIBezierPath * roomPath = [UIBezierPath bezierPath];
    CAShapeLayer * roomLine = [[CAShapeLayer alloc] init];
    roomLine.strokeColor = roomColor.CGColor;
    roomLine.fillColor = [UIColor clearColor].CGColor;
    roomLine.lineWidth = 1;
    [_bezierLayer addSublayer:roomLine];
    
    CGFloat maxValue = [[self.bezierDataArray valueForKeyPath:@"@max.floatValue"] floatValue];
    NSInteger averageValue = 0;
    CGFloat tatalValue = 0;
    for (int i = 0; i < self.bezierDataArray.count; i ++)
    {
        tatalValue += [self.bezierDataArray[i] floatValue];
    }

    averageValue = tatalValue / (self.bezierDataArray.count);
    
    BOOL firstOfRoom = YES;
    for (int i = 0; i < self.bezierDataArray.count; i ++)
    {
        CGFloat dataValue = [self.bezierDataArray[i] floatValue];
        if (dataValue == 0)
        {
            dataValue = 10;
        }
        CGFloat newSpaceValue = 0;
        if (averageValue * 2 <= maxValue)
        {
            newSpaceValue = maxValue + 20;
        }else
        {
            newSpaceValue = averageValue * 2;
        }
        CGFloat center_Y = space * dataValue / newSpaceValue;
        // 确定折现的中心...
        CGPoint roomCenter = CGPointMake(width * i, center_Y);
        
        [self drawCirile:roomCenter layer:_bezierLayer color:roomColor radius:5];
        if (firstOfRoom)
        {
            [roomPath moveToPoint:roomCenter];
            firstOfRoom = NO;
        }else
        {
            [roomPath addLineToPoint:roomCenter];
        }
    }
    roomLine.path = roomPath.CGPath;
    
    //折线的绘制动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    animation.duration = 0.0;
    [roomLine addAnimation:animation forKey:nil];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
}

- (void)drawCirile:(CGPoint)center layer:(CALayer *)layer color:(UIColor *)color radius:(CGFloat)radius
{
    CALayer *roomCirile = [CALayer layer];
    roomCirile.position = center;
    roomCirile.bounds = CGRectMake(0, 0, 6, 6);
    roomCirile.cornerRadius = 3;
    roomCirile.masksToBounds = YES;
    roomCirile.backgroundColor = color.CGColor;
    [layer addSublayer:roomCirile];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSInteger offsetIndex = self.bezierScrollView.contentOffset.x / (self.bounds.size.width / _bezierNumber);
    
    if (offsetIndex < 0)
    {
        offsetIndex = 0;
    }else if(offsetIndex >= self.bezierDataArray.count)
    {
        offsetIndex = self.bezierDataArray.count - 1;
    }else
    {
        offsetIndex = self.bezierScrollView.contentOffset.x / (self.bounds.size.width / _bezierNumber);
    }
    if (self.bezierDataArray.count > 0)
    {
        NSString * dataTypeString = @"";
   

        self.B_WNumLab.text = [NSString stringWithFormat:@"数据:%@%@",self.bezierDataArray[offsetIndex],dataTypeString];
        NSString * timeString = [NSString stringWithFormat:@"%@",self.bezierDataTimeArray[offsetIndex]];
        self.B_TimeLabel.text = [NSString stringWithFormat:@"日期:%@",timeString];
        NSLog(@"offsetIndex:%ld",(long)offsetIndex);
        NSLog(@"text:%@",[NSString stringWithFormat:@"%@",self.bezierDataArray[offsetIndex]]);
        self.bezierScrollView.contentOffset = CGPointMake(self.bezierScrollView.frame.size.width / _bezierNumber * offsetIndex, 0);
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger offsetIndex = self.bezierScrollView.contentOffset.x / (self.bounds.size.width / _bezierNumber);
    
    if (offsetIndex < 0)
    {
        offsetIndex = 0;
    }else if(offsetIndex >= self.bezierDataArray.count)
    {
        offsetIndex = self.bezierDataArray.count - 1;
    }else
    {
        offsetIndex = self.bezierScrollView.contentOffset.x / (self.bounds.size.width / _bezierNumber);

    }

    NSLog(@"bezierDataArray:%@",self.bezierDataArray);
    if (self.bezierDataArray.count > 0)
    {
        NSString * dataTypeString = @"";
       
        self.B_WNumLab.text = [NSString stringWithFormat:@"数据:%@%@",self.bezierDataArray[offsetIndex],dataTypeString];
        NSString * timeString = [NSString stringWithFormat:@"%@",self.bezierDataTimeArray[offsetIndex]];
        self.B_TimeLabel.text = [NSString stringWithFormat:@"日期:%@",timeString];
        NSLog(@"offsetIndex:%ld",(long)offsetIndex);
        NSLog(@"text:%@",[NSString stringWithFormat:@"%@",self.bezierDataArray[offsetIndex]]);
        self.bezierScrollView.contentOffset = CGPointMake(self.bezierScrollView.frame.size.width / _bezierNumber * offsetIndex, 0);

    }
}

#define DEFAULT_VOID_COLOR [UIColor whiteColor]
- (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6)
    {
        return DEFAULT_VOID_COLOR;
    }
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return DEFAULT_VOID_COLOR;
    }
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

- (void)resetLabel:(UILabel *)label TextAlignment:(NSTextAlignment)alignment andFont:(UIFont *)font andTextColor:(UIColor *)color andText:(NSString *)text
{
    label.textAlignment = alignment;
    label.font = font;
    label.textColor = color;
    label.text = [NSString stringWithFormat:@"%@",text];
}


@end
