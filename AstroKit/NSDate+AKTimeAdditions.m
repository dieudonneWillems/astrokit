//
//  NSDate+AKTimeAdditions.m
//  AstroKit
//
//  Created by Don Willems on 19/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import "NSDate+AKTimeAdditions.h"

@implementation NSDate (AKTimeAdditions)

+ (instancetype) dateWithJulianDay:(AKJulianDay)JD
{
    return [[NSDate alloc] initWithJulianDay:JD];
}

- (instancetype) initWithJulianDay:(AKJulianDay)JD
{
    NSTimeInterval ti = AKJulianDayToTimeIntervalSince1970(JD);
    self = [self initWithTimeIntervalSince1970:ti];
    return self;
}

- (AKJulianDay) julianDay
{
    return AKTimeIntervalSince1970ToJulianDay([self timeIntervalSince1970]);
}

@end
