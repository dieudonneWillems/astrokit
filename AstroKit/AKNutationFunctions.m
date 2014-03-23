//
//  AKNutationFunctions.m
//  AstroKit
//
//  Created by Don Willems on 23/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import "AKNutationFunctions.h"
#import "AKNutationTerms.h"

AKNutation AKCalculateNutation(AKJulianCenturies T)
{
    // Angles are in degrees!
    
    double T2 = T*T;
    double T3 = T*T*T;
    
    // From Meeus, Chapter 22
    // Mean elongation of the Moon from the Sun
    double D = 297.85036 + 445267.111480*T - 0.0019142*T2 + T3/189474;
    // Mean anomaly of the Sun (Earth)
    double M = 357.52772 + 35999.050340*T - 0.0001603*T2 - T3/300000;
    // Mean anomaly of the Moon
    double Ma = 134.96298 + 477198.867398*T + 0.0086972*T2 + T3/56250;
    // Moon's argument of Latitude
    double F = 93.27191 + 483202.017538*T - 0.0036825*T2 + T3/327270;
    // Longitude of the ascending node of the Moon's mean orbit.
    double Omega = 125.04452 - 1934.136261*T + 0.0020708*T2 + T3/450000;
    
    AKNutation nutation = [AKNutationTerms calculateNutationWithD:D M:M   Ma:Ma F:F Omega:Omega atJulianCenturies:T];
    
    return nutation;
}