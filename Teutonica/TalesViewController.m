    //
//  TalesViewController.m
//  Teutonica
//
//  Created by Aleksander on 05/02/16.
//  Copyright © 2016 Aleksander. All rights reserved.
//
#import "Tale.h"
#import "TalesViewController.h"
@interface TalesViewController() <UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *talePickTableView;
@property (weak, nonatomic) IBOutlet UIImageView *taleImage;
@property (weak, nonatomic) IBOutlet UILabel *taleTitle;
@property (weak, nonatomic) IBOutlet UILabel *taleStory;

@property (weak, nonatomic) NSMutableArray* tales;

@end
@implementation TalesViewController 


@synthesize tales;
@synthesize taleImage;
@synthesize taleTitle;
@synthesize taleStory;
@synthesize talePickTableView;

-(void) viewDidLoad {
    
    [talePickTableView setDelegate:self];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"tales" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
  
    if([json isKindOfClass:[NSDictionary class]]) {
        NSArray *talesDictionaryArray = json[@"tales"];
        if( [talesDictionaryArray isKindOfClass:[NSArray class]]) {
            for( NSDictionary *dictionary in talesDictionaryArray) {
                Tale *tale = [[Tale alloc] init];
                tale.title = [dictionary objectForKey:@"title"];
                tale.story = [dictionary objectForKey:@"story"];
                tale.image = [dictionary objectForKey:@"image"];
                [tales addObject: tale];
            }
        }
    }

    
}
-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    Tale *taleFromTable = [tales objectAtIndex:[indexPath accessibilityElementCount]];
    cell.textLabel.text = taleFromTable.title;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if([tales count]>0)
        return [tales count];
    else
        return 1;
}

-(void) viewDidAppear:(BOOL)animated {
    
}

@end
