//
//  MusicManagerController.m
//  PhotoTravel
//
//  Created by Pesho on 11/7/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "MusicManagerController.h"
@import AVFoundation;

@interface MusicManagerController () <AVAudioPlayerDelegate>
@property(strong, nonatomic) AVAudioSession *audioSession;
@property(strong, nonatomic) AVAudioPlayer *backgroundMusicPlayer;
@property(assign) BOOL backgroundMusicPlaying;
@property(assign) BOOL backgroundMusicInterrupted;
@property(assign) SystemSoundID pewPewSound;
@end

@implementation MusicManagerController

#pragma mark - Public
- (instancetype)init {
  self = [super init];
  if (self) {
    [self configureAudioSession];
    [self configureAudioPlayer];
  }
  return self;
}
- (void)tryPlayMusic {
  // If background music or other music is already playing, nothing more to do
  // here
  if (self.backgroundMusicPlaying || [self.audioSession isOtherAudioPlaying]) {
    return;
  }

  [self.backgroundMusicPlayer prepareToPlay];
  [self.backgroundMusicPlayer play];
  self.backgroundMusicPlaying = YES;
}
- (void)playSystemSound {
  AudioServicesPlaySystemSound(self.pewPewSound);
}

#pragma mark - Private
- (void)configureAudioSession {
  // Implicit initialization of audio session
  self.audioSession = [AVAudioSession sharedInstance];
  NSError *setCategoryError = nil;
  if ([self.audioSession isOtherAudioPlaying]) { // mix sound effects with music
                                                 // already playing
    [self.audioSession setCategory:AVAudioSessionCategorySoloAmbient
                             error:&setCategoryError];
    self.backgroundMusicPlaying = NO;
  } else {
    [self.audioSession setCategory:AVAudioSessionCategoryAmbient
                             error:&setCategoryError];
  }
  if (setCategoryError) {
    NSLog(@"Error setting category! %ld", (long)[setCategoryError code]);
  }
}

- (void)configureAudioPlayer {
  // Create audio player with background music
  NSURL *backgroundMusicURL =
      [[NSBundle mainBundle] URLForResource:@"sound" withExtension:@"mp3"];
  self.backgroundMusicPlayer =
      [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL
                                             error:nil];
  self.backgroundMusicPlayer.delegate =
      self; // We need this so we can restart after interruptions
  self.backgroundMusicPlayer.numberOfLoops =
      -1; // Negative number means loop forever
}

#pragma mark - AVAudioPlayerDelegate methods
- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player {
  self.backgroundMusicInterrupted = YES;
  self.backgroundMusicPlaying = NO;
}

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player
                       withOptions:(NSUInteger)flags {
  [self tryPlayMusic];
  self.backgroundMusicInterrupted = NO;
}

@end
