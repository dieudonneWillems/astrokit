//
//  AKTypes.h
//  AstroKit
//
//  Created by Don Willems on 22/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#ifndef __ASTROKIT__UTIL_TYPES_
#define __ASTROKIT__UTIL_TYPES_

#import "AKTimeFunctions.h"

typedef double AKAngle;

typedef struct __geographicalposition {
    AKAngle longitude; // positive west of Greenwich
    AKAngle latitude;
    double elevation;
} AKGeographicalPoint;

/**
 * Creates a geographical point with a longitude and latitude in degrees
 * where the longitude is positive west of Greenwich and negative east of
 * Greenwich. Latitude is positive when north of the equator.
 * @param latitude The latitude in degrees, north is positive.
 * @param longitude The longitude in degrees, west is positive.
 * @param elevation The elevation of the point above the geoid in metres.
 * @return The geographical position.
 */
AKGeographicalPoint AKMakeGeographicalPoint(double latitude, double longitude, double elevation);

#endif