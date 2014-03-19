//
//  AKUtilFunctions.m
//  AstroKit
//
//  Created by Don Willems on 19/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import "AKUtilFunctions.h"


double AKNormalizeAngle(double angle)
{
    NSInteger nrd = (NSInteger)(angle/(2*M_PI));
    if(angle<0) nrd = nrd-1;
    return angle-(nrd*2*M_PI);
}

double AKNormalizeAngleInDegrees(double angle)
{
    NSInteger nrd = (NSInteger)(angle/360.);
    if(angle<0) nrd = nrd-1;
    return angle-(nrd*360.);
}

double AKRadiansToDegrees(double angle)
{
    return angle/M_PI*180.;
}

double AKDegreesToRadians(double angle)
{
    return angle/180.*M_PI;
}

