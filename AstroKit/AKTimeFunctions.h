//
//  AKTime.h
//  AstroKit
//
//  Created by Don Willems on 19/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//



#ifndef __ASTROKIT__TIME_FUNCTIONS_
#define __ASTROKIT__TIME_FUNCTIONS_


typedef double AKJulianDay;

/**
 * Converts a time interval since January 1, 1970 00:00 UT to its corresponding Julian Day.
 * @param time The time interval (in seconds) since 1 January 1970 0h UT.
 * @return The Julian Day.
 */
AKJulianDay AKTimeIntervalSince1970ToJulianDay(NSTimeInterval time);

/**
 * Converts a Julian Day to its corresponding time interval since January 1, 1970 00:00 UT.
 * @param JD The Julian Day.
 * @return The time interval (in seconds) since 1 January 1970 0h UT.
 */
NSTimeInterval AKJulianDayToTimeIntervalSince1970(AKJulianDay JD);


/**
 * Converts terrestrial (dynamic) time (TT or TDT) to atomic time (TAI).
 * @param TT The time interval since 1970 in terrestrial time.
 * @return The time interval since 1970 in atomic time (TAI).
 */
NSTimeInterval AKTerrestrialTimeToAtomicTime(NSTimeInterval TT);

/**
 * Converts atomic time (TAI) to terrestrial (dynamic) time (TT or TDT).
 * @param TAI The time interval since 1970 in atomic time (TAI).
 * @return The time interval since 1970 in terrestrial time.
 */
NSTimeInterval AKAtomicTimeToTerrestrialTime(NSTimeInterval TAI);

/**
 * Converts coordinated universal time (UTC) to atomic time (TAI).
 * @param UTC The time interval since 1970 in coordinated universal time.
 * @return The time interval since 1970 in atomic time (TAI).
 */
NSTimeInterval AKCoordinatedUniversalTimeToAtomicTime(NSTimeInterval UTC);

/**
 * Converts atomic time (TAI) to coordinated universal time (UCT).
 * @param TAI The time interval since 1970 in atomic time (TAI).
 * @return The time interval since 1970 in coordinated universal time.
 */
NSTimeInterval AKAtomicTimeToCoordinatedUniversalTime(NSTimeInterval TAI);


#endif
