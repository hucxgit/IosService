//
//  MethodsGetPhoto.m
//  Service
//
//  Created by Michael Tseng on 15/7/15.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.


#import "MethodsGetPhoto.h"

@implementation MethodsGetPhoto{
    GetPhotoByCameraAndAblum *getPhotoByCameraAndAblum;
}
-(id)initWithController:(UIViewController *)_vSelfController{
    self = [super init];
    if (self) {
        vSelfController = _vSelfController;
    }
    return self;
}

//外部调用，来区分使用什么类型获取图片
-(void)mGetFinalImageResultWithType:(int)type{
    if (type == MethodsGetPhotoType_camera){
        [self  mGetImageByType:MethodsGetPhotoType_camera];
    }else if (type == MethodsGetPhotoType_album){
        [self  mGetImageByType:MethodsGetPhotoType_album];
    }
}

//使用照片或者相机来获取image
-(void)mGetImageByType:(MethodsGetPhotoType)type{
    __weak typeof(self) blockSelf = self;
    if (getPhotoByCameraAndAblum == nil){
        getPhotoByCameraAndAblum = [[GetPhotoByCameraAndAblum alloc] initWithDelegate:self controller:vSelfController];
    }
    [getPhotoByCameraAndAblum  mGetPhotoResouse:type];
    [getPhotoByCameraAndAblum setABlockGetImageResult:^(NSArray *vImageArray) {
        //得到图片数组
        blockSelf.finalImageResult(vImageArray);
    } ];
    
}

//获取结果
-(void)mSetAFinalImageResultBlock:(BlockFinalImageResult)finalImageResult{
    
    self.finalImageResult = finalImageResult;
}
@end
