//
//  NSDate+AKTimeAdditions.h
//  AstroKit
//
//  Created by Don Willems on 19/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKTimeFunctions.h"

@interface NSDate (AKTimeAdditions)

/**
 * Creates and returns an NSDate object set to the date corresponding to
 * the specified Julian Day.
 * @param JD The Julian Day.
 * @return An NSDate object set to the date corresponding to the Julian
 * Day.
 */
+ (instancetype) dateWithJulianDay:(AKJulianDay)JD;

/**
 * Creates and returns an NSDate object set to the date corresponding to
 * the specified Julian Day in Coordinated Universal Time (UTC).
 * @param JD The Julian Day.
 * @return An NSDate object set to the date corresponding to the Julian
 * Day.
 */
+ (instancetype) dateWithJulianDayCoordinatedUniversalTime:(AKJulianDay)JD;

/**
 * Creates and returns an NSDate object set to the date corresponding to
 * the specified Julian Day in Atomic Time (TAI).
 * @param JD The Julian Day.
 * @return An NSDate object set to the date corresponding to the Julian
 * Day.
 */
+ (instancetype) dateWithJulianDayAtomicTime:(AKJulianDay)JD;

/**
 * Creates and returns an NSDate object set to the date corresponding to
 * the specified Julian Day in Terrestrial Time (TT).
 * @param JD The Julian Day.
 * @return An NSDate object set to the date corresponding to the Julian
 * Day.
 */
+ (instancetype) dateWithJulianDayTerrestrialTime:(AKJulianDay)JD;

/**
 * Creates and returns an NSDate object set to the date corresponding to
 * the specified Julian Day in Geocentric Coordinate Time (TCG).
 * @param JD The Julian Day.
 * @return An NSDate object set to the date corresponding to the Julian
 * Day.
 */
+ (instancetype) dateWithJulianDayGeocentricCoordinateTime:(AKJulianDay)JD;

/**
 * Creates and returns an NSDate object set to the date corresonding to
 * the number of seconds since 1 January 1970 00:00:00 UTC (Coordinated
 * Universal Time).
 * @param UTC The number of seconds since 1970 in UTC.
 * @return An NSDate object set to the corresponding date.
 */
+ (instancetype) dateWithTimeIntervalSince1970CoordinatedUniversalTime:(NSTimeInterval)UTC;

/**
 * Creates and returns an NSDate object set to the date corresonding to
 * the number of seconds since 1 January 1970 00:00:00 TAI (International
 * Atomic Time).
 * @param TAI The number of seconds since 1970 in TAI.
 * @return An NSDate object set to the corresponding date.
 */
+ (instancetype) dateWithTimeIntervalSince1970AtomicTime:(NSTimeInterval)TAI;

/**
 * Creates and returns an NSDate object set to the date corresonding to
 * the number of seconds since 1 January 1970 00:00:00 TT (Terrestrial
 * Time).
 * @param TT The number of seconds since 1970 in TT.
 * @return An NSDate object set to the corresponding date.
 */
+ (instancetype) dateWithTimeIntervalSince1970TerrestrialTime:(NSTimeInterval)TT;

/**
 * Creates and returns an NSDate object set to the date corresonding to
 * the number of seconds since 1 January 1970 00:00:00 TCG (Geocentric
 * Coordinate Time).
 * @param TCG The number of seconds since 1970 in TCG.
 * @return An NSDate object set to the corresponding date.
 */
+ (instancetype) dateWithTimeIntervalSince1970GeocentricCoordinateTime:(NSTimeInterval)TCG;

/**
 * Returns an <code>NSDate</code> object set to the date corresponding to
 * the specified Julian Day.
 * @param JD The Julian Day
 * @return An NSDate object set to the date corresponding to the specified
 * Julian Day.
 */
- (instancetype) initWithJulianDay:(AKJulianDay)JD;

/**
 * Returns an <code>NSDate</code> object set to the date corresponding to
 * the specified Julian Day in Coordinated Universal Time (UTC).
 * @param JD The Julian Day
 * @return An NSDate object set to the date corresponding to the specified
 * Julian Day.
 */
- (instancetype) initWithJulianDayCoordinateUniversalTime:(AKJulianDay)JD;

/**
 * Returns an <code>NSDate</code> object set to the date corresponding to
 * the specified Julian Day in International Atomic Time (TAI).
 * @param JD The Julian Day
 * @return An NSDate object set to the date corresponding to the specified
 * Julian Day.
 */
- (instancetype) initWithJulianDayAtomicTime:(AKJulianDay)JD;

/**
 * Returns an <code>NSDate</code> object set to the date corresponding to
 * the specified Julian Day in Terrestrial Time (TT).
 * @param JD The Julian Day
 * @return An NSDate object set to the date corresponding to the specified
 * Julian Day.
 */
