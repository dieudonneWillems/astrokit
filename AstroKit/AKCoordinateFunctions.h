//
//  AKCoordinateFunctions.h
//  AstroKit
//
//  Created by Don Willems on 22/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#ifndef __ASTROKIT__COORDINATE_FUNCTIONS_
#define __ASTROKIT__COORDINATE_FUNCTIONS_

#import "AKTypes.h"

typedef enum {
    AKEquatorialCoordinateSystem,
    AKEclipticalCoordinateSystem,
    AKLocalHorizontalCoordinateSystem,
    AKLocalEquatorialCoordinateSystem,
    AKGalacticCoordinateSystem,
    AKExtraGalacticCoordinateSystem
} AKCoordinateSystem;

typedef struct __sphericalposition {
    AKAngle longitude;
    AKAngle latitude;
    double distance;
} AKPoint;

typedef struct __celestialposition {
    AKPoint point;
    AKEpoch equinox;
    AKEpoch epoch;
    AKCoordinateSystem system;
} AKCelestialPoint;

#endif
