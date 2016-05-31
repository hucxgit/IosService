//
//  MethodDevice.m
//  KinkIos
//
//  Created by Vocinno Mac Mini 1 on 15/7/2.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import "MethodsDevice.h"

#import "sys/utsname.h"
#import "KeychainItemWrapper.h"

@implementation MethodsDevice{
}


//根据默认defaultSize 获取当前手机需要的size
+(CGSize)methodDeviceSize:(CGSize)defaultSize{
    CGFloat cScale = [UIScreen mainScreen].scale;
    CGFloat rate = [UIScreen mainScreen].bounds.size.width * cScale / 640;
    return CGSizeMake(rate * defaultSize.width, rate * defaultSize.height);
}


//获取当前设备版本号
+(NSString *)methodOsVersion {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * deviceString = [NSString stringWithCString:systemInfo.machine
                                                 encoding:NSUTF8StringEncoding];
    
    return deviceString;
}
//手机版本
+(float)methodDeviceVersion{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

//暂时不用 都用屏幕分辨率来判断
+(BOOL)isIphone4{
    // NSString * strModel  = [UIDevice currentDevice].model;
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * deviceString = [NSString stringWithCString:systemInfo.machine
                                                 encoding:NSUTF8StringEncoding];
    
    NSLog(@"deviceString = %@",deviceString);
    if ([deviceString isEqualToString:@"iPhone3,1"]
        || [deviceString isEqualToString:@"iPhone3,2"]
        || [deviceString isEqualToString:@"iPhone4,1"]) {
        return YES;
    }
    
    return NO;

}

//手机型号
+(BOOL)methodIsIphone4Or4s{
    CGRect bounds = [UIScreen mainScreen].bounds;
    CGFloat scale = [UIScreen mainScreen].scale;
    return (bounds.size.height * scale == 960.0 && bounds.size.width * scale == 640.0) ? YES :NO;

}
+(BOOL)methodIsIphone5{
    CGRect bounds = [UIScreen mainScreen].bounds;
    CGFloat scale = [UIScreen mainScreen].scale;
    return (bounds.size.height * scale == 1136.0 && bounds.size.width * scale == 640.0) ? YES :NO;

}
+(BOOL)methodIsIphone6{
    CGRect bounds = [UIScreen mainScreen].bounds;
    CGFloat scale = [UIScreen mainScreen].scale;
    return (bounds.size.height * scale == 1334.0 && bounds.size.width * scale == 750.0) ? YES :NO;

}
+(BOOL)methodIsIphone6plus{
    CGRect bounds = [UIScreen mainScreen].bounds;
    CGFloat scale = [UIScreen mainScreen].scale;
    return (bounds.size.height*scale == 2208.0 && bounds.size.width*scale == 1242.0) ? YES :NO;;
}

+(NSString*)getUUID{
        KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"UUID"                                                                  accessGroup:nil];
        NSString *result = nil;
        NSString *uuidStr = [wrapper objectForKey:(__bridge id)kSecAttrService];
        if (uuidStr.length == 0) {
            //NSString *myUUIDStr = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
            
            CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
            NSString *myUUIDStr = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
            
            [wrapper setObject:myUUIDStr forKey:(__bridge id)kSecAttrService];
            result = myUUIDStr;
        }
        else{
            result = uuidStr;
        }
        
        NSLog(@"result udid=%@",result);
        return result;
}

+(NSString*)methodPhoneType {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5c";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5c";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6p";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6sp";
  
    return deviceString;
}










@end
