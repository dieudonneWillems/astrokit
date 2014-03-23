//
//  AKSiderealTime.h
//  AstroKit
//
//  Created by Don Willems on 23/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//


#import "AKTimeFunctions.h"
#import "AKTypes.h"
#import "AKUtilFunctions.h"


#ifndef __ASTROKIT__SID_TIME_FUNCTIONS_
#define __ASTROKIT__SID_TIME_FUNCTIONS_

/**
 *  Calculates the mean sidereal time at Greenwich for the speficied
 *  date as expressed in the Julian Day in Universal Time (UT) in
 *  radians.
 *  The mean sidereal time is not corrected for nutation.
 * @param JD The Julian Day in UT.
 * @return The sidereal time at Greenwich in radians.
 */
AKAngle AKMeanSiderealTimeAtGreenwich(AKJulianDay JD);

/**
 *  Calculates the mean sidereal time at Greenwich for the speficied
 *  date as expressed in the Julian Day in Universal Time (UT) in
 *  degrees.
 *  The mean sidereal time is not corrected for nutation.
 * @param JD The Julian Day in UT.
 * @return The sidereal time at Greenwich in degrees.
 */
double AKMeanSiderealTimeAtGreenwichInDegrees(AKJulianDay JD);

/**
 *  Calculates the mean sidereal time for the speficied location and
 *  date as expressed in the Julian Day in Universal Time (UT) in
 *  radians.
 *  The mean sidereal time is not corrected for nutation.
 * @param JD The Julian Day in UT.
 * @param location The geographical location.
 * @return The sidereal time at Greenwich in radians.
 */
AKAngle AKMeanSiderealTime(AKJulianDay JD,AKGeographicalPoint location);

/**
 *  Calculates the mean sidereal time for the speficied location and
 *  date as expressed in the Julian Day in Universal Time (UT) in
 *  degrees.
 *  The mean sidereal time is not corrected for nutation.
 * @param JD The Julian Day in UT.
 * @param location The geographical location.
 * @return The sidereal time at Greenwich in degrees.
 */
double AKMeanSiderealTimeInDegrees(AKJulianDay JD,AKGeographicalPoint location);

/**
 *  Calculates the apparent sidereal time at Greenwich for the speficied
 *  date as expressed in the Julian Day in Universal Time (UT) in
 *  radians.
 *  The apparent sidereal time is corrected for nutation.
 * @param JD The Julian Day in UT.
 * @return The sidereal time at Greenwich in radians.
 */
AKAngle AKApparentSiderealTimeAtGreenwich(AKJulianDay JD);

/**
 *  Calculates the apparent sidereal time at Greenwich for the speficied
 *  date as expressed in the Julian Day in Universal Time (UT) in
 *  degrees.
 *  The apparent sidereal time is corrected for nutation.
 * @param JD The Julian Day in UT.
 * @return The sidereal time at Greenwich in degrees.
 */
double AKApparentSiderealTimeAtGreenwichInDegrees(AKJulianDay JD);

/**
 *  Calculates the apparent sidereal time for the speficied location and
 *  date as expressed in the Julian Day in Universal Time (UT) in
 *  radians.
 *  The apparent sidereal time is corrected for nutation.
 * @param JD The Julian Day in UT.
 * @param location The geographical location.
 * @return The sidereal time at Greenwich in radians.
 */
AKAngle AKApparentSiderealTime(AKJulianDay JD,AKGeographicalPoint location);

/**
 *  Calculates the apparent sidereal time for the speficied location and
 *  date as expressed in the Julian Day in Universal Time (UT) in
 *  degrees.
 *  The apparent sidereal time is corrected for nutation.
 * @param JD The Julian Day in UT.
 * @param location The geographical location.
 * @return The sidereal time at Greenwich in degrees.
 */
AKAngle AKApparentSiderealTimeInDegrees(AKJulianDay JD,AKGeographicalPoint location);

#endif