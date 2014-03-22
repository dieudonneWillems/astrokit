//
//  NSDate+AKTimeAdditions.m
//  AstroKit
//
//  Created by Don Willems on 19/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import "NSDate+AKTimeAdditions.h"

@implementation NSDate (AKTimeAdditions)

+ (instancetype) dateWithJulianDay:(AKJulianDay)JD
{
    return [[NSDate alloc] initWithJulianDay:JD];
}

+ (instancetype) dateWithJulianDayCoordinatedUniversalTime:(AKJulianDay)JD
{
    return [[NSDate alloc] initWithJulianDayCoordinateUniversalTime:JD];
}

+ (instancetype) dateWithJulianDayAtomicTime:(AKJulianDay)JD
{
    return [[NSDate alloc] initWithJulianDayAtomicTime:JD];
}

+ (instancetype) dateWithJulianDayTerrestrialTime:(AKJulianDay)JD
{
    return [[NSDate alloc] initWithJulianDayTerrestrialTime:JD];
}

+ (instancetype) dateWithJulianDayGeocentricCoordinateTime:(AKJulianDay)JD
{
    return [[NSDate alloc] initWithJulianDayGeocentricCoordinateTime:JD];
}

+ (instancetype) B1900
{
    return [NSDate dateWithBesselianYear:1900];
}

+ (instancetype) B1950
{
    return [NSDate dateWithBesselianYear:1950];
}

+ (instancetype) J2000;
{
    return [NSDate dateWithJulianYear:2000];
}

+ (instancetype) J2050
{
    return [NSDate dateWithJulianYear:2050];
}

+ (instancetype) dateWithJulianYear:(double)year
{
    AKEpoch epoch;
    epoch.system = AKJulianEpochSystem;
    epoch.year = year;
    return [self dateWithEpoch:epoch];
}

+ (instancetype) dateWithBesselianYear:(double)year
{
    AKEpoch epoch;
    epoch.system = AKBesselianEpochSystem;
    epoch.year = year;
    return [self dateWithEpoch:epoch];
}

+ (instancetype) dateWithEpoch:(AKEpoch)epoch
{
    AKJulianDay JDE = AKEpochToJulianDayTerrestrialTime(epoch);
    return [NSDate dateWithJulianDayTerrestrialTime:JDE];
}

+ (instancetype) dateWithTimeIntervalSince1970CoordinatedUniversalTime:(NSTimeInterval)UTC
{
    return [NSDate dateWithTimeIntervalSince1970:UTC];
}

+ (instancetype) dateWithTimeIntervalSince1970AtomicTime:(NSTimeInterval)TAI
{
    NSTimeInterval UTC = AKAtomicTimeToCoordinatedUniversalTime(TAI);
    return [NSDate dateWithTimeIntervalSince1970:UTC];
}

+ (instancetype) dateWithTimeIntervalSince1970TerrestrialTime:(NSTimeInterval)TT
{
    NSTimeInterval TAI = AKTerrestrialTimeToAtomicTime(TT);
    return [NSDate dateWithTimeIntervalSince1970AtomicTime:TAI];
}

+ (instancetype) dateWithTimeIntervalSince1970GeocentricCoordinateTime:(NSTimeInterval)TCG
{
    NSTimeInterval TT = AKGeocentricCoordinateTimeToTerrestrialTime(TCG);
    return [NSDate dateWithTimeIntervalSince1970TerrestrialTime:TT];
}

- (instancetype) initWithJulianDay:(AKJulianDay)JD
{
    NSTimeInterval ti = AKJulianDayToTimeIntervalSince1970(JD);
    self = [self initWithTimeIntervalSince1970:ti];
    return self;
}

- (instancetype) initWithJulianDayCoordinateUniversalTime:(AKJulianDay)JD
{
    NSTimeInterval UTC = AKJulianDayToTimeIntervalSince1970(JD);
    self = [self initWithTimeIntervalSince1970CoordinatedUniversalTime:UTC];
    return self;
}

- (instancetype) initWithJulianDayAtomicTime:(AKJulianDay)JD
{
    NSTimeInterval TAI = AKJulianDayToTimeIntervalSince1970(JD);
    self = [self initWithTimeIntervalSince1970AtomicTime:TAI];
    return self;
}

- (instancetype) initWithJulianDayTerrestrialTime:(AKJulianDay)JD
{
    NSTimeInterval TT = AKJulianDayToTimeIntervalSince1970(JD);
    self = [self initWithTimeIntervalSince1970TerrestrialTime:TT];
    return self;
}

