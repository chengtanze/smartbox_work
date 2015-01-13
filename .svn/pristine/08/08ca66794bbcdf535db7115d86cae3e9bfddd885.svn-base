//
//  MKStartAnnotationView.m
//  Smartbox
//
//  Created by Mesada on 14/11/5.
//  Copyright (c) 2014年 mesada. All rights reserved.
//

#import "StartEndAnnotation.h"
#import "MKStartEndAnnotationView.h"
@implementation MKStartEndAnnotationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        
        if([reuseIdentifier  isEqual: @"locationIdentifier"])//当前位置点
        {
            self.image = [UIImage imageNamed:@"3-1SMART-BOX-救援_人位置图标"];
            self.layer.anchorPoint = CGPointMake(0.5, 1);
        }
        else
        {
            StartEndAnnotation *annotation = self.annotation;
            switch (annotation.type) {
                case DriveStart:
                    self.image = [UIImage imageNamed:@"new_start_marker"];
                    self.layer.anchorPoint = CGPointMake(0.5, 1);
                    break;
                case DriveEnd:
                    self.image = [UIImage imageNamed:@"new_drive_end_icon"];
                    self.layer.anchorPoint = CGPointMake(0.5, 1);
                    break;
                case DriveSpecial:
                {
                    UIGraphicsBeginImageContextWithOptions(CGSizeMake(10,10), NO, 0);
                    
                    UIBezierPath* p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0,10,10)];
                    
                    [annotation.color setFill];
                    
                    [p fill];
                    
                    UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
                    
                    UIGraphicsEndImageContext();
                    
                    self.image = im;
                }
                    break;
                case Car_Annotation:
                    self.image = [UIImage imageNamed:@"3-1SMART-BOX-救援_人位置图标"];
                    self.layer.anchorPoint = CGPointMake(0.5, 1);
                    break;
                case Person_Annotation:
                    self.image = [UIImage imageNamed:@"3-1SMART-BOX-救援_人位置图标"];
                    self.layer.anchorPoint = CGPointMake(0.5, 1);
                    break;
            }

        }
        
        
    }
    
    return self;
}

@end
