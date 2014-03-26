//
//  NSDate+AKTimeAdditions.m
//  AstroKit
//
//  Created by Don Willems on 19/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import "NSDate+AKTimeAdditions.h"

static AKDateFormatter *__formatter;

@implementation NSDate (AKTimeAdditions)

+ (instancetype) dateFromStringWithTimeSystem:(NSString*)datestring
{
    if(!__formatter) __formatter = [[AKDateFormatter alloc] init];
    return [__formatter dateFromString:datestring];
}

+ (instancetype) dateWithJulianDay:(AKJulianDay)JD
{
    return [[NSDate alloc] initWithJulianDay:JD];
}

+ (instancetype) dateWithJulianDayCoordinatedUniversalTime:(AKJulianDay)JD
{
    return [[NSDate alloc] initWithJulianDayCoordinatedUniversalTime:JD];
}

+ (instancetype) dateWithJulianDayUniversalTime:(AKJulianDay)JD
{
    return [[NSDate alloc] initWithJulianDayUniversalTime:JD];
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

+ (instancetype) dateWithJulianCenturiesUniversalTime:(AKJulianCenturies)T
{
    AKJulianDay JD = AKJulianCenturiesToJulianDay(T);
    return [NSDate dateWithJulianDayUniversalTime:JD];
}

+ (instancetype) dateWithJulianCenturiesTerrestrialTime:(AKJulianCenturies)T
{
    AKJulianDay JD = AKJulianCenturiesToJulianDay(T);
    return [NSDate dateWithJulianDayTerrestrialTime:JD];
}

+ (instancetype) dateWithTimeIntervalSince1970CoordinatedUniversalTime:(NSTimeInterval)UTC
{
    return [NSDate dateWithTimeIntervalSince1970:UTC];
}

+ (instancetype) dateWithTimeIntervalSince1970UniversalTime:(NSTimeInterval)UT1
{
    NSTimeInterval TT = AKUniversalTimeToTerrestrialTime(UT1);
    return [self dateWithTimeIntervalSince1970TerrestrialTime:TT];
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

- (instancetype) initFromStringWithTimeSystem:(NSString*)datestring
{
    if(!__formatter) __formatter = [[AKDateFormatter alloc] init];
    self = [__formatter dateFromString:datestring];
    return self;
}

- (instancetype) initWithJulianDay:(AKJulianDay)JD
{
    NSTimeInterval ti = AKJulianDayToTimeIntervalSince1970(JD);
    self = [self initWithTimeIntervalSince1970:ti];
    return self;
}

- (instancetype) initWithJulianDayCoordinatedUniversalTime:(AKJulianDay)JD
{
    NSTimeInterval UTC = AKJulianDayToTimeIntervalSince1970(JD);
    self = [self initWithTimeIntervalSince1970CoordinatedUniversalTime:UTC];
    return self;
}

- (instancetype) initWithJulianDayUniversalTime:(AKJulianDay)JD
{
    NSTimeInterval UT1 = AKJulianDayToTimeIntervalSince1970(JD);
    NSTimeInterval TT = AKUniversalTimeToTerrestrialTime(UT1);
    self = [self initWithTimeIntervalSince1970TerrestrialTime:TT];
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

- (instancetype) initWithJulianCenturiesUniversalTime:(AKJulianCenturies)T
{
    AKJulianDay JD = AKJulianCenturiesToJulianDay(T);
    return [self initWithJulianDayUniversalTime:JD];
}

- (instancetype) initWithJulianCenturiesTerrestrialTime:(AKJulianCenturies)T
{
    AKJulianDay JD = AKJulianCenturiesToJulianDay(T);
    return [self initWithJulianDayTerrestrialTime:JD];
}

- (instancetype) initWithTimeIntervalSince1970CoordinatedUniversalTime:(NSTimeInterval)UTC
{
    self = [self initWithTimeIntervalSince1970:UTC];
    return self;
}

- (instancetype) initWithTimeIntervalSince1970UniversalTime:(NSTimeInterval)UT1
{
    NSTimeInterval TT = AKUniversalTimeToTerrestrialTime(UT1);
    self = [self initWithTimeIntervalSince1970TerrestrialTime:TT];
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

- (NSString*) descriptionWithTimeSystem:(AKTimeSystem)system
{
    if(!__formatter) __formatter = [[AKDateFormatter alloc] init];
    [__formatter setTimeSystem:system];
    return [__formatter stringFromDate:self];
}

- (AKJulianDay) julianDay
{
    return AKTimeIntervalSince1970ToJulianDay([self timeIntervalSince1970]);
}

- (AKJulianDay) julianDayCoordinatedUniversalTime
{
    return AKTimeIntervalSince1970ToJulianDay([self timeIntervalSince1970CoordinatedUniversalTime]);
}

- (AKJulianDay) julianDayUniversalTime
{
    return AKTimeIntervalSince1970ToJulianDay([self timeIntervalSince1970UniversalTime]);
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

- (AKJulianCenturies) julianCenturiesUniversalTime
{
    AKJulianDay JD = [self julianDayUniversalTime];
    return AKJulianDayToJulianCenturies(JD);
}

- (AKJulianCenturies) julianCenturiesTerrestrialTime
{
    AKJulianDay JD = [self julianDayTerrestrialTime];
    return AKJulianDayToJulianCenturies(JD);
}

- (NSTimeInterval) timeIntervalSince1970CoordinatedUniversalTime
{
    return [self timeIntervalSince1970];
}

- (NSTimeInterval) timeIntervalSince1970UniversalTime
{
    NSTimeInterval TT = [self timeIntervalSince1970TerrestrialTime];
    return AKTerrestrialTimeToUniversalTime(TT);
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
