//
//  AKTime.m
//  AstroKit
//
//  Created by Don Willems on 19/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import "AKTimeFunctions.h"

NSInteger const __NUMBER_OF_SECONDS_IN_A_DAY = 86400;

AKJulianDay AKTimeIntervalSince1970ToJulianDay(NSTimeInterval time)
{
    double JD = 2440587.500000 + (time / (double)__NUMBER_OF_SECONDS_IN_A_DAY);
    return JD;
}

NSTimeInterval AKJulianDayToTimeIntervalSince1970(AKJulianDay JD)
{
    NSTimeInterval ti = (JD-2440587.500000)*((double)__NUMBER_OF_SECONDS_IN_A_DAY);
    return ti;
}