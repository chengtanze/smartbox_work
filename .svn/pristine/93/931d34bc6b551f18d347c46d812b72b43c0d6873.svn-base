
//  DriveLogsController.m
//  Smartbox
//
//  Created by Mesada on 14/12/4.
//  Copyright (c) 2014年 mesada. All rights reserved.
//

#import "DriveLogsController.h"
#import "MJRefresh.h"
#import "abstractLogCell.h"


@implementation LOG_DATA_TYPE
@synthesize month;
@synthesize isboundaryItem;
-(id)copyWithZone:(NSZone *)zone
{
    LOG_DATA_TYPE *newFract = [[LOG_DATA_TYPE allocWithZone:zone] init];
    
    newFract.month = self.month;
    newFract.isboundaryItem = self.isboundaryItem;
    
    return newFract;
}
@end

@interface DriveLogsController (){
    NSInteger oldPage;
    int s_group;
    CGPoint tempLablepoint;
    CGPoint Lablepoint;
    CGFloat Lableoffset;
}

@end

@implementation DriveLogsController


- (void)viewDidLoad {
    [super viewDidLoad];
    s_group =0;
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
   [self addfooter];
    _sourceData = [[NSMutableArray alloc]initWithCapacity:18];
    [self testaddData];//test bobo
    
    _dateView.text = [[NSString alloc] initWithFormat:@"%d",s_group];
    s_group++;
    oldPage = 0;
    Lablepoint = _dateView.frame.origin;
    tempLablepoint = _dateView2.frame.origin;
    Lableoffset  = Lablepoint.x - tempLablepoint.x;
}
    
- (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

#pragma mark DTGridViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_sourceData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    abstractLog_Cell*  cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"abstractLogCell" owner:self options:nil]objectAtIndex:0];
        [landscapeTableView adjustCell:cell];
    }
    if (indexPath.row == 0) {
        cell.RsplitLine.hidden = FALSE;
    }
    else
    {
        cell.RsplitLine.hidden = YES;
    }
    
    LOG_DATA_TYPE * data = [_sourceData objectAtIndex: indexPath.row];
    switch (data.weekday) {
        case 0:
            cell.weekDateView.text = @"周一";  break;
        case 1:
           cell.weekDateView.text = @"周二"; break;
        case 2:
            cell.weekDateView.text = @"周三"; break;
        case 3:
           cell.weekDateView.text = @"周四";   break;
        case 4:
           cell.weekDateView.text = @"周五";   break;
        case 5:
            cell.weekDateView.text= @"周六"; break;
        case 6:
            cell.weekDateView.text= @"周日";    break;
        default:
           cell.weekDateView.text = @"周日";    break;
    }

    cell.LsplitLine.frame = CGRectMake(cell.LsplitLine.frame.origin.x, cell.RsplitLine.frame.origin.y, cell.RsplitLine.frame.size.width, cell.RsplitLine.frame.size.height);
    if (data.weekday == 5) {
          cell.LsplitLine.frame = CGRectMake(cell.LsplitLine.frame.origin.x, cell.RsplitLine.frame.origin.y-50, cell.RsplitLine.frame.size.width, cell.RsplitLine.frame.size.height+50);
    }
    return cell;
}

//因为已经旋转过，所以高其实是宽
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static CGFloat cellHeight = 0 ;
    if ( 0 == cellHeight) {
        UITableViewCell* cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
        cellHeight = cell.frame.size.height;

    }
   return cellHeight;
}

- (void)addfooter
{
    //    __unsafe_unretained typeof(self) vc = self;
    __weak typeof(self) vc = self;
    // 添加下拉刷新头部控件
    [self.tableView addFooterWithCallback:^{
        // 进入刷新状态就会回调这个Block
        
        // 增加5条假数据
        //        for (int i = 0; i<5; i++) {
        //            [vc.fakeColors insertObject:MJRandomColor atIndex:0];
        //        }
        
        // 模拟延迟加载数据，因此2秒后才调用）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

            [vc testaddData];//test bobo
            [vc.tableView reloadData];
            // 结束刷新
            if (vc) {
                [vc.tableView footerEndRefreshing];
            }
            
            NSLog(@"加载更多");
            
                //        UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:indexPath];
                //        if (cell) {
                //            NSLog(@"cell=%@",cell);
                //        }
            [vc changeDataViewTip:true ];
            
            
        });
    }];
    
    //#warning 自动刷新(一进入程序就下拉刷新)
    //    [self.collectionView headerBeginRefreshing];
}

//table也是scrollview所以只要滚动就会调用这个方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"Scrolling...%f",scrollView.contentOffset.y);
    static CGFloat histroyY = 0;
    CGFloat currenty = scrollView.contentOffset.y;
    bool bleft = false;
    if (currenty - histroyY>0) {
        bleft = YES;
    }
    else if(currenty - histroyY<0){
        bleft = NO;
    }
    
    histroyY = currenty;
    [self changeDataViewTip:bleft];
//        UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:indexPath];
//        if (cell) {
//            NSLog(@"cell=%@",cell);
//        }
    
    
}
//滚动结束就会调用这个方法
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    NSLog(@"Scrolling Stoped...");
//    
//}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
    {
        CGFloat targety = self.tableView.contentOffset.y+self.tableView.frame.size.width;
        NSIndexPath * indexPath = [self.tableView indexPathForRowAtPoint:CGPointMake(0, targety)];

        if([self isboundaryrow:indexPath.row])
        {
            NSLog(@"targety11 = %f",targety);
            targety = (int)((targety+24)/48) * 48;
            NSLog(@"targety222 = %f  contentOffset =%f",targety,scrollView.contentOffset.y);
            [scrollView setContentOffset:CGPointMake(0, targety-self.tableView.frame.size.width) animated:YES];
        }

    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
     NSLog(@"scrollViewDidEndDecelerating =%f",scrollView.contentOffset.y);
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndScrollingAnimation =%f",scrollView.contentOffset.y);
}

