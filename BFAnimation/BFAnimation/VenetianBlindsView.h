//
//  VenetianBlindsView.h
//  BFAnimation
//
//  Created by 盘国权 on 2018/9/27.
//  Copyright © 2018年 pgq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VenetianBlindsView : UIView
// default 0.5
@property (nonatomic,assign) CGFloat angle;
// default 0.5
@property (nonatomic,assign) CGFloat progress;
// default 10
@property (nonatomic,assign) int lines;
// default 2
@property (nonatomic,assign) CGFloat lineWidth;
// default gray
@property (nonatomic,strong) UIColor *lineColor;

@end

