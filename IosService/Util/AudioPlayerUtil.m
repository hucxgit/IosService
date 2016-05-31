//
//  AudioPlayerUtil.m
//  KinkIos
//
//  Created by Michael Tseng on 15/4/28.
//  Copyright (c) 2015年 Vocinno Mac Mini 1. All rights reserved.
//

#import "AudioPlayerUtil.h"

static AudioPlayerUtil *audioUtil = nil;

@implementation AudioPlayerUtil
 
//获取播放器实例
-(void)initPlayer:(NSString *)filePath{
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:nil];
    
    if (avAudioPlayer != nil) {
        [avAudioPlayer pause];
        [avAudioPlayer stop];
        avAudioPlayer = nil;
    }
    
    NSURL *audioUrl = [NSURL fileURLWithPath:filePath];
    avAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioUrl error:nil];
    avAudioPlayer.delegate = self;
   
    avAudioPlayer.volume = 1.0;
    
    
}




+(AudioPlayerUtil *)getInstanceWithType{
    @synchronized (self){
        if (audioUtil == nil){
            audioUtil = [[self alloc] init];
        }
    }
    return audioUtil;
}


//设置播放次数
-(void)setplayLoops:(int)num {
    avAudioPlayer.numberOfLoops = num;
}

//播放音频
-(void)playAudio {
   
    
    _playAudioOnce = NO;
    [avAudioPlayer play];
}

//播放音频一次
-(void)playAudioOnce {
    _playAudioOnce = YES;
    [avAudioPlayer play];
}


//暂停音频
-(void)pauseAudio {
    [avAudioPlayer pause];
}


//停止音频
-(void)stopAudio {
    [avAudioPlayer stop];
    avAudioPlayer = nil;
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    if (_playAudioOnce == YES) {
        avAudioPlayer = nil;
    }
}


@end
