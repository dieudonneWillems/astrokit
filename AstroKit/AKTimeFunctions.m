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

AKModifiedJulianDay AKTimeIntervalSince1970ToModifiedJulianDay(NSTimeInterval time)
{
    AKJulianDay JD = 40587.000000 + (time / (double)__NUMBER_OF_SECONDS_IN_A_DAY);
    return JD;
}

NSTimeInterval AKModifiedJulianDayToTimeIntervalSince1970(AKModifiedJulianDay JD)
{
    NSTimeInterval ti = (JD-40587.000000)*((double)__NUMBER_OF_SECONDS_IN_A_DAY);
    return ti;
}

AKModifiedJulianDay AKJulianDayToModifiedJulianDay(AKJulianDay JD)
{
    return JD-2400000.5;
}

AKJulianDay AKModifiedJulianDayToJulianDay(AKModifiedJulianDay MJD)
{
    return MJD+2400000.5;
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
    NSTimeInterval ls = AKDifferenceBetweenCoordiantedUniversalTimeAndAtomicTimeAtTimeIntervalSince1970(UTC);
    NSTimeInterval TAI = UTC+ls;
    return TAI;
}

NSTimeInterval AKAtomicTimeToCoordinatedUniversalTime(NSTimeInterval TAI)
{
    NSTimeInterval ls = AKDifferenceBetweenCoordiantedUniversalTimeAndAtomicTimeAtTimeIntervalSince1970(TAI);
    NSTimeInterval UTC = TAI-ls;
    return UTC;
}

NSTimeInterval AKDifferenceBetweenCoordiantedUniversalTimeAndAtomicTimeAtTimeIntervalSince1970(NSTimeInterval time)
{
    AKJulianDay JD = AKTimeIntervalSince1970ToJulianDay(time);
    double ls = [AKLeapSeconds leapSecondsAtJulianDay:JD];
    return ls;
}