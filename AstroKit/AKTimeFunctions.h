//
//  AKTime.h
//  AstroKit
//
//  Created by Don Willems on 19/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//



#ifndef __ASTROKIT__TIME_FUNCTIONS_
#define __ASTROKIT__TIME_FUNCTIONS_

/**
 * Converts a time interval since January 1, 1970 00:00 UT to its corresponding Julian Day.
 * @param time The time interval (in seconds) since 1 January 1970 0h UT.
 * @return The Julian Day.
 */
double AKTimeIntervalSince1970ToJulianDay(NSTimeInterval time);

/**
 * Converts a Julian Day to its corresponding time interval since January 1, 1970 00:00 UT.
 * @param JD The Julian Day.
 * @return The time interval (in seconds) since 1 January 1970 0h UT.
 */
NSTimeInterval AKJulianDayToTimeIntervalSince1970(double JD);

#endif
