//
//  MethodsAudio.m
//  KinkIos
//
//  Created by Vocinno Mac Mini 1 on 15/6/30.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import "MethodsAudio.h"
#import "AudioPlayerUtil.h"
@implementation MethodsAudio{
    
}


//播放音频 type 视频类型 num 播放次数
+(void)playAudio:(NSString *)filePath{
    [[AudioPlayerUtil getInstanceWithType] initPlayer:filePath];
    [[AudioPlayerUtil getInstanceWithType] setplayLoops:-1];//-1循环播放
    [[AudioPlayerUtil getInstanceWithType] playAudio];
    
}

//播放音频一次 type 视频类型 num 播放次数
+(void)playAudioOnce:(NSString *)filePath{
    [[AudioPlayerUtil getInstanceWithType] initPlayer:filePath];
    [[AudioPlayerUtil getInstanceWithType] setplayLoops:0];//0只播放一次
    [[AudioPlayerUtil getInstanceWithType] playAudioOnce];
 
}

//暂停音频 暂时未用到
+(void)pauseAudio{
     [[AudioPlayerUtil getInstanceWithType] pauseAudio];
    
}

//停止音频
+(void)stopAudio{
    [[AudioPlayerUtil getInstanceWithType] stopAudio];
    
}

//音频系统设置
+(void)audioSystemSetting{
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setActive:YES error:nil];
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
}


@end
