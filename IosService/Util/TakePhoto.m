//
//  TakePhoto.m
//  测试相机
//
//  Created by 胡长兴 on 14-6-24.
//  Copyright (c) 2014年 沃而乐信息科技有限公司. All rights reserved.
//

#import "TakePhoto.h"
#import "MethodsFile.h"
#import "MethodsImageLogical.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
@implementation TakePhoto


-(id)initWithDelegate:(id)_delegate Controller:(UIViewController*)_lpController{
    assert (_lpController);
    assert (_delegate);
 
    self = [super init];
    if (self)
    {
        NSLog(@"TakePhoto %s",__func__);
        m_lpController = _lpController;
        m_delegate = _delegate;
 
    }
    return self;
}

//
-(void)setABlockGetImageResult:(BlockGetImageResult)blockGetImageResult{
    self.blockGetImageResult = blockGetImageResult;
}

-(void)dealloc
{
    NSLog(@"TakePhoto %s",__func__);
    m_lpController = nil;
 
}

-(void)takePhotoFromCameraWithId:(id)_id
{
    NSLog(@"TakePhoto %s",__func__);
    UIImagePickerControllerSourceType type = UIImagePickerControllerSourceTypePhotoLibrary;
    
    if([UIImagePickerController isSourceTypeAvailable:type]){
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            type = UIImagePickerControllerSourceTypeCamera;
        }
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.allowsEditing = YES;
        picker.delegate   = self;
        picker.sourceType = type;
        [m_lpController presentViewController:picker animated:YES completion:nil];
    }
    
    
   
}


-(void)takePhotoFromAlbumWithId:(id)_id
{
    NSLog(@"TakePhoto %s",__func__);
     UIImagePickerControllerSourceType type = UIImagePickerControllerSourceTypePhotoLibrary;
    
    if([UIImagePickerController isSourceTypeAvailable:type]){
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
            type = UIImagePickerControllerSourceTypePhotoLibrary;
        }else if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum] ){
            type = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        }
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        picker.allowsEditing = NO;
        picker.delegate   = self;
        picker.sourceType = type;
        
        
        [m_lpController presentViewController:picker animated:YES completion:nil];
    }
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
 	
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"AAAAA");
            UIImage* lpImage = [info objectForKey:UIImagePickerControllerOriginalImage];
            //lpImage  = [MethodsImageLogical Extendimage:lpImage cutSize:CGSizeMake(WIDTH * 0.95,WIDTH * 0.95 * lpImage.size.height / lpImage.size.width)];
        
            lpImage = [MethodsImageLogical ExtendimageByWith:lpImage w:WIDTH*[UIScreen mainScreen].scale];
            //lpImage = [MethodsImageLogical ExtendimageByWith:lpImage w:WIDTH];
            NSLog(@"screen width scale %f", [UIScreen mainScreen].scale);
            NSLog(@"screen width %f", WIDTH);
            NSLog(@"screen width %f",WIDTH * [UIScreen mainScreen].scale);
        
            NSData *data = UIImagePNGRepresentation(lpImage);
            NSString *fileName = [MethodsFile  methodLibraryPathCache];
            fileName = [MethodsFile  methodRandomFileNameByDate];
 
            NSString *path =   [MethodsFile  methodTmpPath:fileName];
            [data writeToFile:path atomically:YES];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"BBBBB");
               self.blockGetImageResult(NO,picker,path);
            });
  });
}
 
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"TakePhoto %s",__func__);
     self.blockGetImageResult(YES,picker,nil);
        
}



@end
