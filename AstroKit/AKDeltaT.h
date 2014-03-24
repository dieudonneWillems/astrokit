//
//  AKDeltaT.h
//  AstroKit
//
//  Created by Don Willems on 24/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKTimeFunctions.h"

@interface AKDeltaT : NSObject {
}

@property (readonly) AKJulianDay JD;
@property (readonly) double deltaT;

+ (double) deltaTAtJulianDay:(AKJulianDay)JD;

@end
