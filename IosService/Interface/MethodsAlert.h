//
//  MethodAlert.h
//  IosService
//
//  Created by Vocinno Mac Mini 1 on 15/9/16.
//  Copyright (c) 2015年 VocinnoMacMini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MethodsAlert : NSObject{
}

+(void)methodAlertWithTitle:(NSString *)title message:(NSString *)message confirm:(NSString *)confirm other:(NSString*)other;

@end
