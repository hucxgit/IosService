//
//  MethodsGesture.m
//  KinkIos
//
//  Created by Vocinno Mac Mini 1 on 15/7/3.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import "MethodsGesture.h"

@implementation MethodsGesture
{
    
}

//增加左右手势
+(void)addLeftRightDirectionSwipGesture:(UIView *)lpView delegate:(id)delegate sel:(SEL)sel{
    [[self class] addSwipGesture:lpView direction:UISwipeGestureRecognizerDirectionLeft delegate:delegate sel:sel];
    [[self class] addSwipGesture:lpView direction:UISwipeGestureRecognizerDirectionRight delegate:delegate sel:sel];
}
//增加手势
+(void)addAllDirectionSwipGesture:(UIView*)lpView delegate:(id)delegate sel:(SEL)sel{
    [[self class] addSwipGesture:lpView direction:UISwipeGestureRecognizerDirectionLeft delegate:delegate sel:sel];
    [[self class] addSwipGesture:lpView direction:UISwipeGestureRecognizerDirectionRight delegate:delegate sel:sel];
    [[self class] addSwipGesture:lpView direction:UISwipeGestureRecognizerDirectionUp delegate:delegate sel:sel];
    [[self class] addSwipGesture:lpView direction:UISwipeGestureRecognizerDirectionDown delegate:delegate sel:sel];
}
+(void)addSwipGesture:(UIView*)lpView direction:(UISwipeGestureRecognizerDirection)direction delegate:(id)delegate sel:(SEL)sel{
    
    //给小飞机添加滑动手势
    UISwipeGestureRecognizer *leftRecognizer;
    leftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:delegate action:sel];
    [leftRecognizer setDirection:direction];
    [lpView addGestureRecognizer:leftRecognizer];
}
+(void)removeSwipGesture:(UIView*)lpView{
    NSArray *gestures = [lpView gestureRecognizers];
    if ([gestures count]>0) {
        for (UIGestureRecognizer *gesture in gestures) {
            if ([gesture isKindOfClass:[UISwipeGestureRecognizer class]]) {
                [lpView removeGestureRecognizer:gesture];
                
            }
        }
    }
}

//添加左边sidebar手势
+(void)addEdgeLeftPanGestureRecognizer:(UIView *)lpView delegate:(id)delegate sel:(SEL)sel{
    [[self class] removeTapGesture:lpView mGestureRecognizer:[UIScreenEdgePanGestureRecognizer class]]; //给window添加，拖动的手势
    UIScreenEdgePanGestureRecognizer *swipeShow = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:delegate action:sel];
    [swipeShow setEdges:UIRectEdgeLeft]; //给window添加
    [lpView addGestureRecognizer:swipeShow];
}
//添加右边sidebar手势
+(void)addEdgeRightPanGestureRecognizer:(UIView *)lpView delegate:(id)delegate sel:(SEL)sel{
    [[self class] removeTapGesture:lpView mGestureRecognizer:[UIScreenEdgePanGestureRecognizer class]];
    UIScreenEdgePanGestureRecognizer *swipeHidden = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:delegate action:sel];
    [swipeHidden setEdges:UIRectEdgeRight]; //给window添加
    [lpView addGestureRecognizer:swipeHidden];
}

//拖动手势
+(void)addPanGesture:(UIView *)lpView delegate:(id)delegate sel:(SEL)sel{
    //给小圆点添加拖动手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:delegate action:sel];
    [lpView addGestureRecognizer:panGesture];
}

+(void)addTapGesture:(UIView *)lpView delegate:(id)delegate sel:(SEL)sel{
    [[self class] removeTapGesture:lpView mGestureRecognizer:[UITapGestureRecognizer class]];
    //给next增加手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:delegate action:sel];
    
    [tapGesture setNumberOfTapsRequired:1];
    //[tapGesture setNumberOfTouchesRequired:1];
    [lpView addGestureRecognizer:tapGesture];
}
+(void)addLongPressedGesture:(UIView *)lpView minimumPressDuration:(double)minimumPressDuration delegate:(id)delegate sel:(SEL)sel{
    [[self class] removeTapGesture:lpView mGestureRecognizer:[UILongPressGestureRecognizer class]];
    //给next增加手势
    UILongPressGestureRecognizer *longPressedGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:delegate action:sel];
    longPressedGesture.minimumPressDuration = minimumPressDuration;
    [lpView addGestureRecognizer:longPressedGesture];
}



+(void)removeTapGesture:(UIView*)lpView  mGestureRecognizer:(Class)mGestureRecognizer{
    NSArray *gestures = [lpView gestureRecognizers];
    if ([gestures count]>0) {
        for (UIGestureRecognizer *gesture in gestures) {
            if ([gesture isKindOfClass:mGestureRecognizer]) {
                [lpView removeGestureRecognizer:gesture];
                break;
            }
        }
    }
}



@end
