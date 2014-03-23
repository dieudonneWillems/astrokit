//
//  AKNutationTerms.h
//  AstroKit
//
//  Created by Don Willems on 23/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKNutationFunctions.h"

@interface AKNutationTerms : NSObject {
}

@property (readonly) int D;
@property (readonly) int M;
@property (readonly) int Ma;
@property (readonly) int F;
@property (readonly) int Omega;
@property (readonly) double lon1;
@property (readonly) double lon2;
@property (readonly) double obl1;
@property (readonly) double obl2;

+ (AKNutation) calculateNutationWithD:(double)D M:(double)M Ma:(double)Ma F:(double)F Omega:(double)Omega atJulianCenturies:(AKJulianCenturies)T;
@end
