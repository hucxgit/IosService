//
//  MethodsUtil.m
//  KinkIos
//
//  Created by Vocinno Mac Mini 1 on 15/7/2.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import "MethodsUtil.h"
//加密使用
#import <CommonCrypto/CommonDigest.h>
@implementation MethodsUtil{
}

//md5 加密
+ (NSString *)md5HexDigest:(NSString*)input{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02X",result[i]];
    }
    return ret;

}

//随机数[from to]
+(int)methodRandomNumber:(int)from to:(int)to{
    int temp = (int)(from + (arc4random() % (to-from + 1)));
    return temp;
}


+(NSString *)mGetValueByKey:(NSDictionary *)jsonType key:(NSString *)key{
    if ([jsonType objectForKey:key] != [NSNull null]) {
        return [jsonType objectForKey:key];
    }
    return nil;
}

+(NSNumber *)mGetNumValueByKey:(NSDictionary *)jsonType key:(NSString *)key{
    if ([jsonType objectForKey:key] != [NSNull null]) {
        return [jsonType objectForKey:key];
    }
    return nil;
}
 
//返回数组
+(NSArray *)mGetValuesByArray:(id)json key:(NSString *)key{
    if ( [json valueForKeyPath:key] != [NSNull null] )
    {
        return [json objectForKey:key];
    }
    return nil;
}

//返回字典
+(NSDictionary *)mGetValuesByDictionary:(id)json key:(NSString *)key{
    if ( [json valueForKeyPath:key] != [NSNull null] )
    {
        return [json objectForKey:key];
    }
    return nil;
}


@end
