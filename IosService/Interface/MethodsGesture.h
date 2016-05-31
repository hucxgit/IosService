//
//  MethodsGesture.h
//  KinkIos
//
//  Created by Vocinno Mac Mini 1 on 15/7/3.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MethodsGesture : NSObject{
}

//增加手势
+(void)addLeftRightDirectionSwipGesture:(UIView *)lpView delegate:(id)delegate sel:(SEL)sel;
+(void)addAllDirectionSwipGesture:(UIView*)lpView delegate:(id)delegate sel:(SEL)sel;
+(void)addSwipGesture:(UIView*)lpView direction:(UISwipeGestureRecognizerDirection)direction delegate:(id)delegate sel:(SEL)sel;
+(void)removeSwipGesture:(UIView*)lpView;
//拖动手势
+(void)addPanGesture:(UIView *)lpView delegate:(id)delegate sel:(SEL)sel;
+(void)addTapGesture:(UIView *)lpView delegate:(id)delegate sel:(SEL)sel;
+(void)addLongPressedGesture:(UIView *)lpView minimumPressDuration:(double)minimumPressDuration delegate:(id)delegate sel:(SEL)sel;
//添加左边sidebar手势
+(void)addEdgeLeftPanGestureRecognizer:(UIView *)lpView delegate:(id)delegate sel:(SEL)sel;
//添加右边sidebar手势
+(void)addEdgeRightPanGestureRecognizer:(UIView *)lpView delegate:(id)delegate sel:(SEL)sel;
+(void)removeTapGesture:(UIView*)lpView  mGestureRecognizer:(Class)mGestureRecognizer;
@end
