//
//  AKSiderealTime.m
//  AstroKit
//
//  Created by Don Willems on 23/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import "AKSiderealTimeFunctions.h"


AKAngle AKMeanSiderealTimeAtGreenwich(AKJulianDay JD)
{
    AKJulianCenturies T = AKJulianDayToJulianCenturies(JD);
    double indeg = 280.46061837 + 360.98564736629*(JD-2451545.0) + 0.000387933*T*T - T*T*T/38710000;
    AKAngle theta = indeg/180*M_PI;
    theta = AKNormalizeAngle(theta);
    return theta;
}