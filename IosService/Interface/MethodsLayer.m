//
//  MethodsLayer.m
//  Service
//
//  Created by Vocinno Mac Mini 1 on 15/7/27.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import "MethodsLayer.h"

@implementation MethodsLayer{
}
//返回渐变的颜色
+(CAGradientLayer *)methodsReturnGradientLayer:(StructGradientParameter)structParameter{
    
    CAGradientLayer *newShadow = [[CAGradientLayer alloc] init];
    
//    CGRect newShadowFrame = CGRectMake(0, 0, CGRectGetWidth(structParameter.gradiendBounds),CGRectGetHeight(structParameter.gradiendBounds));
//    newShadow.frame = newShadowFrame;
    
    CGRect newShadowFrame = CGRectMake(0, 0, CGRectGetWidth(structParameter.gradiendBounds),CGRectGetHeight(structParameter.gradiendBounds));
    newShadow.frame = newShadowFrame;
    //添加渐变的颜色组合
    
    newShadow.colors = structParameter.gradiendColors;
    newShadow.locations = structParameter.gradiendLocations;
    newShadow.startPoint = structParameter.gradientStartPoint;
    newShadow.endPoint = structParameter.gradientEndPoint;
//    
//    //test
//    newShadow.borderColor = [UIColor greenColor].CGColor;
//    newShadow.borderWidth = 1.0;

    return newShadow;
}



@end

