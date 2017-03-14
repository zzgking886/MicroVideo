//
//  BezierView.m
//  MicroVideo
//
//  Created by Zhangzhengang on 17/3/14.
//  Copyright © 2017年 Zhangzhengang. All rights reserved.
//

#import "BezierView.h"

@interface BezierView ()
{
    
}

@end

@implementation BezierView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    
    UIBezierPath *tPath = [UIBezierPath bezierPath];
    [tPath moveToPoint:CGPointMake(0, 0)];
    [tPath addLineToPoint:CGPointMake(self.frame.size.width, 0)];
    [tPath addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
    [tPath addQuadCurveToPoint:CGPointMake(0, self.frame.size.height - 30) controlPoint:CGPointMake(0, self.frame.size.height)];
    
    do
    {
        CGContextSaveGState(context);
        CGContextAddPath(context, tPath.CGPath);
        CGContextFillPath(context);
        CGContextRestoreGState(context);
    } while (0);
    
    //设置阴影
    //        CGContextSetShadow(context, CGSizeMake(200, 0), 1);
    //添加高亮效果
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    //开始描边
    [[UIColor blackColor] setStroke];
    //[btnPath stroke];
    //开始填充颜色
    [tPath fill];
}

@end
