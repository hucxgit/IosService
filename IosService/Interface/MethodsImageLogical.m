//
//  MethodsImageLogical.m
//  Service
//
//  Created by Michael Tseng on 15/8/3.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import "MethodsImageLogical.h"
#import "MethodsDevice.h"

@implementation MethodsImageLogical

//缩放到指定大小
+(UIImage *)ExtendimageToCutSize:(UIImage *)image cutSize:(CGSize)cutSize{
    CGFloat width = cutSize.width;
    CGFloat height = cutSize.height;
    NSLog(@"----------------width=%f height=%f",width,height);
    CGRect rect =CGRectMake(0, 0, width, height);
    CGSize reallySize = rect.size;
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(reallySize);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();//获取当前quartz 2d绘图环境
    CGContextClipToRect( currentContext, rect);//设置当前绘图环境到矩形框
    //CGContextRotateCTM(currentContext, M_PI);
    // 绘制改变大小的图片
    [image drawInRect:rect];
    //CGContextDrawImage(currentContext, rect, image.CGImage);//绘图
    // 从当前context中创建一个改变大小后的图片
    UIImage* extendImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return extendImage;
}


//根据with 等比缩放
+(UIImage *)ExtendimageByWith:(UIImage *)image w:(float)w{
    float radio = 1;
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    
    NSLog(@"----------------width=%f height=%f",width,height);
    
    if (width > w ) {
        radio = w / width;
    }else{
        return image;
    }
    
    
    width = (NSInteger) width*radio;
    height = (NSInteger) height*radio;
    //NSLog(@" width = %f  height =%f",width,height);
    CGRect rect =CGRectMake(0, 0, width, height);
    CGSize reallySize = rect.size;
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(reallySize);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();//获取当前quartz 2d绘图环境
    CGContextClipToRect( currentContext, rect);//设置当前绘图环境到矩形框
    //CGContextRotateCTM(currentContext, M_PI);
    // 绘制改变大小的图片
    [image drawInRect:rect];
    //CGContextDrawImage(currentContext, rect, image.CGImage);//绘图
    // 从当前context中创建一个改变大小后的图片
    UIImage* extendImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return extendImage;
}

