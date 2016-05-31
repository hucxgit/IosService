//
//  MethodsAudio.h
//  KinkIos
//
//  Created by Vocinno Mac Mini 1 on 15/6/30.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import <Foundation/Foundation.h>
 
 
@interface MethodsAudio : NSObject{
    
}


//播放音频 type 视频类型 num 播放次数
+(void)playAudio:(NSString *)filePath;

//播放音频一次 type 视频类型 num 播放次数
+(void)playAudioOnce:(NSString *)filePath;

//暂停音频
+(void)pauseAudio;

//停止音频
+(void)stopAudio;

//音频系统设置 
+(void)audioSystemSetting;


@end
