//
//  NSDate+AKTimeAdditions.h
//  AstroKit
//
//  Created by Don Willems on 19/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKTimeFunctions.h"

@interface NSDate (AKTimeAdditions)

/**
 * Creates and returns an NSDate object set to the date corresponding to the specified Julian Day.
 * @param JD The Julian Day.
 * @return An NSDate object set to the date corresponding to the Julian Day.
 */
+ (instancetype) dateWithJulianDay:(AKJulianDay)JD;

/**
 * Returns an <code>NSDate</code> object set to the date corresponding to the specified Julian Day.
 * @param JD The Julian Day
 * @return An NSDate object set to the date corresponding to the specified Julian Day.
 */
- (instancetype) initWithJulianDay:(AKJulianDay)JD;

/**
 * Calculates and returns the Julian Day corresponding to the receiver.
 * @return The Julian Day.
 */
- (AKJulianDay) julianDay;

@end
