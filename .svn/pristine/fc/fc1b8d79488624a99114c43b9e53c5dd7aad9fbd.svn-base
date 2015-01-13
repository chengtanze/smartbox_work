//
//  mapLogViewController.m
//  Smartbox
//
//  Created by Mesada on 14/11/4.
//  Copyright (c) 2014年 mesada. All rights reserved.
//

#import "mapLogViewController.h"
#import "MKStartEndAnnotationView.h"
#import "StartEndAnnotation.h"
@interface mapLogViewController ()

@end

@implementation mapLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CLLocationCoordinate2D startCoordinate={23.095093,113.652915};
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(startCoordinate, 10000, 10000);
    
    self.mapView.region = region;
    [self addAttractionPins];
    [self addRoute];
    [self addCharacterLocation];
    
    
    [_screenFullView addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchDown];
}


-(void)checkboxClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if(btn.selected)
    {
    //隐藏头部
    _headView.hidden = true;
    _tipView.frame = CGRectMake(_headView.frame.origin.x, _headView.frame.origin.y,_tipView.frame.size.width, _tipView.frame.size.height);
    }
    else{
    //显示头部
    _tipView.frame = CGRectMake(_headView.frame.origin.x, _headView.frame.origin.y+_headView.frame.size.height,_tipView.frame.size.width,_tipView.frame.size.height);
    _headView.hidden = false;
    }
    
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


- (void)addRoute {
    
    CLLocationCoordinate2D pointsToUse[15]={
    CLLocationCoordinate2DMake(23.095093,113.652915),
    CLLocationCoordinate2DMake(23.094228,113.650795),
    CLLocationCoordinate2DMake(23.095093,113.652915),
    CLLocationCoordinate2DMake(23.095093,113.652915),
    CLLocationCoordinate2DMake(23.091482,113.643856),
    CLLocationCoordinate2DMake(23.090085,113.640371),
    CLLocationCoordinate2DMake(23.08829,113.636256),
    CLLocationCoordinate2DMake(23.089138,113.635879),
    CLLocationCoordinate2DMake(23.089138,113.635879),
    CLLocationCoordinate2DMake(23.089138,113.635879),
    CLLocationCoordinate2DMake(23.09439,113.633795),
    CLLocationCoordinate2DMake(23.09439,113.633795),
    CLLocationCoordinate2DMake(23.09439,113.633795),
    CLLocationCoordinate2DMake(23.09439,113.633795),
    CLLocationCoordinate2DMake(23.098945,113.633274),
    };
    
    MKPolyline *myPolyline = [MKPolyline polylineWithCoordinates:pointsToUse count:15];
    
    [self.mapView addOverlay:myPolyline];
}


- (void)addAttractionPins {
    StartEndAnnotation *annotation = [[StartEndAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(23.095093,113.652915)];
    annotation.type = DriveStart;
    [self.mapView addAnnotation:annotation];
    
    StartEndAnnotation *endannotation = [[StartEndAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(23.098945,113.633274)];
    endannotation.type = DriveEnd;    
    [self.mapView addAnnotation:endannotation];
}

- (void)addCharacterLocation {
//    PVCharacter *tweety = (PVCharacter *)[PVCharacter circleWithCenterCoordinate:CLLocationCoordinate2DMake(23.090085,113.640371) radius:25];
//    tweety.color = [UIColor yellowColor];
    
    StartEndAnnotation *annotation = [[StartEndAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(23.090085,113.640371)];
    annotation.type = DriveSpecial;
    annotation.color = [UIColor blueColor];
    [self.mapView addAnnotation:annotation];
   // [self.mapView addOverlay:annotation];
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if([annotation isKindOfClass:[StartEndAnnotation class]] )
    {
        MKStartEndAnnotationView *annotationView = [[MKStartEndAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"StartEndAnnotation"];
        annotationView.canShowCallout = NO;
        return annotationView;
    }

    return nil;
}



- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay {
    
    
    if ([overlay isKindOfClass:MKPolyline.class]) {
        MKPolylineView *lineView = [[MKPolylineView alloc] initWithOverlay:overlay];
        lineView.strokeColor = [UIColor greenColor];
        
        return lineView;
    }
    else if ([overlay isKindOfClass:PVCharacter.class]) {
        MKCircleView *circleView = [[MKCircleView alloc] initWithOverlay:overlay];
        circleView.strokeColor = [(PVCharacter *)overlay color];
        circleView.fillColor =  [(PVCharacter *)overlay color];
        return circleView;
    }
        
    return nil;
}

@end
