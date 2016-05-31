//
//  MethodsLayer.h
//  Service
//
//  Created by Vocinno Mac Mini 1 on 15/7/27.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

//渐变参数
typedef struct StructGradientParameter{
     CGRect gradiendBounds;
    __unsafe_unretained NSArray *gradiendColors;
    __unsafe_unretained NSArray *gradiendLocations;
    CGPoint gradientStartPoint;
    CGPoint gradientEndPoint;
}StructGradientParameter;


@interface MethodsLayer : NSObject{
}


//返回渐变的颜色
+(CAGradientLayer *)methodsReturnGradientLayer:(StructGradientParameter)structParameter;

@end
