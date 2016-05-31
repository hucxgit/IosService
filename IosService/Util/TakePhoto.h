//
//  TakePhoto.h
//  测试相机
//
//  Created by 胡长兴 on 14-6-24.
//  Copyright (c) 2014年 沃而乐信息科技有限公司. All rights reserved.
//


#import <UIKit/UIKit.h>


//获取图片返回结果
typedef void (^BlockGetImageResult)(BOOL isCancel,
                                    UIImagePickerController *picker,
                                    NSString *path);


@interface TakePhoto : NSObject <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    @private
        __weak id m_delegate;
        __weak UIViewController* m_lpController;
  
}

@property(nonatomic,copy)BlockGetImageResult blockGetImageResult;
//@property(nonatomic,retain) NSString* m_lpFileName;

-(id)initWithDelegate:(id)_delegate Controller:(UIViewController*)_lpController;
-(void)setABlockGetImageResult:(BlockGetImageResult)blockGetImageResult;
-(void)takePhotoFromCameraWithId:(id)_id;
-(void)takePhotoFromAlbumWithId:(id)_id;
 

@end
