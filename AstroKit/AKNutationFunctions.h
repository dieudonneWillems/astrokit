//
//  AKNutationFunctions.h
//  AstroKit
//
//  Created by Don Willems on 23/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "AKTypes.h"
#import "AKTimeFunctions.h"

#ifndef __ASTROKIT__NUTATION_FUNCTIONS_
#define __ASTROKIT__NUTATION_FUNCTIONS_

typedef struct __nutation{
    AKAngle longitude;
    AKAngle obliquity;
} AKNutation;

/**
 * Calculates the nutation for the time corresponding with the
 * specified number of Julian Centuries in Terrestrial Time.
 * @param T The number of Julian Centuries.
 * @return The nutation.
 */
AKNutation AKCalculateNutation(AKJulianCenturies T);

/**
 * Calculates the mean Obliquity of the Ecliptic (not corrected for
 * nutation) at the specified date as
 * expressed in Julian Centuries (Terrestrial Time). It is the same
 * angle as the inclination of the Earth's axis of rotation, or the angle
 * between the ecliptic and the equator. It is also the angle of the
 * maximum extend of the Sun, above, or below the equator, i.e. the
 * latitude of the tropics of Cancer and Capricorn.
 * @param T The number of Julian Centuries.
 * @return The mean obliquity of the ecliptic.
 */
AKAngle AKCalculateMeanObliquityOfTheEcliptic(AKJulianCenturies T);

/**
 * Calculates the true Obliquity of the Ecliptic (corrected for
 * nutation) at the specified date as
 * expressed in Julian Centuries (Terrestrial Time). It is the same
 * angle as the inclination of the Earth's axis of rotation, or the angle
 * between the ecliptic and the equator. It is also the angle of the
 * maximum extend of the Sun, above, or below the equator, i.e. the
 * latitude of the tropics of Cancer and Capricorn.
 * @param T The number of Julian Centuries.
 * @return The mean obliquity of the ecliptic.
 */
AKAngle AKCalculateTrueObliquityOfTheEcliptic(AKJulianCenturies T);

/**
 * Calculates the true Obliquity of the Ecliptic (corrected for
 * nutation) at the specified date as
 * expressed in Julian Centuries (Terrestrial Time). It is the same
 * angle as the inclination of the Earth's axis of rotation, or the angle
 * between the ecliptic and the equator. It is also the angle of the
 * maximum extend of the Sun, above, or below the equator, i.e. the
 * latitude of the tropics of Cancer and Capricorn.
 * @param T The number of Julian Centuries.
 * @param nutation The nutation at the specified date.
 * @return The mean obliquity of the ecliptic.
 */
AKAngle AKCalculateTrueObliquityOfTheEclipticWithNutation(AKJulianCenturies T, AKNutation nutation);


#endif