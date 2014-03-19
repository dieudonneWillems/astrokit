//
//  AKUtilFunctions.h
//  AstroKit
//
//  Created by Don Willems on 19/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#ifndef __ASTROKIT__UTIL_FUNCTIONS_
#define __ASTROKIT__UTIL_FUNCTIONS_

/**
 * Normalises an angle expressed in radians. Normalisation of an angle
 * transforms the angle to the interval [0,2*PI).
 * @param angle The angle in radians to be normalised.
 * @return The normalised angle.
 */
double AKNormalizeAngle(double angle);

/**
 * Normalises an angle expressed in degrees. Normalisation of an angle
 * transforms the angle to the interval [0,360).
 * @param angle The angle in radians to be normalised.
 * @return The normalised angle.
 */
double AKNormalizeAngleInDegrees(double angle);

/**
 * Transforms an angle expressed in radians to an angle in degrees.
 * @param angle The angle in radians.
 * @return The angle in degrees.
 */
double AKRadiansToDegrees(double angle);

/**
 * Transforms an angle expressed in degrees to an angle in radians.
 * @param angle The angle in degrees.
 * @return The angle in radians.
 */
double AKDegreesToRadians(double angle);

#endif