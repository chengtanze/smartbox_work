//
//  PNLineChart.m
//  PNChartDemo
//
//  Created by kevin on 11/7/13.
//  Copyright (c) 2013年 kevinzhow. All rights reserved.
//

#import "PNLineChart.h"
//#import "PNColor.h"
//#import "PNChartLabel.h"

//#define LINESPACING 30.0
#define TOPEDGE     20.0
#define BOTTOMEDGE  8.0
#define EDGE        0.0

@interface PNLineChart()
{
   CGFloat linespacing;
   CGFloat xLabelWidth;
}
@end

@implementation PNLineChart

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.clipsToBounds = YES;
        _grade = 5;
        _rang.min = 50;
        _rang.max = 100;
        linespacing = (frame.size.height- TOPEDGE- BOTTOMEDGE)/_grade;
        xLabelWidth = (self.frame.size.width-EDGE-20)/7;
        _strokeColor = [UIColor colorWithRed:0.32 green:.67 blue:.1 alpha:1.0];
        
		_chartLine = [CAShapeLayer layer];
        _chartLine.backgroundColor = [[UIColor clearColor]CGColor];
		_chartLine.lineCap = kCALineCapButt;
		_chartLine.lineJoin = kCALineJoinBevel;
		_chartLine.fillColor   = [[UIColor colorWithRed:0.32 green:.67 blue:.1 alpha:1.0]CGColor];
		_chartLine.lineWidth   = 2.0;
		_chartLine.strokeEnd   = 0.0;
        
		[self.layer addSublayer:_chartLine];
        
        //
        _chardial = [CAShapeLayer layer];
        _chardial.backgroundColor = [[UIColor clearColor]CGColor];
        _chardial.fillColor = [[UIColor grayColor] CGColor];
        _chardial.strokeColor = [[UIColor grayColor] CGColor];

        _chardial.lineWidth   = 0.5;
        _chardial.strokeEnd   = 0.0;
        _chardial.lineJoin    = kCALineJoinBevel;
        _chardial.frame       = self.bounds;
        [self.layer addSublayer:_chardial];
        [self strokeChardial];
         NSLog(@"111111initWithFrame");
        //
     }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        self.clipsToBounds = YES;
        _grade = 5;
        _rang.min = 50;
        _rang.max = 100;
        linespacing = (self.frame.size.height- TOPEDGE- BOTTOMEDGE)/_grade;
        xLabelWidth = (self.frame.size.width-EDGE-20)/7;
        
        
        _chartLine = [CAShapeLayer layer];
        _chartLine.backgroundColor = [[UIColor clearColor]CGColor];
        _chartLine.lineCap = kCALineCapButt;
        _chartLine.lineJoin = kCALineJoinBevel;
        _chartLine.fillColor   = [[UIColor colorWithRed:0.32 green:.67 blue:.1 alpha:1.0]CGColor];
        _chartLine.lineWidth   = 2.0;
        _chartLine.strokeEnd   = 0.0;
        _strokeColor = [UIColor colorWithRed:0.32 green:.67 blue:.1 alpha:1.0];
        [self.layer addSublayer:_chartLine];
        
        //
        _chardial = [CAShapeLayer layer];
        _chardial.backgroundColor = [[UIColor clearColor]CGColor];
        _chardial.fillColor = [[UIColor grayColor] CGColor];
        _chardial.strokeColor = [[UIColor grayColor] CGColor];
        
        _chardial.lineWidth   = 0.5;
        _chardial.strokeEnd   = 0.0;
        _chardial.lineJoin    = kCALineJoinBevel;
        _chardial.frame       = self.bounds;
        [self.layer addSublayer:_chardial];
        [self strokeChardial];
        NSLog(@"111111initWithCoder");
        
    }
    return self;
}

-(void)dealloc
{
    [_chartLine removeAllAnimations];
    NSLog(@"PNLineChart dealloc");
}

-(void)setChardata:(NSArray *)data
{
    if (!data) {
        return;
    }
    _chardata = data;

    [self strokeChardial];
    [self strokeChart];
}



-(void)setRang:(CHARDATARANG)rang
{
    _rang.min = rang.min;
    _rang.max = rang.max;
    
}

-(void)setStrokeColor:(UIColor *)strokeColor
{
	_strokeColor = strokeColor;
	_chartLine.strokeColor = [strokeColor CGColor];
}



