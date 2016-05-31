//
//  MethodsDataTime.m
//  KinkIos
//
//  Created by Vocinno Mac Mini 1 on 15/7/1.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import "MethodsDateTime.h"
#import "DateTimeUtil.h"
static float sfSecondsOfDay = 60 * 60 * 24;
static float sfSecondsOfHour = 60 * 60;
static float sfSecondsOfMinute = 60;

@implementation MethodsDateTime{
}

//格式化时间
+(NSString *)methodToString:(NSDate *)date formatType:(int)formatType{
    return [DateTimeUtil toString:date fromType:formatType];
}
+(NSDate *)methodToDate:(NSString *)str formatType:(int)formatType{
    return [DateTimeUtil toDate:str fromType:formatType];
}

+(NSString *)getCurrentTime
{
    return [DateTimeUtil getCuttentTime];
}


//根据毫秒数 获取时间描述
+(NSString *)getTimeDescription:(double)ms{
    return [DateTimeUtil getTimeDescription:ms];
}
+(NSString *)getTimeThreeDescription:(double)ms{
    return [DateTimeUtil getTimeThreeDescription:ms];
}
+(NSDate *)hourOfToday:(NSString*)hour{
    NSDateComponents *comps = [self.class dateComponent:[[NSDate  date] timeIntervalSince1970]*1000];
    NSString *datestring = [NSString stringWithFormat:@"%ld-%ld-%ld %@:00:00",[comps year],[comps month],[comps day],hour];
    NSDate *date = [MethodsDateTime methodToDate:datestring formatType:TO_DATA_TYPE_F];
    return date;
}

+(NSDate *)hourOfAfterToday:(NSString*)hour{
     
    NSDateComponents *comps = [self.class dateComponent:[[NSDate  date] timeIntervalSince1970]*1000 + sfSecondsOfDay*1000];
    NSString *datestring = [NSString stringWithFormat:@"%ld-%ld-%ld %@:00:00",[comps year],[comps month],[comps day],hour];
    NSDate *date = [MethodsDateTime methodToDate:datestring formatType:TO_DATA_TYPE_F];
    return date;
}

//获取组件
+(NSDateComponents *)dateComponent:(double)ms{
    
    //NSDate *date = [NSDate date];
    NSTimeInterval serverSecond = ms / 1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:serverSecond];
    
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit |
    NSMonthCalendarUnit |
    NSDayCalendarUnit |
    NSWeekdayCalendarUnit |
    NSHourCalendarUnit |
    NSMinuteCalendarUnit |
    NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:date];
    return comps;
    
}
+(NSString *)formatTimeWithTimeInterval:(NSTimeInterval)timeInterval{
    NSString *hour=nil;
    NSString *minute=nil;
    NSString *second=nil;
    if (timeInterval >= sfSecondsOfHour) {
        int h = timeInterval/sfSecondsOfHour;
        if (h / 10 >= 1) {
            hour = [NSString stringWithFormat:@"%d",h];
        }else{
            hour = [NSString stringWithFormat:@"0%d",h];
        }
        
        timeInterval-=h*sfSecondsOfHour;
    }else{
        hour = @"00";
    }
    if (timeInterval >= sfSecondsOfMinute) {
        int m = timeInterval/sfSecondsOfMinute;
        if (m / 10 >= 1) {
            minute = [NSString stringWithFormat:@"%d",m];
        }else{
            minute = [NSString stringWithFormat:@"0%d",m];
        }
        
        timeInterval-=m*sfSecondsOfMinute;
    }else {
        minute = @"00";
    }
    if (timeInterval < sfSecondsOfHour) {
        int s = timeInterval;
        if (s / 10 >= 1) {
            second = [NSString stringWithFormat:@"%d",s];
        }else{
            second = [NSString stringWithFormat:@"0%d",s];
        }
        
    }else{
        second = @"00";
    }
    
    NSString *result = [NSString stringWithFormat:@"%@:%@:%@",hour,minute,second];
    return result;
}





+(BOOL)compareSameDay:(double)milseconds otherDate:(double)othermilseconds{
    NSDateComponents *dateComponent = [self.class dateComponent:milseconds];
    NSDateComponents *otherdateComponent = [self.class dateComponent:othermilseconds];
    
    NSLog(@"server = %f",milseconds);
    NSLog(@"now = %f",othermilseconds);
    
    NSLog(@"server year = %d month = %d day = %d",[dateComponent year],[dateComponent month],[dateComponent day]);
    NSLog(@"now year = %d month = %d day = %d",[otherdateComponent year],[otherdateComponent month],[otherdateComponent day]);

    if (dateComponent.year == otherdateComponent.year
        && dateComponent.month == otherdateComponent.month
        && dateComponent.day == otherdateComponent.day) {
        return YES;
    }
    return NO;
}

@end
