//
//  MethodsDataTime.h
//  KinkIos
//
//  Created by Vocinno Mac Mini 1 on 15/7/1.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import <Foundation/Foundation.h>
 
@interface MethodsDateTime : NSObject{
}

//格式化时间
+(NSString *)methodToString:(NSDate *)date formatType:(int)formatType;
+(NSDate *)methodToDate:(NSString *)str formatType:(int)formatType;

//获取当前时间
+(NSString *)getCurrentTime;

//根据毫秒数（时间戳） 获取时间描述
+(NSString *)getTimeDescription:(double)ms;
+(NSString *)getTimeThreeDescription:(double)ms;
+(NSDate *)hourOfToday:(NSString*)hour;
+(NSDate *)hourOfAfterToday:(NSString*)hour;
+(NSString *)formatTimeWithTimeInterval:(NSTimeInterval)timeInterval;
+(NSDateComponents *)dateComponent:(double)ms;

+(BOOL)compareSameDay:(double)milseconds otherDate:(double)othermilseconds;

@end
