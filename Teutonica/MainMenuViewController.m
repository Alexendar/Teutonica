//
//  MainMenuViewController.m
//  Teutonica
//
//  Created by Aleksander on 30/01/16.
//  Copyright © 2016 Aleksander. All rights reserved.
//

#import "MainMenuViewController.h"
#import "AppDelegate.h"
#import "Settings.h"

@interface MainMenuViewController ()

@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (weak, nonatomic) IBOutlet UIButton *stopMusicButton;
@property (nonatomic) BOOL isMusicPlaying;
@end

@implementation MainMenuViewController
@synthesize isMusicPlaying;

-(void) setIsMusicPlaying:(BOOL)changedMusicValue {
    Settings *settings=[Settings getInstance];
    self.isMusicPlaying = changedMusicValue;
    settings.isMusicOn = changedMusicValue;
}

- (IBAction)stopMusicButtonPress:(UIButton *)sender {
    if(isMusicPlaying){
        [self stopMusic];
        [_stopMusicButton setTitleColor:[UIColor redColor]forState:UIControlStateNormal];
    } else {
        [self startMusic];
        [_stopMusicButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    }
    [_stopMusicButton reloadInputViews];
}
//TO DO zczytywanie muzyki z Settingsow zeby stan sie utrzymywal
-(void) viewDidLoad {
    [self startMusic];
    [self startVideo];
    if(!_player){
        _player  = self.player;
    }
    if(_playerLayer){
        _playerLayer = self.playerLayer;
    }

}


-(void) viewDidAppear:(BOOL)animated {
  
}

-(void) startVideo
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"grunwald" ofType:@"mp4"];
    NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
    
    _player = [AVPlayer playerWithURL:movieURL];
    _player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector:@selector(playerItemDidReachEnd:) name: AVPlayerItemDidPlayToEndTimeNotification object:[_player currentItem]];
    
    _playerLayer = [AVPlayerLayer layer];
    [_playerLayer setPlayer:_player];
    [_playerLayer setFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    [_playerLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [self.videoView.layer addSublayer:_playerLayer];
    
    [_player play];
}
- (void)playerItemDidReachEnd:(NSNotification *)notification {
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero];
}


- (IBAction)startMusic
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate.menuAudioPlayer play];
    isMusicPlaying = YES;
}

- (IBAction)stopMusic
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate.menuAudioPlayer pause];
    isMusicPlaying = NO;
}


- (void) viewDidDisappear:(BOOL)animated
{
    [_playerLayer.player pause];
    _playerLayer.player = nil;
    [_playerLayer removeFromSuperlayer];
}
@end
