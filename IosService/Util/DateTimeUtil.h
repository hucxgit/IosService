//
//  DateTimeUtil.h
//  KinkIos
//
//  Created by Vocinno Mac Mini 1 on 15/3/24.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TO_DATA_TYPE_A 1 //@"yyyy年MM月dd日"
#define TO_DATA_TYPE_B 2 //@"yyyy-MM-dd"
#define TO_DATA_TYPE_C 3 //@"yyyy/MM/dd"
#define TO_DATA_TYPE_D 4 //@"yyyy@@MM@@dd"
#define TO_DATA_TYPE_E 5 //@"MM/dd"
#define TO_DATA_TYPE_F 6 //@"yyyy-MM-dd HH:mm:ss"
#define TO_DATA_TYPE_G 7 //@"yyyy.MM.dd"
#define TO_DATA_TYPE_H 8 //@"HH:mm"
#define TO_DATA_TYPE_I 9 //@"MM-dd HH:mm"

@interface DateTimeUtil : NSObject{
    
}

//根据毫秒数 获取时间描述
+(NSString *)getTimeDescription:(double)ms;

//甭纠结3.0规则
+(NSString *)getTimeThreeDescription:(double)ms;

//格式日期
+(NSString *)toString:(NSDate*)date fromType:(int)fromType;
+(NSDate *)toDate:(NSString *)str fromType:(int)fromType;

+(NSString *)getCuttentTime;


@end
