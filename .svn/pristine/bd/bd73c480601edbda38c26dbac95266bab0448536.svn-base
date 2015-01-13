//
//  RescueViewController.m
//  Smartbox
//
//  Created by Mesada on 14/12/22.
//  Copyright (c) 2014年 mesada. All rights reserved.
//

#import "RescueViewController.h"
#import "RescueCell.h"
#import "StartEndAnnotation.h"
#import "MKStartEndAnnotationView.h"

@interface RescueViewController ()

@end

@implementation RescueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
    _carCoordinate = CLLocationCoordinate2DMake(23.095093,113.652915);
    _personCoordinate = CLLocationCoordinate2DMake(23.098945,113.633274);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(_carCoordinate, 200, 200);
    
    self.mapView.region = region;
    self.mapView.showsUserLocation = YES;
    [self addAttractionPins];
}

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
- (void)addAttractionPins {
    StartEndAnnotation *annotation = [[StartEndAnnotation alloc] initWithCoordinate:_carCoordinate];
    annotation.type = DriveEnd;
    [self.mapView addAnnotation:annotation];
}

-(void)SetMapRegion:(CLLocationCoordinate2D)coordinate
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 200, 200);
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:region];

    [self.mapView setRegion:adjustedRegion animated:YES];
    [self.mapView setRegion:region animated:YES];
    
}


#pragma mark --MKMapViewDelegate
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    if([annotation isKindOfClass:[StartEndAnnotation class]])
    {
        MKStartEndAnnotationView *annotationView = [[MKStartEndAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"StartEndAnnotation"];
        annotationView.canShowCallout = NO;
        return annotationView;

    }
    else if([annotation isKindOfClass:[MKUserLocation class]])
    {
        MKStartEndAnnotationView *locationView = [[MKStartEndAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"locationIdentifier"];
        return locationView;
        
    }
    return nil;
}


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    _personCoordinate.latitude = userLocation.location.coordinate.latitude;
    _personCoordinate.longitude = userLocation.location.coordinate.longitude;
    
//    [self SetMapRegion:_personCoordinate];
}

#pragma mark --UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RescueCell*  cell = [tableView dequeueReusableCellWithIdentifier:@"rescueCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"rescueCell" owner:self options:nil]objectAtIndex:0];
    }
    switch (indexPath.row) {
        case 0:
            cell.NameLabel.text = @"人伤救援";
            cell.detailLabel.text = @"动手请求，可调配附近的120前来";
            cell.iconimage.image =  [UIImage imageNamed:@"3-1SMART-BOX-救援_人伤救援"];
            break;
        case 1:
            cell.NameLabel.text = @"道路救援";
            cell.detailLabel.text = @"拖车、无油、抛锚、爆胎、泵电...";
            cell.iconimage.image =  [UIImage imageNamed:@"3-1SMART-BOX-救援_道路救援"];
            break;
        case 2:
            cell.NameLabel.text = @"一键报险";
            cell.detailLabel.text = @"直接拨打报险公司电话，快速报险";
            cell.iconimage.image =  [UIImage imageNamed:@"3-1SMART-BOX-救援_一键报险"];
        default:
            break;
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"InjuredSegue" sender:self];
                        break;
        case 1:
            [self performSegueWithIdentifier:@"RoadHelpSegue" sender:self];
            break;
        case 2:
        {
            UIActionSheet *showSheet = [[UIActionSheet alloc] initWithTitle:@"提示信息" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确认" otherButtonTitles:nil];
            [showSheet showInView:[UIApplication sharedApplication].keyWindow];

        }
            break;
        default:
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (IBAction)MoveToCarplace:(id)sender {
    
    [self SetMapRegion:_carCoordinate];
}
- (IBAction)MoveToMyPlace:(id)sender {
    [self SetMapRegion:_personCoordinate];

}

- (void) actionSheet: (UIActionSheet *) actionSheet
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSString *msg = nil;
    if (buttonIndex != [actionSheet cancelButtonIndex]) {
        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",@"10086"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }else {
       
    }
    
}

@end
