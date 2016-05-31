//
//  LayerUtil.m
//  帖子详情页
//
//  Created by Vocinno Mac Mini 1 on 15/4/10.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import "LayerUtil.h"

@implementation LayerUtil{
}

#pragma mark -
#pragma mark 绘图工具方法
+(CAShapeLayer *)addLayer:(UIView*)lpView frame:(CGRect)frame lineWidth:(CGFloat)lineWidth fillColor:(UIColor*)fillColor strokeColor:(UIColor *)strokeColor{
    //初始化图层
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.backgroundColor = [UIColor clearColor].CGColor;

    shapeLayer.frame = frame;
    CGPoint p =CGPointMake(CGRectGetWidth(frame)/2, CGRectGetHeight(frame)/2);
    shapeLayer.position = p;
    
    shapeLayer.lineWidth = lineWidth;
    shapeLayer.fillColor = fillColor.CGColor;
     shapeLayer.strokeColor = strokeColor.CGColor;
    
    [lpView.layer addSublayer:shapeLayer];
    return shapeLayer;
}

//添加普通layer
+(CALayer *)addLayer:(UIView *)lpView frame:(CGRect)frame bgColor:(UIColor*)bgColor{
    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = bgColor.CGColor;
    layer.bounds = frame;
    CGFloat x = CGRectGetWidth(frame)/2;
    CGFloat y = CGRectGetHeight(frame)/2;
    layer.position = CGPointMake(x, y);
    layer.cornerRadius = CGRectGetWidth(frame)/2;
    [lpView.layer addSublayer:layer];
    return layer;
}

//添加普通layer
+(CALayer *)addLayer:(UIView *)lpView centerPoint:(CGPoint)centerPoint radius:(CGFloat)radius bgColor:(UIColor*)bgColor{
    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = bgColor.CGColor;
    CGRect rect = CGRectMake(0, 0, 2*radius, 2*radius);
    layer.bounds = rect;
    layer.position = centerPoint;
    layer.cornerRadius = radius;
    //[lpView.layer addSublayer:layer];
    return layer;
}

@end
