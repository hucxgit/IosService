//
//  MethodDevice.h
//  KinkIos
//
//  Created by Vocinno Mac Mini 1 on 15/7/2.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MethodsDevice : NSObject{
}

//根据默认defaultSize 获取当前手机需要的size
+(CGSize)methodDeviceSize:(CGSize)defaultSize;
 
//  系统版本 经纬度
+(NSString *)methodOsVersion;
//手机版本
+(float)methodDeviceVersion;

//手机型号
+(BOOL)methodIsIphone4Or4s;
+(BOOL)methodIsIphone5;
+(BOOL)methodIsIphone6;
+(BOOL)methodIsIphone6plus;

+(NSString*)methodPhoneType;
//手机id
+(NSString *)getUUID;


@end
