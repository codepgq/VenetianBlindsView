//
//  VenetianBlindsView.m
//  BFAnimation
//
//  Created by 盘国权 on 2018/9/27.
//  Copyright © 2018年 pgq. All rights reserved.
//

#import "VenetianBlindsView.h"

@implementation VenetianBlindsView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initData];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self drawHorizontalLine];
}

- (void)initData {
    _lines = 10;
    _lineWidth = 2;
    _lineColor = UIColor.grayColor;
    _angle = 0.5;
    _progress = 0.5;
    self.clipsToBounds = true;
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    [self drawHorizontalLine];
}

- (void)setAngle:(CGFloat)angle {
    _angle = angle;
    [self drawHorizontalLine];
}

- (void)drawRect:(CGRect)rect {
    [self drawVerticalLine];
}

- (void)drawVerticalLine {
    UIBezierPath *line = [UIBezierPath bezierPath];
    CGFloat x = self.frame.size.width * 0.5 - _lineWidth * 0.5;
    [line moveToPoint:CGPointMake(x, 0)];
    [line addLineToPoint:CGPointMake(x, self.frame.size.height)];
    line.lineWidth = _lineWidth;
    [_lineColor setStroke];
    [line stroke];
}

- (void)drawHorizontalLine {
    // length
    CGFloat lineLength = self.frame.size.width * 0.7;
    /// 总spaceing
    CGFloat sumSpaceing = self.frame.size.height - (_lines * _lineWidth);
    /// 根据progress 设置spaceing
    CGFloat currentSpaceing = sumSpaceing / _lines * _progress ;
    
    switch (self.subviews.count) {
        case 0:
            [self createViewsWithLineLength:lineLength currentSpaceing:currentSpaceing];
            break;
            
        default:
            [self layoutViewsWithLineLength:lineLength currentSpaceing:currentSpaceing];
            break;
    }
}

- (void)createViewsWithLineLength:(CGFloat)lineLength currentSpaceing:(CGFloat)currentSpaceing {
    for (int i = 0; i<_lines; i++) {
        CGFloat beganX = (self.frame.size.width - lineLength) * 0.5;
        CGFloat y = (i + 0.5) * currentSpaceing + i * _lineWidth + 0.5;
        
        UIView *lineLayer = [[UIView alloc] init];
        lineLayer.frame = CGRectMake(beganX, y, lineLength, _lineWidth );
        lineLayer.backgroundColor = _lineColor;
        lineLayer.layer.anchorPoint = CGPointMake(0.5, 0.5);
        [self addSubview:lineLayer];
        
    }
}

- (void)layoutViewsWithLineLength:(CGFloat)lineLength currentSpaceing:(CGFloat)currentSpaceing{
    CGFloat rotation = (M_PI / 90) * 60 * (0.5 - _angle);
    
    [self.subviews enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger i, BOOL * _Nonnull stop) {
        obj.transform = CGAffineTransformIdentity;
        CGFloat beganX = (self.frame.size.width - lineLength) * 0.5;
        CGFloat y = (i + 0.5) * currentSpaceing + i * self.lineWidth + 0.5;
        CGRect frame = obj.frame;
        frame.origin.x = beganX;
        frame.origin.y = y;
        obj.frame = frame;
        
        obj.transform = CGAffineTransformMakeRotation(rotation);
    }];
    
}

@end
