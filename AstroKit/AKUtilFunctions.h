//
//  AKUtilFunctions.h
//  AstroKit
//
//  Created by Don Willems on 19/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#ifndef __ASTROKIT__UTIL_FUNCTIONS_
#define __ASTROKIT__UTIL_FUNCTIONS_

#import "AKTypes.h"

/**
 * Normalises an angle expressed in radians. Normalisation of an angle
 * transforms the angle to the interval [0,2*PI).
 * @param angle The angle in radians to be normalised.
 * @return The normalised angle.
 */
AKAngle AKNormalizeAngle(AKAngle angle);

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
double AKRadiansToDegrees(AKAngle angle);

/**
 * Transforms an angle expressed in degrees to an angle in radians.
 * @param angle The angle in degrees.
 * @return The angle in radians.
 */
AKAngle AKDegreesToRadians(double angle);

/**
 * Returns the difference in radians between the first and second
 * angle. If the second angle is within [0,+PI] radians from the first
 * angle, the difference will be positive, if the second angle is within
 * (-PI,0) from the first, the result will be negative. The angles are
 * normalised before calculating the difference.
 * @param angle1 The first angle in radians.
 * @param angle2 The second angle in radians.
 * @return The angular difference between the two angles (-PI,PI].
 */
AKAngle AKAngularDifference(AKAngle angle1, AKAngle angle2);

/**
 * Returns the difference in degrees between the first and second
 * angle. If the second angle is within [0,180] degrees from the first
 * angle, the difference will be positive, if the second angle is within
 * (-180,0) from the first, the result will be negative. The angles are
 * normalised before calculating the difference.
 * @param angle1 The first angle in degrees.
 * @param angle2 The second angle in degrees.
 * @return The angular difference between the two angles (-180,180].
 */
double AKAngularDifferenceInDegrees(double angle1, double angle2);

/**
 * Creates a string from the specified angle in the HMS format,
 * used for right ascension.
 * For instance 13h23m12s234.
 * @param angle The angle in radians.
 * @return The string representation of the angle.
 */
NSString* AKHMSStringFromAngle(AKAngle angle);

/**
 * Creates a string from the specified angle (in degrees) in 
 * the HMS format, used for right ascension.
 * For instance 13h23m12s234.
 * @param angle The angle in degrees.
 * @return The string representation of the angle.
 */
NSString* AKHMSStringFromAngleInDegrees(double angle);

/**
 * Creates a string from the specified angle in
 * the DMS format, used for instance for declination.
 * For instance -23°15'22"3.
 * @param angle The angle in radians.
 * @return The string representation of the angle.
 */
NSString* AKDMSStringFromAngle(AKAngle angle);

/**
 * Creates a string from the specified angle (in degrees) in
 * the DMS format, used for instance for declination.
 * For instance -23°15'22"3.
 * @param angle The angle in degrees.
 * @return The string representation of the angle.
 */
NSString* AKDMSStringFromAngleInDegrees(double angle);

#endif