//
//  StartAnnotation.m
//  Smartbox
//
//  Created by Mesada on 14/11/5.
//  Copyright (c) 2014年 mesada. All rights reserved.
//

#import "StartEndAnnotation.h"

@implementation StartEndAnnotation

@synthesize coordinate;

-(id)initWithCoordinate:(CLLocationCoordinate2D) coord
{
    coordinate.latitude = coord.latitude;
    coordinate.longitude = coord.longitude;
    _color = [UIColor blueColor];
    return self;
}

@end
