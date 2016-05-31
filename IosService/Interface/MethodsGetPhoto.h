//
//  MethodsGetPhoto.h
//  Service
//
//  Created by Michael Tseng on 15/7/15.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZYQAssetPickerController.h"
#import "GetPhotoByCameraAndAblum.h"

//获取图片返回结果
typedef void (^BlockFinalImageResult)(NSArray *vImageArray);


@interface MethodsGetPhoto : NSObject{
    __weak UIViewController* vSelfController;
}

@property(nonatomic,copy)BlockFinalImageResult finalImageResult;
//最终获取结果
-(void)mSetAFinalImageResultBlock:(BlockFinalImageResult)finalImageResult;

//初始化
-(id)initWithController:(UIViewController *)_vSelfController;
-(void)mGetFinalImageResultWithType:(int)type;



@end
