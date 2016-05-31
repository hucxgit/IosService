//
//  AnimationUtil.h
//  介绍页动画
//
//  Created by Vocinno Mac Mini 1 on 15/4/2.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
/*
 *动画工具类
 */



/*CAMediaTiming
 *参数解释
 *Autoreverses (YES 到达目的地后 动画返回到开始的值)
 *Duration (动画从开始到结束话费的时间)
 *RemovedOnCompletion (YES 在指定时间段 动画被移除)
 *Speed(默认值1.0 动画播放按照默认的速度) 如果你改变这个值为 2.0,动画会用 2 倍的速度播放。
 *TimeOffset local time也分成两种
                    一种是 active local time 
                    一种是basic local time.
                    timeOffset则是active local time的偏移量.
                    解释:你将一个动画看作一个环,timeOffset改变的其实是动画在环内的起点,比如一个duration为5秒的动画,将timeOffset设置为2(或者7,模5为2),那么动画的运行则是从原来的2秒开始到5秒,接着再0秒到2秒,完成一次动画.
 *fillMode  当前对象过了非active时间段的行为.  则需要将其removedOnCompletion设置为NO,要不然fillMode不起作用
            kCAFillModeRemoved 也就是说当动画开始前和动画结束后,动画对layer都没有影响,动画结束后,layer会恢复到之前的状态
            kCAFillModeForwards  当动画结束后,layer会一直保持着动画最后的状态
            kCAFillModeBackwards
            kCAFillModeBoth
 *RepeatCount(默认是0 动画只会播放一次)
 *RepeatDuration(指定动画应该被重复多久 动画会一直重复,直到设定的时间流逝完) 它不应该和 repeatCount 一起使用。
 */


/*动画本身的概念
 *中间状态的插值计算(Interpolation)
 *二是动画节奏控制(Timing)
 *  CABasicAnimation有三个比较重要的属性,fromValue,toValue,byValue,
 *  timingFunction
 */


//基础动画输入参数
typedef struct CABasicAnimationParameter{
     __unsafe_unretained NSString *keyPath;
    //关键值
    __unsafe_unretained id fromValue;
    __unsafe_unretained id byValue;
    __unsafe_unretained id toValue;
    
    //属性值
    NSTimeInterval beginTime;
    CGFloat duration;
    float repeatCount;
    BOOL autoreverses;
    BOOL removedOnCompletion;
    __unsafe_unretained NSString* fillMode;
    __unsafe_unretained CAMediaTimingFunction *timingFunction;//Defaults to * nil indicating linear pacing
    __unsafe_unretained id delegate;
    
    
}CABasicAnimationParameter;
 


//关键帧动画基础参数
typedef struct CAKeyFrameAnimationParameter{
     __unsafe_unretained NSString *keyPath;
     //关键值
    __unsafe_unretained NSArray *values;
    CGPathRef path;
    __unsafe_unretained NSArray *keyTimes;
    
    //属性值
    NSTimeInterval beginTime;
    CGFloat duration;
    float repeatCount;
    BOOL removedOnCompletion;
    __unsafe_unretained NSString* fillMode;
    __unsafe_unretained NSString *calculationMode; // The "calculation mode". Possible values are `discrete', `linear',  * `paced', `cubic' and `cubicPaced'. Defaults to `linear'
   
    __unsafe_unretained id delegate;
    
    
    
}CAKeyFrameAnimationParameter;


//单个动画 开始动画必要参数
typedef struct CAAnimationStartParameter{
    __unsafe_unretained UIView *layerView;
     //动画唯一标识
    __unsafe_unretained NSString *key;
}CAAnimationStartParameter;

//动画组 开始动画必要参数
typedef struct CAAnimationGroupStartParameter{
    __unsafe_unretained UIView *layerView;
    
    //属性值
     CGFloat duration;
     CGFloat repeatCount;
     BOOL removedOnCompletion;
     __unsafe_unretained NSString* fillMode;
     __unsafe_unretained id delegate;
    
    //动画唯一标识
    __unsafe_unretained NSString *key;
    
}CAAnimationGroupStartParameter;




//CAShaperLayer 画圆需要
typedef struct DataCircleParameter{
    CGRect frame;   //frame
    CGFloat lineWidth; //线宽
    __unsafe_unretained UIColor *strokeColor;//
    __unsafe_unretained UIColor *fillColor;//
    CGPoint centerPoint;
    CGFloat radius;//半径
    CGFloat startAngle;//开始弧度
    CGFloat endAngle;//结束弧度
    BOOL block;//顺时针
    
    CGFloat duration;//延时
    
    __unsafe_unretained id delegate;//代理对象
}DataCircleParameter;


//CAShaperLayer 画线需要
typedef struct DataLineParameter{
    CGRect frame;   //frame
    CGFloat lineWidth; //线宽
    __unsafe_unretained UIColor *strokeColor;//
    __unsafe_unretained UIColor *fillColor;//
    
    CGFloat duration;//延时
    __unsafe_unretained id delegate;//代理对象
}DataLineParameter;



@interface AnimationUtil : NSObject
{}
//开始基础动画
+(CABasicAnimation *)getBasicAnimation:(CABasicAnimationParameter)parameter;
+(void)startBasicAnimation:(CABasicAnimation*)basicAnimation  startParameter:(CAAnimationStartParameter)parameter;


//开始关键帧动画
+(CAKeyframeAnimation *)getKeyFrameAnimation:(CAKeyFrameAnimationParameter)parameter;
+(void)startKeyFrameAnimation:(CAKeyframeAnimation*)keyFrameAnimation startParameter:(CAAnimationStartParameter)parameter;



//开始动画组
+(void)startAnimationGroup:(NSArray *)basicAnimationParameters keyFrameAnimationParameter:(NSArray *)keyFrameAnimationParameter startParameter:(CAAnimationGroupStartParameter)paramete;
@end
//-(void)a;
