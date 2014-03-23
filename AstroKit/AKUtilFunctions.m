//
//  AKUtilFunctions.m
//  AstroKit
//
//  Created by Don Willems on 19/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import "AKUtilFunctions.h"


AKAngle AKNormalizeAngle(AKAngle angle)
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

double AKRadiansToDegrees(AKAngle angle)
{
    return angle/M_PI*180.;
}

AKAngle AKDegreesToRadians(double angle)
{
    return angle/180.*M_PI;
}

AKAngle AKAngularDifference(AKAngle angle1, AKAngle angle2)
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


NSString* AKHMSStringFromAngle(AKAngle angle)
{
    return AKHMSStringFromAngleInDegrees(angle*180/M_PI);
}

NSString* AKHMSStringFromAngleInDegrees(double angle)
{
    int h = (int)(angle/15.);
    int m = (int)((angle/15.-(double)h)*60.);
    double st =((angle/15.-(double)h)*60.-m)*60.;
    int s = (int)st;
    int sh = (int)((st-(double)s)*10000.+0.5);
    NSMutableString *str = [NSMutableString string];
    if(h<10) [str appendFormat:@" %dh",h];
    else [str appendFormat:@"%dh",h];
    if(m<10) [str appendFormat:@"0%dm",m];
    else [str appendFormat:@"%dm",m];
    if(s<10) [str appendFormat:@"0%ds",s];
    else [str appendFormat:@"%ds",s];
    if(sh<10) [str appendFormat:@"000%d",sh];
    else if(sh<100) [str appendFormat:@"00%d",sh];
    else if(sh<1000) [str appendFormat:@"0%d",sh];
    else [str appendFormat:@"%d",sh];
    return str;
}

NSString* AKDMSStringFromAngle(AKAngle angle)
{
    return AKDMSStringFromAngleInDegrees(angle*180/M_PI);
}

NSString* AKDMSStringFromAngleInDegrees(double angle)
{
    NSString *sign = @"+";
    if(angle<0) {
        sign = @"-";
        angle = -angle;
    }
    int d = (int)(angle);
    int m = (int)((angle-(double)d)*60.);
    double st =((angle-(double)d)*60.-m)*60.;
    int s = (int)st;
    int sh = (int)((st-(double)s)*1000.+0.5);
    NSMutableString *str = [NSMutableString string];
    if(d<10) [str appendFormat:@" %@%d°",sign,d];
    else [str appendFormat:@"%@%d°",sign,d];
    if(m<10) [str appendFormat:@"0%d'",m];
    else [str appendFormat:@"%d'",m];
    if(s<10) [str appendFormat:@"0%d\"",s];
    else [str appendFormat:@"%d\"",s];
    if(sh<10) [str appendFormat:@"00%d",sh];
    else if(sh<100) [str appendFormat:@"0%d",sh];
    else [str appendFormat:@"%d",sh];
    return str;
}