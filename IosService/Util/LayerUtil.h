//
//  LayerUtil.h
//  帖子详情页
//
//  Created by Vocinno Mac Mini 1 on 15/4/10.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface LayerUtil : NSObject{
}
+(CAShapeLayer *)addLayer:(UIView*)lpView frame:(CGRect)frame lineWidth:(CGFloat)lineWidth fillColor:(UIColor*)fillColor strokeColor:(UIColor *)strokeColor;

//添加普通layer
+(CALayer *)addLayer:(UIView *)lpView frame:(CGRect)frame bgColor:(UIColor*)bgColor;
//添加普通layer
+(CALayer *)addLayer:(UIView *)lpView centerPoint:(CGPoint)centerPoint radius:(CGFloat)radius bgColor:(UIColor*)bgColor;
@end
