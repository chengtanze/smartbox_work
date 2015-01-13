//
//  RescueViewController.h
//  Smartbox
//
//  Created by Mesada on 14/12/22.
//  Copyright (c) 2014年 mesada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface RescueViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UITableView *tabView;
@property (nonatomic)  CLLocationCoordinate2D carCoordinate;
@property (nonatomic)  CLLocationCoordinate2D personCoordinate;
- (IBAction)MoveToCarplace:(id)sender;
- (IBAction)MoveToMyPlace:(id)sender;

@end
