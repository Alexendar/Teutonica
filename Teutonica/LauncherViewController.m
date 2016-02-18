//
//  LauncherViewController.m
//  Teutonica
//
//  Created by Aleksander on 30/01/16.
//  Copyright © 2016 Aleksander. All rights reserved.
//

#import "LauncherViewController.h"
#import "MainMenuViewController.h"

@implementation LauncherViewController

-(void) viewDidAppear: (BOOL) animated {
    [self preloading];
    [self checkForUpdates];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainMenuViewController *mmvc = [sb instantiateViewControllerWithIdentifier:@"MainMenuViewController"];
    [self showViewController:mmvc sender:self];
}



- (void) preloading {
    //building settings from file
    
    NSLog(@"LOADED CONTENT");
    
    
}

- (void) checkForUpdates {
    NSLog(@"NO UPDATES");
}

@end
