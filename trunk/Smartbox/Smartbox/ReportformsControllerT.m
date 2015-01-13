//
//  ReportformsControllerT.m
//  Smartbox
//
//  Created by Mesada on 14/12/15.
//  Copyright (c) 2014年 mesada. All rights reserved.
//

#import "ReportformsControllerT.h"
#import "driveChartCell.h"
#import "mileageChartCell.h"
#import "badDriverChartCell.h"
#import "maxSpeedChartCell.h"

//static int cellHeight[] = {212, 250,250 , 212};

@interface ReportformsControllerT ()

@end

@implementation ReportformsControllerT

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    CGFloat tableheight = screenHeight- _dataView.frame.origin.y-_dataView.frame.size.height-10;
    _tableView.frame = CGRectMake(_tableView.frame.origin.x, _tableView.frame.origin.y, _tableView.frame.size.width,tableheight);
}

//-(void) viewWillAppear:(BOOL)animated
//{
//
//}

//- (void)viewDidAppear:(BOOL)animated
//{
////     CGFloat tableheight = screenHeight- _dataView.frame.origin.y-_dataView.frame.size.height-10;
////            _tableView.frame = CGRectMake(_tableView.frame.origin.x, _tableView.frame.origin.y, _tableView.frame.size.width,tableheight);
//    NSLog(@"tableview.frame.height =%f", _tableView.frame.size.height);
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 4;
}
 -(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
//    if (!cell) {
//        cell = [[[NSBundle mainBundle]loadNibNamed:@"abstractLogCell" owner:self options:nil]objectAtIndex:0];
//        [landscapeTableView adjustCell:cell];
//    }
    
    UIColor*  gray = [UIColor colorWithRed:.37 green:.49 blue:.655 alpha:1.0];
    UIColor* orange = [UIColor colorWithRed:1 green:.423 blue:.423 alpha:1.0];
    UIColor* yellow =  [UIColor colorWithRed:.997 green:.745 blue:.498 alpha:1.0];
    NSDictionary* ns1 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:100],@"value",@"9月30",@"desc",gray,@"color",nil];
    NSDictionary* ns2 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:50],@"value",@"9月30",@"desc",orange,@"color",nil];
    NSDictionary* ns3 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:60],@"value",@"9月30",@"desc",gray,@"color",nil];
    NSDictionary* ns4 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:70],@"value",@"9月30",@"desc",yellow,@"color",nil];
    NSDictionary* ns5 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:80],@"value",@"9月30",@"desc",gray,@"color",nil];
    NSDictionary* ns6 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:90],@"value",@"9月30",@"desc",orange,@"color",nil];
    NSDictionary* ns7 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:90],@"value",@"9月30",@"desc",[UIColor blueColor],@"color",nil];
    
    
    
    UIColor* purple = [UIColor colorWithRed:.51 green:.35 blue:.98 alpha:1.0];
    UIColor* blue = [UIColor colorWithRed:.25 green:.45 blue:.867 alpha:1.0];
    
    NSDictionary* mns1 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:100],@"value",@"9月30",@"desc",purple,@"color",blue,@"color2",nil];
    NSDictionary* mns2 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:96],@"value",@"9月30",@"desc",purple,@"color", [NSNumber numberWithInt:50],@"value2",blue,@"color2",nil];
    NSDictionary* mns3 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:128],@"value",@"9月30",@"desc",purple,@"color", [NSNumber numberWithInt:130],@"value2",blue,@"color2",nil];
    NSDictionary* mns4 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:63],@"value",@"9月30",@"desc",purple,@"color", [NSNumber numberWithInt:39],@"value2",blue,@"color2",nil];
    NSDictionary* mns5 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:269],@"value",@"9月30",@"desc",purple,@"color", [NSNumber numberWithInt:210],@"value2",blue,@"color2",nil];
    NSDictionary* mns6 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:108],@"value",@"9月30",@"desc",purple,@"color", [NSNumber numberWithInt:50],@"value2",blue,@"color2",nil];
    NSDictionary* mns7 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:146],@"value",@"9月30",@"desc",purple,@"color", [NSNumber numberWithInt:119],@"value2",blue,@"color2",nil];
    
    switch (indexPath.section) {
        case 0:
        {
             driveChartCell*  cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
            if (!cell) {
                cell = [[[NSBundle mainBundle]loadNibNamed:@"driveChartCell" owner:self options:nil]objectAtIndex:0];
            }
             [cell.driveChart setChardata:@[ns1, ns2, ns3, ns4, ns5, ns6,ns7]];
             return cell;
        }
        case 1:
        {
            mileageChartCell*  cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
            if (!cell) {
                cell = [[[NSBundle mainBundle]loadNibNamed:@"mileageChartCell" owner:self options:nil]objectAtIndex:0];

            }
            cell.mileageChart.valueMax = 270;
            [cell.mileageChart setChardata:@[mns1, mns2, mns3, mns4, mns5, mns6,mns7]];
            return cell;
            

        }
        case 2:
        {

            badDriverChartCell*  cell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
            if (!cell) {
                cell = [[[NSBundle mainBundle]loadNibNamed:@"badDriverChartCell" owner:self options:nil]objectAtIndex:0];
                
            }
            [cell.badDriverChart setChardata:@[ns1, ns2, ns3, ns4, ns5, ns6]];
            return cell;
            
        }
        case 3:
        {

            maxSpeedChartCell*  cell = [tableView dequeueReusableCellWithIdentifier:@"cell4"];
            if (!cell) {
                cell = [[[NSBundle mainBundle]loadNibNamed:@"maxSpeedChartCell" owner:self options:nil]objectAtIndex:0];

            }
            CHARDATARANG a = {0,270};
            cell.maxSpeedChart.rang =a;
            [cell.maxSpeedChart setChardata:@[mns1, mns2, mns3, mns4, mns5, mns6,mns7]];
            return cell;
            

        }
        default:
            return nil;
    }
    
}

//因为已经旋转过，所以高其实是宽
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
//    NSLog(@"cell.frame.size.height = %f class = %@",cell.contentView.frame.size.height, [cell class]);
    //;
//    return cellHeight[indexPath.row];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    switch (indexPath.section) {
        case 0:
        {

            driveChartCell* celltemp = (driveChartCell*)cell;
            [celltemp.driveChart endstrokeChart];
        }
         break;
        case 1:
        {
            mileageChartCell* celltemp = (mileageChartCell*)cell;
            [celltemp.mileageChart endstrokeChart];

        }
        break;
        case 2:
        {
            badDriverChartCell* celltemp = (badDriverChartCell*)cell;
            [celltemp.badDriverChart endstrokeChart];
            

        }
        break;
        case 3:
        {
            maxSpeedChartCell* celltemp = (maxSpeedChartCell*)cell;
            [celltemp.maxSpeedChart endstrokeChart];
        }
        break;
    }

}

-(void)dealloc
{
    NSLog(@"ReportformsControllerT dealloc");
}
@end
