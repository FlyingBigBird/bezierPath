//
//  customBezierView.m
//
//  Created by BaoBaoDaRen on 16/10/28.
//  Copyright © 2016年 康振超. All rights reserved.
//

#import "customBezierView.h"

@implementation customBezierView

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    self.bezierViewheight = rect.size.height;
    
    // 绘制竖线...
    [self drawHorizontalOfHealthyData:self.bezierViewheight];
    
    // 绘制横线...
    [self drawVerticalOfHealthyData:self.bezierViewheight];
    NSLog(@"width:%f---height:%f",self.bounds.size.width,self.bounds.size.height);
    
}

// 绘制横线...
- (void)drawHorizontalOfHealthyData:(CGFloat)height
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    CGFloat Y_Space = height / self.bezierVerticalSection;// y轴分成多少份...
    for (int i = 0; i <= self.bezierVerticalSection; i ++)
    {
        [path moveToPoint:CGPointMake(0, Y_Space * i)];
        
#pragma mark - 添加横线
        [path addLineToPoint:CGPointMake(self.bounds.size.width, Y_Space * i)];
    }
    
    CAShapeLayer * layer = [[CAShapeLayer alloc] init];
    layer.path = path.CGPath;
    layer.strokeColor = [UIColor blackColor].CGColor;
    layer.lineWidth = 0.5;
    [self.layer addSublayer:layer];
    
}

// 绘制竖线...
- (void)drawVerticalOfHealthyData:(CGFloat)height
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    CGFloat X_Space = self.bounds.size.width / self.bezierHorizonSection;// x轴的分区...
    for (int i = 0; i <= self.bezierHorizonSection; i ++)
    {
        [path moveToPoint:CGPointMake(X_Space * i, 0)];
        
#pragma mark - 添加竖线...
        [path addLineToPoint:CGPointMake(X_Space * i, height)];
    }

    // 设置折现图的layer...
    CAShapeLayer * layer = [[CAShapeLayer alloc] init];
    layer.path = path.CGPath;
    layer.strokeColor = [UIColor blackColor].CGColor;
    layer.lineWidth = 0.5;
    [self.layer addSublayer:layer];

}




@end