//根据rect 等比缩放
+(UIImage *)Extendimage:(UIImage *)image cutSize:(CGSize)cutSize{
    float radio = 1;
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    if (width >= cutSize.width && height >=cutSize.height) {
        CGFloat f1 =cutSize.width / width;
        CGFloat f2 = cutSize.height / height;
        radio = f1 > f2 ? f1 : f2;
    }else if(width < cutSize.width && height >= cutSize.height){
        //宽小
        radio = cutSize.width / width;
    }else if(width >= cutSize.width && height < cutSize.height){
        //高度小
        radio = cutSize.height / height;
    }else{
        //宽高都小
        CGFloat f1 =cutSize.width / width;
        CGFloat f2 = cutSize.height / height;
        radio = f1 > f2 ? f1 : f2;
    }
    width = (NSInteger) width*radio;
    height = (NSInteger) height*radio;
    NSLog(@"----------------width=%f height=%f",width,height);
    //NSLog(@" width = %f  height =%f",width,height);
    CGRect rect =CGRectMake(0, 0, width, height);
    CGSize reallySize = rect.size;
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(reallySize);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();//获取当前quartz 2d绘图环境
    CGContextClipToRect( currentContext, rect);//设置当前绘图环境到矩形框
    //CGContextRotateCTM(currentContext, M_PI);
    // 绘制改变大小的图片
    [image drawInRect:rect];
    //CGContextDrawImage(currentContext, rect, image.CGImage);//绘图
    // 从当前context中创建一个改变大小后的图片
    UIImage* extendImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return extendImage;
}
+(UIImage *)Extendimage:(UIImage *)image cutSize:(CGSize)cutSize mixHeight:(NSInteger)mixHeight{
    float radio = 1;
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    if (width >= cutSize.width && height >=cutSize.height) {
        CGFloat f1 = width / cutSize.width;
        CGFloat f2 = height / cutSize.height;
        
        
        radio = f1 > f2 ? f1 : f2;
        width = (NSInteger) width/radio;
        height = (NSInteger) height/radio;
        
        //special
        if (height < mixHeight) {
            radio = height / mixHeight;
            
            width = (NSInteger) width/radio;
            height = (NSInteger) height/radio;
        }
        
        
        
    }else if(width < cutSize.width && height >= cutSize.height){
        //宽小
        radio = height / cutSize.height;
        
        width = (NSInteger) width/radio;
        height = (NSInteger) height/radio;
        
        //special
        if (height < mixHeight) {
            //never execute
            radio = height / mixHeight;
            
            width = (NSInteger) width/radio;
            height = (NSInteger) height/radio;
        }
        
    }else if(width >= cutSize.width && height < cutSize.height){
        //高度小
        radio = width / cutSize.width;
        
        width = (NSInteger) width/radio;
        height = (NSInteger) height/radio;
        
        //special
        if (height < mixHeight) {
            //never execute
            radio = height / mixHeight;
            
            width = (NSInteger) width/radio;
            height = (NSInteger) height/radio;
        }
        
    }else{
        //宽高都小
        if (height < mixHeight) {
            //never execute
            radio = height / mixHeight;
            
            width = (NSInteger) width/radio;
            height = (NSInteger) height/radio;

        }else{
            
        }
     
    }
//    width = (NSInteger) width*radio;
//    height = (NSInteger) height*radio;
    NSLog(@"----------------width=%f height=%f",width,height);
    //NSLog(@" width = %f  height =%f",width,height);
    CGRect rect =CGRectMake(0, 0, width, height);
    CGSize reallySize = rect.size;
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(reallySize);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();//获取当前quartz 2d绘图环境
    CGContextClipToRect( currentContext, rect);//设置当前绘图环境到矩形框
    //CGContextRotateCTM(currentContext, M_PI);
    // 绘制改变大小的图片
    [image drawInRect:rect];
    //CGContextDrawImage(currentContext, rect, image.CGImage);//绘图
    // 从当前context中创建一个改变大小后的图片
    UIImage* extendImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return extendImage;
}
//截取屏幕
+(UIImage *)screenShot:(UIView *)_view{
    //UIGraphicsBeginImageContext(_view.bounds.size);     //currentView 当前的view  创建一个基于位图的图形上下文并指定大小为
    UIGraphicsBeginImageContextWithOptions(_view.bounds.size,NO,[UIScreen mainScreen].scale);
    [_view.layer renderInContext:UIGraphicsGetCurrentContext()];//renderInContext呈现接受者及其子范围到指定的上下文
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();//返回一个基于当前图形上下文的图片
    UIGraphicsEndImageContext();//移除栈顶的基于当前位图的图形上下文
    return viewImage;
}
//截取范围
+(UIImage *)subImage:(UIImage *)oriImage rect:(CGRect)rect{
    UIImage *image2 =[UIImage imageWithCGImage:CGImageCreateWithImageInRect([oriImage CGImage], rect) scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    //UIImageWriteToSavedPhotosAlbum(image2, self, nil, nil);
    return image2;
}
//把图片向右旋转90度
+(UIImage *)rotateImage:(UIImage *)lpImage{
    UIGraphicsBeginImageContext(lpImage.size);
    [lpImage drawInRect:CGRectMake(0, 0, lpImage.size.width, lpImage.size.height)];
    lpImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return lpImage;
}


//截取image
+(UIImage *)getPartOfImage:(UIImage *)img rect:(CGRect)partRect
{
    CGImageRef imageRef = img.CGImage;
    CGImageRef imagePartRef = CGImageCreateWithImageInRect(imageRef, partRect);
    UIImage *retImg = [UIImage imageWithCGImage:imagePartRef];
    CGImageRelease(imagePartRef);
    return retImg;
}

//只缩放 只裁剪 size 已经是等比的尺寸
+(UIImage *)scaleImageToSize:(UIImage *)image size:(CGSize)size{
   
    CGFloat scale = [UIScreen mainScreen].scale;
    //NSLog(@" width = %f  height =%f",width,height);
    CGRect rect =CGRectMake(0, 0, size.width*scale, size.height*scale);
    CGSize reallySize = rect.size;
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(reallySize);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();//获取当前quartz 2d绘图环境
    CGContextClipToRect( currentContext, rect);//设置当前绘图环境到矩形框
    //CGContextRotateCTM(currentContext, M_PI);
    // 绘制改变大小的图片
    [image drawInRect:rect];
    //CGContextDrawImage(currentContext, rect, image.CGImage);//绘图
    // 从当前context中创建一个改变大小后的图片
    UIImage* extendImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    
    //to do delete
    UIImageWriteToSavedPhotosAlbum(extendImage, self, nil, nil);
    
    return extendImage;

}
+(UIImage *)cutImageToSize:(UIImage *)image width:(CGFloat)w height:(CGFloat)h{
    CGFloat scale = [UIScreen mainScreen].scale;
    
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    
    CGFloat x = (width - w)/2;
    CGFloat y = (height - h)/2;
    CGRect rect = CGRectMake(x, y, w*scale, h*scale);
    UIImage *image2 =[UIImage imageWithCGImage:CGImageCreateWithImageInRect([image CGImage], rect) scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    
    //to do delete
    UIImageWriteToSavedPhotosAlbum(image2, self, nil, nil);
    
    return image2;
}

//合成图片
+(UIImage *)compose:(UIImage *)oriImage shuiYin:(UIImage *)shuiYinImage position:(ShuiYinPosition)position offset:(CGFloat)offset{
    CGFloat scale = [UIScreen mainScreen].scale;
    
    
   CGSize size = CGSizeMake(oriImage.size.width * scale, oriImage.size.height * scale);
    UIGraphicsBeginImageContext(size);
    // Draw image1
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    [oriImage drawInRect:rect];
    // Draw image2
    switch (position) {
        case ShuiYinPositionLeft:
            rect = CGRectMake(offset, (rect.size.height - shuiYinImage.size.height*scale)/2.0, shuiYinImage.size.width*scale, shuiYinImage.size.height*scale);
            break;
        case ShuiYinPositionRight:
            rect = CGRectMake(rect.size.width - shuiYinImage.size.width*scale - offset, (rect.size.height - shuiYinImage.size.height*scale)/2.0, shuiYinImage.size.width*scale, shuiYinImage.size.height*scale);
            break;
        case ShuiYinPositionTop:
            rect = CGRectMake((rect.size.width - shuiYinImage.size.width*scale)/2.0, offset, shuiYinImage.size.width*scale, shuiYinImage.size.height*scale);
            break;
        case ShuiYinPositionBottom:
            rect = CGRectMake((rect.size.width - shuiYinImage.size.width*scale)/2.0, rect.size.height-shuiYinImage.size.height*scale-offset, shuiYinImage.size.width*scale, shuiYinImage.size.height*scale);
            break;
        default:
            break;
    }
    
    [shuiYinImage drawInRect:rect];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultingImage;
}

@end
