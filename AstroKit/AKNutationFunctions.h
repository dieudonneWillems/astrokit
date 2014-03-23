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


#endif