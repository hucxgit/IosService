//
//  AnimationUtil.m
//  介绍页动画
//
//  Created by Vocinno Mac Mini 1 on 15/4/2.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import "AnimationUtil.h"

@implementation AnimationUtil{
    
}



+(CABasicAnimation *)getBasicAnimation:(CABasicAnimationParameter)parameter{
    //根据keypath初始化动画
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:parameter.keyPath];
    
    //设置动画每一帧的值
    if (parameter.fromValue != nil) {
         basicAnimation.fromValue = parameter.fromValue; // 起始角度
    }
    if (parameter.byValue != nil) {
        basicAnimation.toValue = parameter.byValue;
    }
    if (parameter.toValue != nil) {
        basicAnimation.toValue = parameter.toValue; // 终止角度
    }
    
    
    //设置动画其他参数属性
    basicAnimation.beginTime = parameter.beginTime;
    basicAnimation.duration = parameter.duration;
    basicAnimation.repeatCount = parameter.repeatCount;
    
    basicAnimation.removedOnCompletion = parameter.removedOnCompletion;
    basicAnimation.fillMode = parameter.fillMode;
    basicAnimation.autoreverses=parameter.autoreverses;
    basicAnimation.timingFunction = parameter.timingFunction;
    basicAnimation.delegate = parameter.delegate;

    return basicAnimation;
}
+(void)startBasicAnimation:(CABasicAnimation*)basicAnimation  startParameter:(CAAnimationStartParameter)parameter{
    [parameter.layerView.layer addAnimation:basicAnimation forKey:parameter.key];
}


//开始基础动画
+(CAKeyframeAnimation *)getKeyFrameAnimation:(CAKeyFrameAnimationParameter)parameter{
    //根据keypath初始化动画
    CAKeyframeAnimation *keyFrameAnimation= [CAKeyframeAnimation animationWithKeyPath:parameter.keyPath];
    
    //设置动画其他参数属性
    keyFrameAnimation.beginTime = parameter.beginTime;
    keyFrameAnimation.duration =parameter.duration;
    keyFrameAnimation.repeatCount = parameter.repeatCount;
    keyFrameAnimation.removedOnCompletion = parameter.removedOnCompletion;
    keyFrameAnimation.fillMode = parameter.fillMode;
    keyFrameAnimation.calculationMode = parameter.calculationMode;
    keyFrameAnimation.delegate = parameter.delegate;
    
    //设置每一帧的值
    keyFrameAnimation.values = parameter.values;
    keyFrameAnimation.path = parameter.path;
    keyFrameAnimation.keyTimes = parameter.keyTimes;
   
    
    
    return keyFrameAnimation;
     
}
+(void)startKeyFrameAnimation:(CAKeyframeAnimation*)keyFrameAnimation startParameter:(CAAnimationStartParameter)parameter
{
    //给layer添加动画
    [parameter.layerView.layer addAnimation:keyFrameAnimation forKey:parameter.key];
}



//开始动画组
+(void)startAnimationGroup:(NSArray *)basicAnimationParameters keyFrameAnimationParameter:(NSArray *)keyFrameAnimationParameter startParameter:(CAAnimationGroupStartParameter)parameter{
    
    
    NSMutableArray *animations = [NSMutableArray array];
    for (int i=0; i<basicAnimationParameters.count;i++ ) {
        NSValue *value = [basicAnimationParameters objectAtIndex:i];
        CABasicAnimationParameter parameter;
        [value getValue:&parameter];
        CABasicAnimation *basicAnimation = [[self class] getBasicAnimation:parameter];
       // basicAnimation.beginTime = 0.0;
        
        [animations addObject:basicAnimation];
    }
    
    for (int i=0; i<keyFrameAnimationParameter.count;i++ ) {
        NSValue *value = [keyFrameAnimationParameter objectAtIndex:i];
        CAKeyFrameAnimationParameter parameter;
        [value getValue:&parameter];
        CAKeyframeAnimation *keyFrameAnimation = [[self class] getKeyFrameAnimation:parameter];
        //keyFrameAnimation.beginTime = 0.5;
    
       [animations addObject:keyFrameAnimation];
    }
    
    //动画组
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = animations;
    animationGroup.duration = parameter.duration;
    animationGroup.repeatCount = parameter.repeatCount;
    animationGroup.removedOnCompletion = parameter.removedOnCompletion;
    animationGroup.fillMode = parameter.fillMode;
    animationGroup.delegate = parameter.delegate;
    
    // 添加动画
    [parameter.layerView.layer addAnimation:animationGroup
                      forKey:parameter.key];
}



@end





