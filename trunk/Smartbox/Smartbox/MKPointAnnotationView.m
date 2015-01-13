//
//  MKPointAnnotationView.m
//  Smartbox
//
//  Created by Mesada on 14/11/5.
//  Copyright (c) 2014年 mesada. All rights reserved.
//

#import "MKPointAnnotationView.h"
#import "MKPointAnnotation.h"
@implementation MKPointAnnotationView

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
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(10,10), YES, 0);
        
        UIBezierPath* p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0,100,100)];
        
        [annotation.color setFill];
        
        [p fill];
        
        UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        self.image = im;
        
    }
    
    return self;
}

@end
