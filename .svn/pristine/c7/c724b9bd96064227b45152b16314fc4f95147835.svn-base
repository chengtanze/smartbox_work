//
//  SecondViewController.m
//  Smartbox
//
//  Created by Mesada on 14-10-16.
//  Copyright (c) 2014年 mesada. All rights reserved.
//

#import "TravelViewController.h"
#import "DriveLogCell.h"
#import "AccidentCell.h"
@interface TravelViewController ()

@end

@implementation TravelViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"driveCell";
    static NSString* cellIndetifie2 = @"accidentCell";
    if(indexPath.row%2==0)
    {
        DriveLogCell* cell = (DriveLogCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        return cell;
    }
    else
    {
        AccidentCell* cell = (AccidentCell*)[tableView dequeueReusableCellWithIdentifier:cellIndetifie2];
        return cell;
    }
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell* cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
@end
