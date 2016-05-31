//
//  MethodAlert.m
//  IosService
//
//  Created by Vocinno Mac Mini 1 on 15/9/16.
//  Copyright (c) 2015年 VocinnoMacMini. All rights reserved.
//

#import "MethodsAlert.h"

@implementation MethodsAlert
+(void)methodAlertWithTitle:(NSString *)title message:(NSString *)message confirm:(NSString *)confirm other:(NSString *)other{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:confirm otherButtonTitles:other , nil];
    [alert show];
}
@end
