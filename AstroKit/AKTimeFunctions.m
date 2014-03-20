//
//  AKTime.m
//  AstroKit
//
//  Created by Don Willems on 19/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import "AKTimeFunctions.h"
#import "AKLeapSeconds.h"

NSInteger const __NUMBER_OF_SECONDS_IN_A_DAY = 86400;

AKJulianDay AKTimeIntervalSince1970ToJulianDay(NSTimeInterval time)
{
    AKJulianDay JD = 2440587.500000 + (time / (double)__NUMBER_OF_SECONDS_IN_A_DAY);
    return JD;
}

NSTimeInterval AKJulianDayToTimeIntervalSince1970(AKJulianDay JD)
{
    NSTimeInterval ti = (JD-2440587.500000)*((double)__NUMBER_OF_SECONDS_IN_A_DAY);
    return ti;
}

NSTimeInterval AKTerrestrialTimeToAtomicTime(NSTimeInterval TT)
{
    return TT-32.184;
}

NSTimeInterval AKAtomicTimeToTerrestrialTime(NSTimeInterval TAI)
{
    return TAI+32.184;
}

NSTimeInterval AKCoordinatedUniversalTimeToAtomicTime(NSTimeInterval UTC)
{
    AKJulianDay JD = AKTimeIntervalSince1970ToJulianDay(UTC);
    double ls = [AKLeapSeconds leapSecondsAtJulianDay:JD];
    NSTimeInterval TAI = UTC+ls;
    return TAI;
}

NSTimeInterval AKAtomicTimeToCoordinatedUniversalTime(NSTimeInterval TAI)
{
    AKJulianDay JD = AKTimeIntervalSince1970ToJulianDay(TAI);
    double ls = [AKLeapSeconds leapSecondsAtJulianDay:JD];
    NSTimeInterval UTC = TAI-ls;
    return UTC;
}