//
//  AKCoordinateFunctions.h
//  AstroKit
//
//  Created by Don Willems on 22/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#ifndef __ASTROKIT__COORDINATE_FUNCTIONS_
#define __ASTROKIT__COORDINATE_FUNCTIONS_

#import "AKTimeFunctions.h"

typedef struct __sphericalposition {
    double longitude;
    double latitude;
    double distance;
} AKPoint;

typedef struct __celestialposition {
    AKPoint point;
    AKEpoch equinox;
    AKEpoch epoch;
} AKCelestialPoint;

#endif
