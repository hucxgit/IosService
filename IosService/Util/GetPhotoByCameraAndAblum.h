//
//  GetPhotoByCameraAndAblum.h
//  Service
//
//  Created by Michael Tseng on 15/7/16.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZYQAssetPickerController.h"

typedef enum MethodsGetPhotoType{
    MethodsGetPhotoType_camera,
    MethodsGetPhotoType_album,
}MethodsGetPhotoType;

//获取图片返回结果
typedef void (^BlockGetImageResult)(NSArray *vImageArray);

@interface GetPhotoByCameraAndAblum : NSObject<UINavigationControllerDelegate,UIImagePickerControllerDelegate,ZYQAssetPickerControllerDelegate>{
    __weak id vDelegate;
    __weak UIViewController* vController;
}
@property(nonatomic,copy)BlockGetImageResult blockGetImageResult;
-(void)setABlockGetImageResult:(BlockGetImageResult)blockGetImageResult;
-(id)initWithDelegate:(id)delegate controller:(UIViewController*)controller;
-(void)mGetPhotoResouse:(MethodsGetPhotoType)type;
@end
