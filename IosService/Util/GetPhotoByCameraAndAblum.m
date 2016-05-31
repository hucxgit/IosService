//
//  GetPhotoByCameraAndAblum.m
//  Service
//
//  Created by Michael Tseng on 15/7/16.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import "GetPhotoByCameraAndAblum.h"
#import "MethodsImageLogical.h"
#import "MethodsDevice.h"

#define DEF_SCREEN_SCALE 0.6 //高比宽 450 ＊ 750
#define DEF_SCREEN_WIDTH_45 640
#define DEF_SCREEN_WIDTH_6 750
#define DEF_SCREEN_WIDTH_6P 1242

@implementation GetPhotoByCameraAndAblum{

}

-(id)initWithDelegate:(id)delegate controller:(UIViewController*)controller{
    self = [super init];
    if (self)
    {
        vController = controller;
        vDelegate = delegate;
    }
    return self;
}

-(void)mGetPhotoResouse:(MethodsGetPhotoType)type
{
    if (type == MethodsGetPhotoType_camera ){
        [self mTakePhotoFromCamera];
    }else if (type == MethodsGetPhotoType_album){
        [self mTakePhotoFromAlbum];
    }
}
//相册
-(void)mTakePhotoFromAlbum{
     ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc] init];
     picker.maximumNumberOfSelection = 200;  //最多可以选择多少张图片
     picker.assetsFilter = [ALAssetsFilter allPhotos];
     picker.showEmptyGroups=NO;
     picker.delegate=self;
     picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
     if ([[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyType] isEqual:ALAssetTypeVideo]) {
     NSTimeInterval duration = [[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyDuration] doubleValue];
     return duration >= 5;
     } else {
     return YES;
     }
     }];
     [vController presentViewController:picker animated:YES completion:NULL];
}
#pragma mark - ZYQAssetPickerControllerDelegate
-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets{
    NSMutableArray *array = [NSMutableArray  arrayWithCapacity:0];
    for (int i=0; i<assets.count; i++) {
        ALAsset *asset=assets[i];
        UIImage *tempImg=[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
        tempImg = [self imageLogical:tempImg];
        [array  addObject:tempImg];
    }
    self.blockGetImageResult(array);
}

//相机
-(void)mTakePhotoFromCamera{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.delegate = self;
    [vController presentViewController:picker animated:YES completion:nil];
}
#pragma mark - UIImagePickerControllerDelegate
//选取照片后的回调
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *lpImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        UIImageOrientation imageOrientation=lpImage.imageOrientation;
        if(imageOrientation!=UIImageOrientationUp) {
            NSLog(@"001:竖着，home 键在下方，002:手机水平放，home在右边，这两种情况下，图片向左旋转啦90度");
            //图片会向左转90度的现象，下面代码把图片顺时针旋转90度
            lpImage = [MethodsImageLogical rotateImage:lpImage];
        }
        UIImage *currNewImage = [self imageLogical:lpImage];
        NSArray *array = [NSArray  arrayWithObject:currNewImage];
        self.blockGetImageResult(array);
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

//对图片进行压缩和剪切
-(UIImage *)imageLogical:(UIImage *)lpImage{
    CGSize newImageSize;
    CGFloat widthTemp;
    UIImage *currNewImage;
    if ([MethodsDevice methodIsIphone4Or4s] || [MethodsDevice methodIsIphone5]){
        newImageSize = CGSizeMake(DEF_SCREEN_WIDTH_45, DEF_SCREEN_WIDTH_45*DEF_SCREEN_SCALE);
        widthTemp = DEF_SCREEN_WIDTH_45;
    }else if ([MethodsDevice methodIsIphone6]){
        newImageSize = CGSizeMake(DEF_SCREEN_WIDTH_6, DEF_SCREEN_WIDTH_6*DEF_SCREEN_SCALE);
        widthTemp = DEF_SCREEN_WIDTH_6;
    }else if ([MethodsDevice methodIsIphone6plus]){
        newImageSize = CGSizeMake(DEF_SCREEN_WIDTH_6P, DEF_SCREEN_WIDTH_6P*DEF_SCREEN_SCALE);
        widthTemp = DEF_SCREEN_WIDTH_6P;
    }
    
    currNewImage = [MethodsImageLogical Extendimage:lpImage cutSize:newImageSize]; //等比压缩
    NSLog(@"-----tempImg.frame--002--%@",NSStringFromCGSize(currNewImage.size));
    currNewImage = [MethodsImageLogical getPartOfImage:currNewImage rect:CGRectMake(0, (currNewImage.size.height - widthTemp*DEF_SCREEN_SCALE)/2, widthTemp, widthTemp*DEF_SCREEN_SCALE)]; //根据屏幕宽度为定值，裁剪图片
    return currNewImage;
}
 
//取消
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//传值
-(void)setABlockGetImageResult:(BlockGetImageResult)blockGetImageResult{
    self.blockGetImageResult = blockGetImageResult;
}


@end
