
//  DriveLogsController.h
//  Smartbox
//
//  Created by Mesada on 14/12/4.
//  Copyright (c) 2014年 mesada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "landscapeTableView.h"

@interface LOG_DATA_TYPE:NSObject<NSCopying> 
    @property  (nonatomic) BOOL isboundaryItem;
    @property  (nonatomic) NSInteger month;
    @property  (nonatomic) NSInteger day;
    @property  (nonatomic) NSInteger weekday;
@end

@interface DriveLogsController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *dateView;
@property (strong,nonatomic)  NSMutableArray* sourceData;
@property (strong, nonatomic) IBOutlet landscapeTableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *dateView2;

@end
