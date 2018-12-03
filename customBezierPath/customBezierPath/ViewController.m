//
//  ViewController.m
//  customBezierPath
//
//  Created by BaoBaoDaRen on 2018/12/3.
//  Copyright © 2018年 BaoBao. All rights reserved.
//

#import "ViewController.h"
#import "ScrollBezierCurveView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) ScrollBezierCurveView *bezierView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *bgV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    [self.view addSubview:bgV];
    bgV.center = self.view.center;
    
    self.bezierView = [[ScrollBezierCurveView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    [bgV addSubview:self.bezierView];
    bgV.backgroundColor = [self.bezierView colorWithHexString:@"#aadea0"];

    NSArray *bezierDataArray = @[@"6",@"2",@"5",@"5.1",@"5.5",@"5.6",@"4.2",@"4.3",@"4.5",@"6.4",@"6.3",@"8.2",@"8.3",@"8.4",@"7.0",@"7.1",@"7.2",@"7.3",@"7.4"];
    NSArray *bezierDataTimeArray = @[@"11-01",@"11-02",@"11-03",@"11-04",@"11-05",@"11-06",@"11-07",@"11-08",@"11-09",@"11-10",@"11-11",@"11-12",@"11-13",@"11-14",@"11-15",@"11-16",@"11-17",@"11-18",@"11-19"];

    [self.bezierView setBezierViewSubViewsWithArray:bezierDataArray timeArray:bezierDataTimeArray BezierType:@""];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
