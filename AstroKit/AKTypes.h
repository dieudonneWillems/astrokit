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
    AKAngle longitude;
    AKAngle latitude;
    double elevation;
} AKGeographicalPoint;


#endif