//
//  FirstViewController.m
//  Smartbox
//
//  Created by Mesada on 14-10-16.
//  Copyright (c) 2014年 mesada. All rights reserved.
//

#import "StatsViewController.h"
#import "AFAppDotNetAPIClient.h"


@interface StatsViewController ()

@end

@implementation StatsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view, typically from a nib.
    [self.percentage addObserver:self forKeyPath:@"bounds" options:NSKeyValueObservingOptionNew context:nil];
    
    _bannerView = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,100) delegate:self imageItems:nil isAuto:YES];
    
    [self.view addSubview:_bannerView];
    //[_adverView addSubview:bannerView];
    
    
    
    [[AFAppDotNetAPIClient sharedClient] GetadverImgesInfo:^(NSArray *arr, NSError *error)
     {
         NSMutableArray* array= [[NSMutableArray alloc]init];
         for (int i = 0; i < arr.count; i++) {
             
             SGFocusImageItem *item = [[SGFocusImageItem alloc] initWithDict:[arr objectAtIndex:i] tag:i];
             [array addObject:item];
             
//             SGFocusImageItem *item = [[SGFocusImageItem alloc] initWithTitle:@"topadv" image:[arr objectAtIndex:i] tag:i];
             [array addObject:item];

         }
         
         [_bannerView updateBanner:array];
     }];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    CGFloat frameHight = screenHeight-self.navigationController.navigationBar.frame.size.height-self.tabBarController.tabBar.frame.size.height-20;
    NSLog(@"frameHight=%f _contentView.frame.size.height=%f",frameHight,_contentView.frame.size.height);
    
    _backScrollView.contentSize = CGSizeMake(_contentView.frame.size.width, _contentView.frame.size.height);
    _backScrollView.frame = CGRectMake(_backScrollView.frame.origin.x , _backScrollView.frame.origin.y , _backScrollView.frame.size.width, frameHight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if(object == self.percentage && [keyPath isEqualToString:@"bounds"])
    {
        NSValue* value = [change objectForKey:@"new"];
        CGRect newRect = [value CGRectValue];
        self.percentage.font = [self.percentage.font fontWithSize:newRect.size.height];
     }
}


@end
