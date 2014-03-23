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


#ifndef __ASTROKIT__TIME_FUNCTIONS_
#define __ASTROKIT__TIME_FUNCTIONS_

/**
 *  Calculates the mean sidereal time at Greenwich for the speficied
 *  date as expressed in the Julian Day in Universal Time (UT).
 * @param JD The Julian Day in UT.
 * @return The sidereal time at Greenwich.
 */
AKAngle AKMeanSiderealTimeAtGreenwich(AKJulianDay JD);

#endif