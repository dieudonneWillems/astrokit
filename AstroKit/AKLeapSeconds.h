//
//  AKLeapSeconds.h
//  AstroKit
//
//  Created by Don Willems on 20/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKTimeFunctions.h"

@interface AKLeapSeconds : NSObject

+ (double) leapSecondsAtJulianDay:(AKJulianDay)JD;
@end
