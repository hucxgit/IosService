//
//  DateTimeUtil.m
//  KinkIos
//
//  Created by Vocinno Mac Mini 1 on 15/3/24.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import "DateTimeUtil.h"


#define TIME_MINUTE_IN_SECOND 60
#define TIME_HOUR_IN_SECOND  3600
#define TIME_DAY_IN_SECOND  86400
#define TIME_WEEK_IN_SECOND  604800



@implementation DateTimeUtil{

}
//根据毫秒数 获取时间描述
+(NSString *)getTimeDescription:(double)ms{
    
    NSString *result = nil;
    
    //计算出服务器返回时间
    NSTimeInterval serverSecond = ms / 1000;
    //计算出当前时间
    
    
    //NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //和格林尼治时间差
   // NSInteger timeOff = [zone secondsFromGMT];
    //视察转化
  //  NSDate *timeOffDate = [[NSDate date] dateByAddingTimeInterval:timeOff];
    NSTimeInterval curSecond = [[NSDate date] timeIntervalSince1970];
    
    double dateTime = curSecond - serverSecond;
    if (dateTime > TIME_WEEK_IN_SECOND) {
        //转换成日期
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:serverSecond];
        result = [self toString:date fromType:TO_DATA_TYPE_B];
        
    }else if (dateTime > TIME_DAY_IN_SECOND){
        //转换成天
        result = [NSString stringWithFormat:@"%.0f天前",dateTime/TIME_DAY_IN_SECOND];
    }else if(dateTime > TIME_HOUR_IN_SECOND){
        //转为小时
        result = [NSString stringWithFormat:@"%.0f小时前",dateTime/TIME_HOUR_IN_SECOND];
    }else if(dateTime > TIME_MINUTE_IN_SECOND){
        //转为分
        result = [NSString stringWithFormat:@"%.0f分钟前",dateTime/TIME_MINUTE_IN_SECOND];
    }else{
        
        //转为秒
        if (dateTime < 1 && dateTime >=0){
            dateTime = 1;
        }
        result = [NSString stringWithFormat:@"%.0f秒钟前",dateTime];
    }
   return result;
}

+(NSString *)getTimeThreeDescription:(double)ms{
    NSString *result = nil;
    
    //计算出服务器返回时间
    NSTimeInterval serverSecond = ms / 1000;
    //计算出当前时间
    
    
    //NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //和格林尼治时间差
    // NSInteger timeOff = [zone secondsFromGMT];
    //视察转化
    //  NSDate *timeOffDate = [[NSDate date] dateByAddingTimeInterval:timeOff];
    NSTimeInterval curSecond = [[NSDate date] timeIntervalSince1970];
    
    double dateTime = curSecond - serverSecond;
    if (dateTime > TIME_DAY_IN_SECOND){
        //转换成天
        //转换成日期
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:serverSecond];
        result = [self toString:date fromType:TO_DATA_TYPE_G];
        
    }else if(dateTime > TIME_HOUR_IN_SECOND){
        //转为小时
        result = [NSString stringWithFormat:@"%.0f小时前",dateTime/TIME_HOUR_IN_SECOND];
    }else if(dateTime > TIME_MINUTE_IN_SECOND){
        //转为分
        result = [NSString stringWithFormat:@"%.0f分钟前",dateTime/TIME_MINUTE_IN_SECOND];
    }else{
        
        //转为秒
        if (dateTime < 1 && dateTime >=0){
            dateTime = 1;
        }
        result = [NSString stringWithFormat:@"%.0f秒钟前",dateTime];
    }
    return result;
}


//格式日期
+(NSString *)toString:(NSDate*)date fromType:(int)fromType{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    switch (fromType) {
        case TO_DATA_TYPE_A:
            [dateFormat setDateFormat:@"yyyy年MM月dd日 HH:MM"];
            break;
        case TO_DATA_TYPE_B:
            [dateFormat setDateFormat:@"yyyy-MM-dd HH:MM"];
            break;
        case TO_DATA_TYPE_C:
            [dateFormat setDateFormat:@"yyyy/MM/dd HH:MM"];
            break;
        case TO_DATA_TYPE_D:
            [dateFormat setDateFormat:@"yyyy@@MM@@dd HH:MM"];
            break;
        case TO_DATA_TYPE_E:
            [dateFormat setDateFormat:@"MM/dd"];
            break;
        case TO_DATA_TYPE_F:
            [dateFormat setDateFormat:@"yyyy-MM-dd HH:MM:ss"];
            break;
        case TO_DATA_TYPE_G:
            [dateFormat setDateFormat:@"yyyy.MM.dd"];
            break;
        case TO_DATA_TYPE_H:
            [dateFormat setDateFormat:@"HH:mm"];
            break;
        case TO_DATA_TYPE_I:
            [dateFormat setDateFormat:@"MM-dd HH:mm"];
            break;
         default:
            break;
     }
        NSString * dateStr = [dateFormat stringFromDate:date];
        return dateStr;

}


+(NSDate *)toDate:(NSString *)str fromType:(int)fromType{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
 
    switch (fromType) {
        case TO_DATA_TYPE_A:
            [dateFormat setDateFormat:@"yyyy年MM月dd日"];
            break;
        case TO_DATA_TYPE_B:
            [dateFormat setDateFormat:@"yyyy-MM-dd"];
            break;
        case TO_DATA_TYPE_C:
            [dateFormat setDateFormat:@"yyyy/MM/dd"];
            break;
        case TO_DATA_TYPE_D:
            [dateFormat setDateFormat:@"yyyy@@MM@@dd"];
            break;
        case TO_DATA_TYPE_E:
            [dateFormat setDateFormat:@"MM/dd"];
            break;
        case TO_DATA_TYPE_F:
            [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            break;
        default:
            break;
    }
    
    
  //  dateFormat.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    NSDate *date = [dateFormat dateFromString:str];
    return date;
}


+(NSString *)getCuttentTime{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    NSLog(@"locationString:%@",locationString);
    return locationString;
}



@end
