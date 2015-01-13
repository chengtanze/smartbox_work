//
//  ReportformsController.m
//  Smartbox
//
//  Created by Mesada on 14/10/30.
//  Copyright (c) 2014年 mesada. All rights reserved.
//

#import "ReportformsController.h"

@interface ReportformsController ()

@end

@implementation ReportformsController

@synthesize driveChart;
@synthesize mileageChart;
@synthesize badDriverChart =_badDriverChart;
@synthesize maxSpeedChart = _maxSpeedChart;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    [driveChart setChardata:@[ns1, ns2, ns3, ns4, ns5, ns6,ns7]];
    
    
    UIColor* purple = [UIColor colorWithRed:.51 green:.35 blue:.98 alpha:1.0];
    UIColor* blue = [UIColor colorWithRed:.25 green:.45 blue:.867 alpha:1.0];
    
    NSDictionary* mns1 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:100],@"value",@"9月30",@"desc",purple,@"color",blue,@"color2",nil];
    NSDictionary* mns2 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:96],@"value",@"9月30",@"desc",purple,@"color", [NSNumber numberWithInt:50],@"value2",blue,@"color2",nil];
    NSDictionary* mns3 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:128],@"value",@"9月30",@"desc",purple,@"color", [NSNumber numberWithInt:130],@"value2",blue,@"color2",nil];
    NSDictionary* mns4 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:63],@"value",@"9月30",@"desc",purple,@"color", [NSNumber numberWithInt:39],@"value2",blue,@"color2",nil];
    NSDictionary* mns5 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:269],@"value",@"9月30",@"desc",purple,@"color", [NSNumber numberWithInt:210],@"value2",blue,@"color2",nil];
    NSDictionary* mns6 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:108],@"value",@"9月30",@"desc",purple,@"color", [NSNumber numberWithInt:50],@"value2",blue,@"color2",nil];
    NSDictionary* mns7 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:146],@"value",@"9月30",@"desc",purple,@"color", [NSNumber numberWithInt:119],@"value2",blue,@"color2",nil];
    mileageChart.valueMax = 270;
    [mileageChart setChardata:@[mns1, mns2, mns3, mns4, mns5, mns6,mns7]];
    
    
    [_badDriverChart setChardata:@[ns1, ns2, ns3, ns4, ns5, ns6]];
    
    CHARDATARANG a = {0,270};
    _maxSpeedChart.rang =a;
    [_maxSpeedChart setChardata:@[mns1, mns2, mns3, mns4, mns5, mns6,mns7]];
    
    NSLog(@"_scrollview.frame.size.height = %f",_scrollview.frame.size.height);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    CGFloat contentSizeHeight = driveChart.superview.frame.size.height+mileageChart.superview.frame.size.height+_badDriverChart.superview.frame.size.height+_maxSpeedChart.superview.frame.size.height+16;//16为间隔距离
    
//    CGSize tempsize = CGSizeMake(_scrollview.frame.size.width, _scrollview.frame.size.height*2);
//    _scrollview.contentSize = tempsize;
    _scrollview.contentSize =  CGSizeMake(_scrollview.frame.size.width,contentSizeHeight);
    NSLog(@"_scrollview.frame.size.height = %f",contentSizeHeight);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
      NSLog(@"scrollview.frame.size.height = %f",scrollView.contentOffset.x);
}
@end