-(void) strokeChardial
{
    
    CGFloat xWidth = (self.frame.size.width-EDGE-20)/_chardata.count;
    
    UIBezierPath *progressline = [UIBezierPath bezierPath];
    //int linecount = 5;
    
    CGFloat rightEdgePointx = self.frame.size.width-EDGE;
    for (int index = 0; index < _grade ; index++) {
        CGFloat y = ceil(index*linespacing+TOPEDGE);
//        NSLog(@"y = %f",y);
        [progressline moveToPoint:CGPointMake(EDGE, y)];
        [progressline addLineToPoint:CGPointMake(rightEdgePointx, y)];
    }
    
    //n端竖线
    int py = (_grade-1)*linespacing+TOPEDGE;
    int index = 0;
    
    for(NSDictionary* datavalue in _chardata)
    {
        [progressline moveToPoint:CGPointMake((index+1)*xWidth+EDGE, py)];
        [progressline addLineToPoint:CGPointMake((index+1)*xWidth+EDGE, py+8)];
        //加上xlabel
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(index*xWidth+EDGE, py+8+5, xWidth, 14)];
        [label setFont:[UIFont systemFontOfSize:10]];
        [label setTextAlignment:NSTextAlignmentRight];
        label.transform = CGAffineTransformMakeRotation((-30.0f * M_PI) / 180.0f);
        label.text = [datavalue objectForKey:@"desc"];
        label.textColor = [UIColor darkGrayColor];
        [self addSubview:label];
        ++index;
    }
   
    
    _chardial.path = progressline.CGPath;
    _chardial.strokeEnd   = 1.0;
    
}