- (instancetype) initWithJulianDayGeocentricCoordinateTime:(AKJulianDay)JD
{
    NSTimeInterval TCG = AKJulianDayToTimeIntervalSince1970(JD);
    self = [self initWithTimeIntervalSince1970GeocentricCoordinateTime:TCG];
    return self;
}

- (instancetype) initWithJulianYear:(double)year
{
    AKEpoch epoch;
    epoch.system = AKJulianEpochSystem;
    epoch.year = year;
    return [self initWithEpoch:epoch];
}

- (instancetype) initWithBesselianYear:(double)year
{
    AKEpoch epoch;
    epoch.system = AKBesselianEpochSystem;
    epoch.year = year;
    return [self initWithEpoch:epoch];
}

- (instancetype) initWithEpoch:(AKEpoch)epoch
{
    AKJulianDay JDE = AKEpochToJulianDayTerrestrialTime(epoch);
    return [self initWithJulianDayTerrestrialTime:JDE];
}

- (instancetype) initWithTimeIntervalSince1970CoordinatedUniversalTime:(NSTimeInterval)UTC
{
    self = [self initWithTimeIntervalSince1970:UTC];
    return self;
}

- (instancetype) initWithTimeIntervalSince1970AtomicTime:(NSTimeInterval)TAI
{
    NSTimeInterval UTC = AKAtomicTimeToCoordinatedUniversalTime(TAI);
    self = [self initWithTimeIntervalSince1970CoordinatedUniversalTime:UTC];
    return self;
}

- (instancetype) initWithTimeIntervalSince1970TerrestrialTime:(NSTimeInterval)TT
{
    NSTimeInterval TAI = AKTerrestrialTimeToAtomicTime(TT);
    self = [self initWithTimeIntervalSince1970AtomicTime:TAI];
    return self;
}

- (instancetype) initWithTimeIntervalSince1970GeocentricCoordinateTime:(NSTimeInterval)TCG
{
    NSTimeInterval TT = AKGeocentricCoordinateTimeToTerrestrialTime(TCG);
    self = [self initWithTimeIntervalSince1970TerrestrialTime:TT];
    return self;
}

- (AKJulianDay) julianDay
{
    return AKTimeIntervalSince1970ToJulianDay([self timeIntervalSince1970]);
}

- (AKJulianDay) julianDayCoordinatedUniversalTime
{
    return AKTimeIntervalSince1970ToJulianDay([self timeIntervalSince1970CoordinatedUniversalTime]);
}

- (AKJulianDay) julianDayAtomicTime
{
    return AKTimeIntervalSince1970ToJulianDay([self timeIntervalSince1970AtomicTime]);
}

- (AKJulianDay) julianDayTerrestrialTime
{
    return AKTimeIntervalSince1970ToJulianDay([self timeIntervalSince1970TerrestrialTime]);
}

- (AKJulianDay) julianDayGeocentricCoordinateTime
{
    return AKTimeIntervalSince1970ToJulianDay([self timeIntervalSince1970GeocentricCoordinateTime]);
}

- (AKModifiedJulianDay) modifiedJulianDay
{
    return AKTimeIntervalSince1970ToModifiedJulianDay([self timeIntervalSince1970]);
}

- (AKEpoch) julianYear
{
    AKJulianDay JDE = [self julianDayTerrestrialTime];
    return AKJulianDayTerrestrialTimeToJulianYear(JDE);
}

- (AKEpoch) besselianYear
{
    AKJulianDay JDE = [self julianDayTerrestrialTime];
    return AKJulianDayTerrestrialTimeToBesselianYear(JDE);
}

- (AKEpoch) epoch
{
    NSTimeInterval ti = [self timeIntervalSince1970];
    if(ti<441763200) return [self besselianYear];
    return [self julianYear];
}

- (NSTimeInterval) timeIntervalSince1970CoordinatedUniversalTime
{
    return [self timeIntervalSince1970];
}

- (NSTimeInterval) timeIntervalSince1970AtomicTime
{
    NSTimeInterval UTC = [self timeIntervalSince1970];
    return AKCoordinatedUniversalTimeToAtomicTime(UTC);
}

- (NSTimeInterval) timeIntervalSince1970TerrestrialTime
{
    NSTimeInterval TAI = [self timeIntervalSince1970AtomicTime];
    return AKAtomicTimeToTerrestrialTime(TAI);
}

- (NSTimeInterval) timeIntervalSince1970GeocentricCoordinateTime
{
    NSTimeInterval TT = [self timeIntervalSince1970TerrestrialTime];
    return AKTerrestrialTimeToGeocentricCoordinateTime(TT);
}
@end
