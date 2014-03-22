//
//  AKTypes.m
//  AstroKit
//
//  Created by Don Willems on 22/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import "AKTypes.h"

AKGeographicalPoint AKMakeGeographicalPoint(double latitude, double longitude, double elevation)
{
    AKGeographicalPoint p;
    p.latitude = latitude;
    p.longitude = longitude;
    p.elevation = elevation;
    return p;
}