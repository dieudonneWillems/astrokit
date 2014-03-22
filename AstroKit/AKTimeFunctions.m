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

NSTimeInterval AKGeocentricCoordinateTimeToTerrestrialTime(NSTimeInterval TCG)
{
    AKJulianDay JD = AKTimeIntervalSince1970ToJulianDay(TCG);
    return TCG-(6.969291e-10*(JD -2443144.5)*86400.);
}

NSTimeInterval AKTerrestrialTimeToGeocentricCoordinateTime(NSTimeInterval TT)
{
    AKJulianDay JD = AKTimeIntervalSince1970ToJulianDay(TT);
    return TT+6.969291e-10*(JD -2443144.5)*86400.;
}

AKEpoch AKJulianDayTerrestrialTimeToJulianYear(AKJulianDay JD)
{
    AKEpoch epoch;
    epoch.year = 2000.0+(JD-2451545.0)/365.25;
    epoch.system = AKJulianEpochSystem;
    return epoch;
}

AKEpoch AKJulianDayTerrestrialTimeToBesselianYear(AKJulianDay JD)
{
    AKEpoch epoch;
    epoch.year = 1950.0+(JD-2433282.4235)/365.2421988;
    epoch.system = AKBesselianEpochSystem;
    return epoch;
}

AKJulianDay AKEpochToJulianDayTerrestrialTime(AKEpoch epoch)
{
    if(epoch.system==AKJulianEpochSystem)
        return (epoch.year-2000.0)*365.25+2451545.0;
    if(epoch.system==AKBesselianEpochSystem)
        return (epoch.year-1950.0)*365.2421988+2433282.4235;
    return NSNotFound;
}

NSTimeInterval AKDifferenceBetweenCoordiantedUniversalTimeAndAtomicTimeAtTimeIntervalSince1970(NSTimeInterval time)
{
    AKJulianDay JD = AKTimeIntervalSince1970ToJulianDay(time);
    double ls = [AKLeapSeconds leapSecondsAtJulianDay:JD];
    return ls;
}

AKJulianCenturies AKJulianDayToJulianCenturies(AKJulianDay JD)
{
    return (JD-2451545.0)/36535;
}

AKJulianDay AKJulianCenturiesToJulianDay(AKJulianCenturies T)
{
    return (T*36535)+2451545.0;
}



NSString* AKStringFromEpoch(AKEpoch epoch)
{
    NSString *system = @"U";
    if(epoch.system==AKJulianEpochSystem) system=@"J";
    else if(epoch.system==AKBesselianEpochSystem) system=@"B";
    return [NSString stringWithFormat:@"%@%.1f",system,epoch.year];
}