//
//  MethodsFile.h
//  KinkIos
//
//  Created by Vocinno Mac Mini 1 on 15/7/2.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MethodsFile : NSObject
{
}
//根据日期随机文件名字
+(NSString *)methodRandomFileNameByDate;

//路径相关
+(NSString *)methodDocumentPath:(NSString *)fileName;
+(NSString *)methodLibraryPath:(NSString *)fileName;
+(NSString *)methodTmpPath:(NSString *)fileName;

//获取路径
+(NSString *)methodLibraryPathCache;
+(NSString *)methodTmpPath;

+(float)methodFolderSizeAtPath:(NSString*)folderPath rule:(float)mRule;
//获取文件大小
+ (long long) methodFileSizeAtPath:(NSString*) filePath;

//清除文件夹
+(void)methodClearCachesAtPath:(NSString *)folderPath;


//把文字和图片 合成一张新图片
+(UIImage*)methodCombineImageAndText:(UIImage *)lpImage text:(NSString *)text;

@end
