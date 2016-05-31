//
//  MethodsImageLogical.h
//  Service
//
//  Created by Michael Tseng on 15/8/3.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ShuiYinPosition) {
    ShuiYinPositionLeft,
    ShuiYinPositionRight,
    ShuiYinPositionTop,
    ShuiYinPositionBottom,
//    ShuiYinPositionLeftTop,
//    ShuiYinPositionRightTop,
//    ShuiYinPositionLeftBottom,
//    ShuiYinPositionRightBottom,
 
};

@interface MethodsImageLogical : NSObject

//缩放到指定大小
+(UIImage *)ExtendimageToCutSize:(UIImage *)image cutSize:(CGSize)cutSize;


+(UIImage *)ExtendimageByWith:(UIImage *)image w:(float)w;
//根据rect 等比缩放
+(UIImage *)Extendimage:(UIImage *)image cutSize:(CGSize)cutSize;
//根据rect 等比缩放 指定最小高度
+(UIImage *)Extendimage:(UIImage *)image cutSize:(CGSize)cutSize mixHeight:(NSInteger)mixHeight;
//截屏幕
+(UIImage *)screenShot:(UIView *)_view;
//截取范围
+(UIImage *)subImage:(UIImage *)oriImage rect:(CGRect)rect;
//截取image
+(UIImage *)getPartOfImage:(UIImage *)img rect:(CGRect)partRect;
//旋转图片
+(UIImage *)rotateImage:(UIImage *)lpImage;

///
+(UIImage *)cutImageToSize:(UIImage *)image width:(CGFloat)w height:(CGFloat)h;
+(UIImage *)scaleImageToSize:(UIImage *)image size:(CGSize)size;

//合成图片
+(UIImage *)compose:(UIImage *)oriImage shuiYin:(UIImage *)shuiYinImage position:(ShuiYinPosition)position offset:(CGFloat)offset;


@end
