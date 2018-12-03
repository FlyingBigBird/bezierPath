//
//  customBezierView.h
//
//  Created by BaoBaoDaRen on 16/10/28.
//  Copyright © 2016年 康振超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customBezierView : UIView

// 表格的总高度...
@property (nonatomic, assign) CGFloat bezierViewheight;

// 折现横向分了多少块儿
@property (nonatomic, assign) NSInteger bezierHorizonSection;

// 折现纵向分了多少块儿...
@property (nonatomic, assign) NSInteger bezierVerticalSection;

// X轴的偏移量...
@property (nonatomic, assign) CGFloat B_X_Offset;

// Y轴的偏移量...
@property (nonatomic, assign) CGFloat B_Y_Offset;

@end



