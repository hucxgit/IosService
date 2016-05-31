//
//  MehodsJson.h
//  Service
//
//  Created by Vocinno Mac Mini 1 on 15/7/28.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import <Foundation/Foundation.h>
//提供 用原生的方法 把json转成对象 或把对象转成json串

@interface MehodsJson : NSObject{
}

+(id)methodsJsonToObj:(const char *)jsonString;
+(NSString *)methodsObjToJson:(id)obj;
@end
