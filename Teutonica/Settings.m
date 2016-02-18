//
//  Settings.m
//  Teutonica
//
//  Created by Aleksander on 13/02/16.
//  Copyright © 2016 Aleksander. All rights reserved.
//

#import "Settings.h"

@implementation Settings
@synthesize isMusicOn;

static Settings *instance = nil;

+(Settings *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance= [Settings new];
        }
    }
    return instance;
}
@end
