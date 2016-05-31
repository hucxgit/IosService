//
//  MethodsUtil.h
//  KinkIos
//
//  Created by Vocinno Mac Mini 1 on 15/7/2.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MethodsUtil : NSObject{

}
//md5 加密
+ (NSString *)md5HexDigest:(NSString*)input;

//随机数[from to]
+(int)methodRandomNumber:(int)from to:(int)to;

+(NSString *)mGetValueByKey:(NSDictionary *)jsonType key:(NSString *)key;
+(NSNumber *)mGetNumValueByKey:(NSDictionary *)jsonType key:(NSString *)key;

//返回字典
+(NSDictionary *)mGetValuesByDictionary:(id)json key:(NSString *)key;

//返回数组
+(NSArray *)mGetValuesByArray:(id)json key:(NSString *)key;
@end
