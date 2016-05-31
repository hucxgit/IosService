//
//  MethodsFlexSize.h
//  KinkIos
//
//  Created by Vocinno Mac Mini 1 on 15/7/3.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MethodsFlexSize : NSObject{
}

//设置行间距
 +(NSMutableAttributedString *)methodSetLineSpaceForLabel:(NSString*)titleText spacing:(CGFloat)spacing;

//计算一个label的大小
 +(CGSize)methodCalculateVerticalSize:(NSString *)labelText postLabelMaxWidth:(CGFloat)postLabelMaxWidth font:(UIFont*)font defaultSpace:(CGFloat)space ;
 +(CGSize)methodCalculateHorizontalSizeWithText:(NSString *)labelText AndLabelHeight:(CGFloat)LabelHeight font:(UIFont*)font;


//set attributedText
+(void)methodSetAttributedText:(UILabel *)label fontsize:(CGFloat)fontsize textcolor:(UIColor*)textcolor range:(NSRange)range;
+(void)methodSetAttributedText:(UILabel *)label space:(float)space;
@end
