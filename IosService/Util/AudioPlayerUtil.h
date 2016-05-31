//
//  AudioPlayerUtil.h
//  KinkIos
//
//  Created by Michael Tseng on 15/4/28.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//
//  从相册和相机获取照片 ，使用第三方类从相册中选取多张照片

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


@interface AudioPlayerUtil : NSObject<AVAudioPlayerDelegate>{
    AVAudioPlayer *avAudioPlayer;
    BOOL _playAudioOnce;  //标记音频是否播放一次
}

 
+(AudioPlayerUtil *)getInstanceWithType;
 


//获取播放器实例
-(void)initPlayer:(NSString *)filePath;

//设置播放次数
-(void)setplayLoops:(int)num;

//播放音频
-(void)playAudio;

//播放音频一次
-(void)playAudioOnce;

//暂停音频
-(void)pauseAudio;

//停止音频
-(void)stopAudio;

@end