//test bobo
-(void)testaddData
{
    for (int i = 0; i<7; i++) {
        LOG_DATA_TYPE* data = [[LOG_DATA_TYPE alloc]init];
        data.month = s_group;
        data.isboundaryItem = false;
        if (i == 0) {
            data.isboundaryItem = true;
        }
        
        data.weekday = i;
        [self.sourceData addObject:data];
    }

}

-(NSInteger)isboundaryrow:(NSInteger)index
{
    LOG_DATA_TYPE* data = (LOG_DATA_TYPE*)[self.sourceData objectAtIndex:index];
    return data.isboundaryItem;
}

-(NSInteger)index2Group:(NSInteger)index
{
    return  index/7;
}

-(void) changeDataViewTip:(BOOL)bleft
{
    static NSInteger oldboundary = 0;
    static NSInteger oldGroup = 0;
    NSIndexPath * indexPath = [self.tableView indexPathForRowAtPoint:CGPointMake(0, self.tableView.contentOffset.y+self.tableView.frame.size.width)];
    
    
    if (indexPath) {
        NSInteger currentGroup = [self index2Group:indexPath.row];
        if (currentGroup != oldGroup) {
         
//        NSInteger currentboundarry = indexPath.row;
//        if (oldboundary != currentboundarry) {
//            LOG_DATA_TYPE* data = [self.sourceData objectAtIndex:currentboundarry];
            if(bleft)
            {
                self.dateView.text = [NSString stringWithFormat:@"%ld",(long)currentGroup-1];
                self.dateView2.text = [NSString stringWithFormat:@"%ld",(long)currentGroup];
            }
            else{
                self.dateView.text = [NSString stringWithFormat:@"%ld",(long)currentGroup+1];
                self.dateView2.text = [NSString stringWithFormat:@"%ld",(long)currentGroup];
            }
//            oldboundary = currentboundarry;
//        }
            oldGroup =currentGroup;
        }
        
//        NSInteger currentboundarry = indexPath.row;
        float offset =  self.tableView.contentOffset.y+self.tableView.frame.size.width - (currentGroup*7 * 48);
            if (offset>48) {
                if (self.dateView2.alpha<1) {
                    self.dateView2.alpha = 1;
                    self.dateView.alpha = 1- self.dateView2.alpha;
                    self.dateView.frame = CGRectMake(Lablepoint.x+ Lableoffset*self.dateView2.alpha,Lablepoint.y,self.dateView.frame.size.width,self.dateView.frame.size.height);
                    self.dateView2.frame = CGRectMake(tempLablepoint.x+ Lableoffset*self.dateView2.alpha,tempLablepoint.y,self.dateView.frame.size.width,self.dateView.frame.size.height);
                }
            }
            else if(offset>0){
                self.dateView2.alpha = (offset / 48);
                self.dateView.alpha = 1- self.dateView2.alpha;
                self.dateView.frame = CGRectMake(Lablepoint.x+ Lableoffset*self.dateView2.alpha,Lablepoint.y,self.dateView.frame.size.width,self.dateView.frame.size.height);
                self.dateView2.frame = CGRectMake(tempLablepoint.x+ Lableoffset*self.dateView2.alpha,tempLablepoint.y,self.dateView.frame.size.width,self.dateView.frame.size.height);
            }

        }
    
//    if (indexPath && [self isboundaryrow:indexPath.row]) {
//   
//        NSInteger currentboundarry = indexPath.row;
//        if (oldboundary != currentboundarry) {
//            LOG_DATA_TYPE* data = [self.sourceData objectAtIndex:currentboundarry];
//            self.dateView.text = [NSString stringWithFormat:@"%d",data.month];
//            oldboundary = currentboundarry;
//        }
//
//        if (bleft) {
//            float offset =  self.tableView.contentOffset.y+self.tableView.frame.size.width - (currentboundarry * 48);
//            NSLog(@"boundaryrow=%d offset =%f", currentboundarry,offset);
//            if(offset > 0&& offset<=48) {
//                self.dateView2.alpha = (offset / 48);
//                self.dateView.alpha = 1- self.dateView2.alpha;
//                NSLog(@"left");
//                self.dateView.frame = CGRectMake(Lablepoint.x+ Lableoffset*self.dateView2.alpha,Lablepoint.y,self.dateView.frame.size.width,self.dateView.frame.size.height);
//                self.dateView2.frame = CGRectMake(tempLablepoint.x+ Lableoffset*self.dateView2.alpha,tempLablepoint.y,self.dateView.frame.size.width,self.dateView.frame.size.height);
//                
//            }
//        }
//        else
//        {
//            float offset =  self.tableView.contentOffset.y+self.tableView.frame.size.width - (currentboundarry * 48);
//            NSLog(@"boundaryrow=%d offset =%f", currentboundarry,offset);
//            if(offset > 0&& offset<=48) {
//                NSLog(@"right");
//                self.dateView2.alpha = (offset / 48);
//                self.dateView.alpha = 1- self.dateView2.alpha;
//                NSLog(@"left");
//                self.dateView.frame = CGRectMake(Lablepoint.x+ Lableoffset*self.dateView2.alpha,Lablepoint.y,self.dateView.frame.size.width,self.dateView.frame.size.height);
//                self.dateView2.frame = CGRectMake(tempLablepoint.x+ Lableoffset*self.dateView2.alpha,tempLablepoint.y,self.dateView.frame.size.width,self.dateView.frame.size.height);
//            }
//        }
    
//    }
}
@end
