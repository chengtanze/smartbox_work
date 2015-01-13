//
//  StartAnnotation.h
//  Smartbox
//
//  Created by Mesada on 14/11/5.
//  Copyright (c) 2014年 mesada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


#import <MapKit/MapKit.h>

typedef NS_ENUM(NSInteger, PVAttractionType) {
    DriveStart = 0,
    DriveEnd,
    DriveSpecial,
    Car_Annotation,
    Person_Annotation
};

@interface StartEndAnnotation : NSObject<MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic) PVAttractionType type;
@property (nonatomic) UIColor *color;
-(id)initWithCoordinate:(CLLocationCoordinate2D) coord;
@end
