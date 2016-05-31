//
//  MethodsFile.m
//  KinkIos
//
//  Created by Vocinno Mac Mini 1 on 15/7/2.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import "MethodsFile.h"

#import "MethodsUtil.h"
#import "MethodsFlexSize.h"

@implementation MethodsFile{
    
}
//根据日期随机文件名字
+(NSString *)methodRandomFileNameByDate{
    //文件名
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    NSString *fileName = [NSString stringWithFormat:@"%.0f%d.png",time,[MethodsUtil methodRandomNumber:1 to:1000]];
    return fileName;
}


//路径相关
+(NSString *)methodDocumentPath:(NSString *)fileName{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory
                                                       , NSUserDomainMask
                                                       , YES);
    return [[paths lastObject] stringByAppendingPathComponent:fileName];
}
+(NSString *)methodLibraryPath:(NSString *)fileName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [[paths lastObject] stringByAppendingPathComponent:fileName];
}
+(NSString *)methodTmpPath:(NSString *)fileName{
    NSString *documentsDirectory=NSTemporaryDirectory();
    return[documentsDirectory stringByAppendingPathComponent:fileName];
}

//获取缓存路径 获取temp路径

//获取路径
+(NSString *)methodLibraryPathCache{
    NSArray *array =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [array lastObject];
}
+(NSString *)methodTmpPath{
    return NSTemporaryDirectory();
}


 //遍历文件夹获得文件夹大小，返回多少M
+(float)methodFolderSizeAtPath:(NSString*)folderPath rule:(float)mRule{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self.class methodFileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(mRule*mRule);
}
//获取文件大小
+ (long long) methodFileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}
//清除文件夹
+(void)methodClearCachesAtPath:(NSString *)folderPath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return;
    
    NSArray *files = [manager subpathsAtPath:folderPath];
    for (NSString *p in files) {
        NSError *error;
        NSString *path = [folderPath stringByAppendingPathComponent:p];
        if ([manager fileExistsAtPath:path]) {
            [manager removeItemAtPath:path error:&error];
        }
    }
    
}



//把文字和图片 合成一张新图片
+(UIImage*)methodCombineImageAndText:(UIImage *)lpImage text:(NSString *)text{
    
       CGImageRef ref = lpImage.CGImage;
    UIImage  *rIcon = [UIImage imageWithCGImage:ref scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    
    UIFont *font = [UIFont systemFontOfSize:12.0];
    CGSize size = [MethodsFlexSize methodCalculateHorizontalSizeWithText:text AndLabelHeight:lpImage.size.height font:font];
    CGFloat w = size.width;
    CGFloat h = size.height;
    CGSize drawSize = CGSizeMake(w + 10, h);
    UIGraphicsBeginImageContextWithOptions(drawSize, 0.0, 2.0);
    
    
    //绘制原始图
    [rIcon drawInRect:CGRectMake(0, 0, drawSize.width, drawSize.height)];
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    /// Set line break mode
    paragraphStyle.lineBreakMode = NSLineBreakByClipping;
    /// Set text alignment
    paragraphStyle.alignment = NSTextAlignmentCenter;
    paragraphStyle.lineSpacing =1.0;
    NSDictionary *attributes = @{ NSFontAttributeName:font,
                                  NSForegroundColorAttributeName:[UIColor whiteColor],
                                  NSParagraphStyleAttributeName: paragraphStyle};
    
    CGRect rect = CGRectMake(0, 0, drawSize.width, drawSize.height);
    // [[UIColor redColor] setFill];
    [text drawInRect:rect withAttributes:attributes];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //渲染
    CGContextStrokePath(context);
    UIImage *resultImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImg;
}

//把文字和图片 合成一张新图片
+(UIImage*)methodCombineImageAndText1:(UIImage *)lpImage text:(NSString *)text{
    text = @"把文字和图片 合成一张新图片";
    
    UIEdgeInsets edge=UIEdgeInsetsMake(8, 8, 13,8);
    UIImage * img= [lpImage resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeTile];
    
    
    //    UIImageWriteToSavedPhotosAlbum(lpImage, nil, nil, nil);
    //    UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil);
    assert(img);
    assert(text);
    
    CGImageRef ref = img.CGImage;
    UIImage  *rIcon = [UIImage imageWithCGImage:ref scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    
    UIFont *font = [UIFont systemFontOfSize:12.0];
    
    CGSize size = [MethodsFlexSize methodCalculateHorizontalSizeWithText:text AndLabelHeight:30 font:font];
    
    CGFloat w = size.width;
    CGFloat h = size.height;
    
    CGSize drawSize = CGSizeMake(w + 20, h);
    
    UIGraphicsBeginImageContextWithOptions(drawSize, 0.0, 2.0);
    
    
    //绘制原始图
    [rIcon drawInRect:CGRectMake(0, 0, drawSize.width, drawSize.height)];
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    /// Set line break mode
    paragraphStyle.lineBreakMode = NSLineBreakByClipping;
    /// Set text alignment
    paragraphStyle.alignment = NSTextAlignmentCenter;
    paragraphStyle.lineSpacing =1.0;
    NSDictionary *attributes = @{ NSFontAttributeName:font,
                                  NSForegroundColorAttributeName:[UIColor whiteColor],
                                  NSParagraphStyleAttributeName: paragraphStyle};
    
    CGRect rect = CGRectMake(0, 0, drawSize.width, drawSize.height);
    // [[UIColor redColor] setFill];
    [text drawInRect:rect withAttributes:attributes];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //渲染
    CGContextStrokePath(context);
    UIImage *resultImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImg;
}

-(UIImage*) OriginImage:(UIImage *)image;
{
    UIEdgeInsets edge=UIEdgeInsetsMake(8, 8, 13,8);
    UIImage * img= [image resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeStretch];
    

    
        return  img;   //返回的就是已经改变的图片
}

@end
