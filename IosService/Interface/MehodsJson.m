//
//  MehodsJson.m
//  Service
//
//  Created by Vocinno Mac Mini 1 on 15/7/28.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import "MehodsJson.h"

@implementation MehodsJson
+(id)methodsJsonToObj:(const char *)jsonString{
    NSData* data = [[NSString stringWithUTF8String:jsonString] dataUsingEncoding:NSUTF8StringEncoding];
    NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error)
    {
        NSLog(@"invalid mJsonToObject, Error: %@", [error description]);
        return nil;
    }
    return result;
}
+(NSString *)methodsObjToJson:(id)obj{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    if (error) {
        return @"";
    }
    
    return jsonString;
}
@end
