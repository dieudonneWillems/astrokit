//
//  AKSiderealTime.m
//  AstroKit
//
//  Created by Don Willems on 23/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import "AKSiderealTimeFunctions.h"
#import "AKNutationFunctions.h"


AKAngle AKMeanSiderealTimeAtGreenwich(AKJulianDay JD)
{
    AKJulianCenturies T = AKJulianDayToJulianCenturies(JD);
    double indeg = 280.46061837 + 360.98564736629*(JD-2451545.0) + 0.000387933*T*T - T*T*T/38710000;
    AKAngle theta = indeg/180*M_PI;
    theta = AKNormalizeAngle(theta);
    return theta;
}

double AKMeanSiderealTimeAtGreenwichInDegrees(AKJulianDay JD)
{
    AKAngle strad = AKMeanSiderealTimeAtGreenwich(JD);
    return strad*180/M_PI;
}

AKAngle AKMeanSiderealTime(AKJulianDay JD,AKGeographicalPoint location)
{
    AKAngle theta0 = AKMeanSiderealTimeAtGreenwich(JD);
    AKAngle theta = theta0-location.longitude;
    theta = AKNormalizeAngle(theta);
    return theta;
}

double AKMeanSiderealTimeInDegrees(AKJulianDay JD,AKGeographicalPoint location)
{
    AKAngle strad = AKMeanSiderealTime(JD,location);
    return strad*180/M_PI;
}

AKAngle AKApparentSiderealTimeAtGreenwich(AKJulianDay JD)
{
    double rpi =180./M_PI;
    AKJulianCenturies T = AKJulianDayToJulianCenturies(JD);
    double indeg = 280.46061837 + 360.98564736629*(JD-2451545.0) + 0.000387933*T*T - T*T*T/38710000;
    AKAngle theta = indeg/rpi;
    theta = AKNormalizeAngle(theta);
    AKNutation nutation = AKCalculateNutation(T);
    AKAngle eps = AKCalculateTrueObliquityOfTheEclipticWithNutation(T, nutation);
    double corr = nutation.longitude*rpi*3600*cos(eps)/15;
    theta = theta+corr/240/rpi;
    theta = AKNormalizeAngle(theta);
    return theta;
}

double AKApparentSiderealTimeAtGreenwichInDegrees(AKJulianDay JD)
{
    AKAngle strad = AKApparentSiderealTimeAtGreenwich(JD);
    return strad*180/M_PI;
}

AKAngle AKApparentSiderealTime(AKJulianDay JD,AKGeographicalPoint location)
{
    AKAngle theta0 = AKApparentSiderealTimeAtGreenwich(JD);
    AKAngle theta = theta0-location.longitude;
    theta = AKNormalizeAngle(theta);
    return theta;
}

double AKApparentSiderealTimeInDegrees(AKJulianDay JD,AKGeographicalPoint location)
{
    AKAngle strad = AKApparentSiderealTime(JD,location);
    return strad*180/M_PI;
}