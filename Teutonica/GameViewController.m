//
//  GameViewController.m
//  Teutonica
//
//  Created by Aleksander on 27/01/16.
//  Copyright (c) 2016 Aleksander. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"
#import "AppDelegate.h"

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self stopMusic];
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Create and configure the scene.
    GameScene *scene = [GameScene nodeWithFileNamed:@"GameScene"];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (IBAction)stopMusic
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate.menuAudioPlayer stop];
}
@end
