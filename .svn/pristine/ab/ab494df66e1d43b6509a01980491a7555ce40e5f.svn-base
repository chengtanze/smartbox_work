//
//  steerViewController.m
//  Smartbox
//
//  Created by Mesada on 14/12/23.
//  Copyright (c) 2014年 mesada. All rights reserved.
//

#import "steerViewController.h"
#import "AFAppDotNetAPIClient.h"

@interface steerViewController ()

@end

@implementation steerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_mapView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(3, 3)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = _mapView.bounds;
    maskLayer.path = maskPath.CGPath;
    _mapView.layer.mask = maskLayer;
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    CGFloat frameHight = screenHeight-self.navigationController.navigationBar.frame.size.height-self.tabBarController.tabBar.frame.size.height-20;
    
    
    _backScrollView.contentSize = CGSizeMake(_contentView.frame.size.width, _contentView.frame.size.height);
    NSLog(@" _backScrollView.contentSize=%f",_backScrollView.contentSize.height);
    _backScrollView.frame = CGRectMake(_backScrollView.frame.origin.x , _backScrollView.frame.origin.y , _backScrollView.frame.size.width, frameHight);
    NSLog(@"_backScrollView.frame=%f",_backScrollView.frame.size.height);
//    [[AFAppDotNetAPIClient sharedClient]GetadverImgesInfo:nil];
//    [[AFAppDotNetAPIClient sharedClient] GetadverImgesInfo:^(NSArray *arr, NSError *error)
//     {
//     }];
   [[AFAppDotNetAPIClient sharedClient] getDrivingCount:@"2014-01-12" endTime:@"2014-01-18" complete:^(NSDictionary *drivingcount, NSError *error)
    {
        
    }
    ];
    

    
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

@end