-(void)strokeChart
{
    if (!_chardata) {
        return;
    }
    
    
    CGFloat xWidth = (self.frame.size.width-EDGE-20)/_chardata.count;
    UIBezierPath *progressline = [UIBezierPath bezierPath];
    
    
    CGFloat firstValue = [[[_chardata firstObject] objectForKey:@"value"]floatValue];
    
    
    CGFloat chartCavanHeight = self.frame.size.height - TOPEDGE - BOTTOMEDGE-linespacing;
    CGFloat heightRatio = (firstValue-_rang.min)/(_rang.max- _rang.min);
    
    //第一个点
//    [progressline moveToPoint:CGPointMake(xWidth+EDGE, chartCavanHeight+TOPEDGE  - heightRatio * chartCavanHeight)];
//    [progressline addArcWithCenter:CGPointMake( xWidth+EDGE, chartCavanHeight+TOPEDGE  - heightRatio * chartCavanHeight) radius:4.0 startAngle:0 endAngle:2*M_PI clockwise:TRUE];
//    
//    [progressline moveToPoint:CGPointMake(xWidth+EDGE, chartCavanHeight+TOPEDGE  - heightRatio * chartCavanHeight)];
//    
//    //点上得文字
//    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(xWidth+EDGE-yLabelHeight, chartCavanHeight+TOPEDGE  - heightRatio * chartCavanHeight- yLabelHeight*1.5, yLabelHeight*2, yLabelHeight)];
//    [label setTextAlignment:NSTextAlignmentCenter];
//    [label setFont:[UIFont systemFontOfSize:12.0f]];
//    label.textColor = [UIColor whiteColor];
//    label.text = [NSString stringWithFormat:@"%1.f",firstValue];
    
//    [self addSubview:label];
    
    CGFloat py = (_grade-1)*linespacing+TOPEDGE;
    //第一条线和第二个点
    NSInteger index = 1;
    
    for (NSDictionary * valuedata in _chardata) {
        NSInteger value = [[valuedata objectForKey:@"value"] intValue];
        
        CGFloat heightRatio = ( (float)value-_rang.min)/(_rang.max- _rang.min);
            
            [progressline moveToPoint:CGPointMake((index)*xWidth+EDGE, chartCavanHeight+TOPEDGE  - heightRatio * chartCavanHeight)];
            [progressline addArcWithCenter:CGPointMake((index)*xWidth+EDGE, chartCavanHeight+TOPEDGE  - heightRatio * chartCavanHeight) radius:4.0 startAngle:0 endAngle:2*M_PI clockwise:TRUE];
            
            [progressline moveToPoint:CGPointMake((index)*xWidth+EDGE, py)];
            [progressline addLineToPoint:CGPointMake((index)*xWidth+EDGE, chartCavanHeight+TOPEDGE  - heightRatio * chartCavanHeight)];

            //[progressline fill];
            [progressline moveToPoint:CGPointMake((index)*xWidth+EDGE, chartCavanHeight+TOPEDGE  - heightRatio * chartCavanHeight)];
            
            UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake((index)*xWidth+EDGE-yLabelHeight, chartCavanHeight+TOPEDGE  - heightRatio * chartCavanHeight- yLabelHeight*1.5, yLabelHeight*2, yLabelHeight)];
            [label setTextAlignment:NSTextAlignmentCenter];
            [label setFont:[UIFont systemFontOfSize:12.0f]];
            label.textColor = _strokeColor;
            label.text = [NSString stringWithFormat:@"%ld",(long)value];
            
            [self addSubview:label];
        
        
        index += 1;
    }
    
    _chartLine.path = progressline.CGPath;
    if (_strokeColor) {
        _chartLine.strokeColor = [_strokeColor CGColor];
    }else{
        _chartLine.strokeColor = [[UIColor colorWithRed:0.32 green:.67 blue:.1 alpha:1.0]CGColor];
    }
    
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnimation.autoreverses = NO;
    [_chartLine addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    
    _chartLine.strokeEnd = 1.0;

    ///----------------
    
//    CGFloat xWidth = (self.frame.size.width-EDGE-20)/_chardata.count;
//    UIBezierPath *progressline = [UIBezierPath bezierPath];
//    
//    
//    CGFloat firstValue = [[[_chardata firstObject] objectForKey:@"value"]floatValue];
//    
//    
//    CGFloat chartCavanHeight = self.frame.size.height - TOPEDGE - BOTTOMEDGE-linespacing;
//    CGFloat heightRatio = (firstValue-_rang.min)/(_rang.max- _rang.min);
//
//    //第一个点
//    [progressline moveToPoint:CGPointMake(xWidth+EDGE, chartCavanHeight+TOPEDGE  - heightRatio * chartCavanHeight)];
//    [progressline addArcWithCenter:CGPointMake( xWidth+EDGE, chartCavanHeight+TOPEDGE  - heightRatio * chartCavanHeight) radius:4.0 startAngle:0 endAngle:2*M_PI clockwise:TRUE];
//    
//    [progressline moveToPoint:CGPointMake(xWidth+EDGE, chartCavanHeight+TOPEDGE  - heightRatio * chartCavanHeight)];
//    
//    //点上得文字
//    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(xWidth+EDGE-yLabelHeight, chartCavanHeight+TOPEDGE  - heightRatio * chartCavanHeight- yLabelHeight*1.5, yLabelHeight*2, yLabelHeight)];
//    [label setTextAlignment:NSTextAlignmentCenter];
//    [label setFont:[UIFont systemFontOfSize:12.0f]];
//    label.textColor = [UIColor whiteColor];
//    label.text = [NSString stringWithFormat:@"%1.f",firstValue];
//
//    [self addSubview:label];
//    
//    //第一条线和第二个点
//    NSInteger index = 0;
//
//    for (NSDictionary * valuedata in _chardata) {
//        NSInteger value = [[valuedata objectForKey:@"value"] intValue];
//    
//        CGFloat heightRatio = ( (float)value-_rang.min)/(_rang.max- _rang.min);
//        if (index != 0) {
//            [progressline addLineToPoint:CGPointMake((index+1)*xWidth+EDGE, chartCavanHeight+TOPEDGE  - heightRatio * chartCavanHeight)];
//            
//            
//            [progressline moveToPoint:CGPointMake((index+1)*xWidth+EDGE, chartCavanHeight+TOPEDGE  - heightRatio * chartCavanHeight)];
//            [progressline addArcWithCenter:CGPointMake((index+1)*xWidth+EDGE, chartCavanHeight+TOPEDGE  - heightRatio * chartCavanHeight) radius:4.0 startAngle:0 endAngle:2*M_PI clockwise:TRUE];
//            
//            
//            //[progressline fill];
//            [progressline moveToPoint:CGPointMake((index+1)*xWidth+EDGE, chartCavanHeight+TOPEDGE  - heightRatio * chartCavanHeight)];
//            
//            UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake((index+1)*xWidth+EDGE-yLabelHeight, chartCavanHeight+TOPEDGE  - heightRatio * chartCavanHeight- yLabelHeight*1.5, yLabelHeight*2, yLabelHeight)];
//            [label setTextAlignment:NSTextAlignmentCenter];
//            [label setFont:[UIFont systemFontOfSize:12.0f]];
//            label.textColor = [UIColor whiteColor];
//            label.text = [NSString stringWithFormat:@"%ld",(long)value];
//            
//            [self addSubview:label];
//
//        }
//        
//        index += 1;
//    }
//    
//    _chartLine.path = progressline.CGPath;
//	if (_strokeColor) {
//		_chartLine.strokeColor = [_strokeColor CGColor];
//	}else{
//		_chartLine.strokeColor = [[UIColor colorWithRed:0.416 green:0.427 blue:0.92 alpha:1.0]CGColor];
//	}
//    
//    
//    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    pathAnimation.duration = 1.0;
//    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
//    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
//    pathAnimation.autoreverses = NO;
//    [_chartLine addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
//    
//    _chartLine.strokeEnd = 1.0;
}




-(void)endstrokeChart
{
    [_chardial removeAllAnimations];
    
    for (UIView *view in self.subviews)
    {
        if ([view isKindOfClass:[UIView class]])
        {
            NSLog(@"%@",[view class]);
            [view removeFromSuperview];
        }
    }
    
}
@end
