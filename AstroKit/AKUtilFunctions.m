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

double AKAngularDifference(double angle1, double angle2)
{
    double a1 = AKNormalizeAngle(angle1);
    double a2 = AKNormalizeAngle(angle2);
    double dif = a2-a1;
    if(dif<=-M_PI) dif+=2*M_PI;
    if(dif>M_PI) dif-=2*M_PI;
    return dif;
}

double AKAngularDifferenceInDegrees(double angle1, double angle2)
{
    double a1 = AKNormalizeAngleInDegrees(angle1);
    double a2 = AKNormalizeAngleInDegrees(angle2);
    double dif = a2-a1;
    if(dif<=-180) dif+=360;
    if(dif>180) dif-=360;
    return dif;
}