- (instancetype) initWithJulianDayTerrestrialTime:(AKJulianDay)JD;

/**
 * Returns an <code>NSDate</code> object set to the date corresponding to
 * the specified Julian Day in Geocentric Coordinate Time (TCG).
 * @param JD The Julian Day
 * @return An NSDate object set to the date corresponding to the specified
 * Julian Day.
 */
- (instancetype) initWithJulianDayGeocentricCoordinateTime:(AKJulianDay)JD;

/**
 * Returns an <code>NSDate</code> object set to the number of seconds
 * in Coordinated Universal Time (UTC) corresponding to the given
 * number of seconds since 1 January 1970. This method is equivalent
 * to <code>initWithTimeIntervalSince1970</code>.
 * @param UTC The number of seconds since 1970 in UTC.
 * @return An <code>NSDate</code> object set to the specified time.
 */
- (instancetype) initWithTimeIntervalSince1970CoordinatedUniversalTime:(NSTimeInterval)UTC;

/**
 * Returns an <code>NSDate</code> object set to the number of seconds
 * in Coordinated Universal Time (UTC) corresponding to the given
 * number of seconds since 1 January 1970 in International Atomic Time 
 * (TAI).
 * @param TAI The number of seconds since 1970 in TAI.
 * @return An <code>NSDate</code> object set to the specified time.
 */
- (instancetype) initWithTimeIntervalSince1970AtomicTime:(NSTimeInterval)TAI;

/**
 * Returns an <code>NSDate</code> object set to the number of seconds
 * in Coordinated Universal Time (UTC) corresponding to the given
 * number of seconds since 1 January 1970 in Terrestrial Time
 * (TT).
 * @param TT The number of seconds since 1970 in TT.
 * @return An <code>NSDate</code> object set to the specified time.
 */
- (instancetype) initWithTimeIntervalSince1970TerrestrialTime:(NSTimeInterval)TT;

/**
 * Returns an <code>NSDate</code> object set to the number of seconds
 * in Coordinated Universal Time (UTC) corresponding to the given
 * number of seconds since 1 January 1970 in Geocentric Coordinate Time
 * (TCG).
 * @param TCG The number of seconds since 1970 in TCG.
 * @return An <code>NSDate</code> object set to the specified time.
 */
- (instancetype) initWithTimeIntervalSince1970GeocentricCoordinateTime:(NSTimeInterval)TCG;

/**
 * Calculates and returns the Julian Day (JD) in UTC corresponding to the
 * receiver.
 * @return The Julian Day.
 */
- (AKJulianDay) julianDay;

/**
 * Calculates and returns the Julian Day (JD) in Coordinated Universal Time
 * (UTC) corresponding to the receiver.
 * @return The Julian Day.
 */
- (AKJulianDay) julianDayCoordinatedUniversalTime;

/**
 * Calculates and returns the Julian Day (JD) in International Atomic
 * Time (TAI) corresponding to the receiver.
 * @return The Julian Day.
 */
- (AKJulianDay) julianDayAtomicTime;

/**
 * Calculates and returns the Julian Day (JD) in Terrestrial
 * Time (TT) corresponding to the receiver.
 * @return The Julian Day.
 */
- (AKJulianDay) julianDayTerrestrialTime;

/**
 * Calculates and returns the Julian Day (JD) in Geocentric
 * Coordinate Time (TCG) corresponding to the receiver.
 * @return The Julian Day.
 */
- (AKJulianDay) julianDayGeocentricCoordinateTime;

/**
 * Calculates and returns the Modified Julian Day (MJD) in UTC
 * corresponding to the receiver.
 * @return The Modified Julian Day.
 */
- (AKModifiedJulianDay) modifiedJulianDay;

/**
 * Time interval since 1 January 1970 00:00:00 TAI (Coordinated
 * Universal Time).
 * @return The number of seconds in TAI.
 */
- (NSTimeInterval) timeIntervalSince1970CoordinatedUniversalTime;

/**
 * Time interval since 1 January 1970 00:00:00 TAI (International 
 * Atomic Time).
 * @return The number of seconds in TAI.
 */
- (NSTimeInterval) timeIntervalSince1970AtomicTime;

/**
 * Time interval since 1 January 1970 00:00:00 TT (Terrestrial Time).
 * @return The number of seconds in TT.
 */
- (NSTimeInterval) timeIntervalSince1970TerrestrialTime;

/**
 * Time interval since 1 January 1970 00:00:00 TCG (Geocentric 
 * Coordinate Time).
 * @return The number of seconds in TCG.
 */
- (NSTimeInterval) timeIntervalSince1970GeocentricCoordinateTime;

@end
