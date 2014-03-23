//
//  AstroKitTests.m
//  AstroKitTests
//
//  Created by Don Willems on 19/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AstroKit/AstroKit.h>

@interface AstroKitTests : XCTestCase

@end

@implementation AstroKitTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testNutation
{
    NSDate *date = [NSDate dateWithString:@"1987-04-10 00:00:00 +0000"];
    AKJulianCenturies T = [date julianCenturies];
    AKNutation nutation = AKCalculateNutation(T);
    double rpi = 180./M_PI;
    double lonas = nutation.longitude*rpi*3600;
    double oblas = nutation.obliquity*rpi*3600;
    NSLog(@"Nutation in longitude: %f\"",lonas);
    NSLog(@"Nutation in obliquity: %f\"",oblas);
    XCTAssertTrue(fabs(lonas+3.788)<0.001, @"Test nutation in longitude at 1987-04-10");
    XCTAssertTrue(fabs(oblas-9.443)<0.001, @"Test nutation in longitude at 1987-04-10");
}

- (void) testSiderealTime
{
    AKGeographicalPoint USNO = AKMakeGeographicalPointInDegrees(38.9213888889, 77.0654166667, 5);
    NSDate *date = [NSDate dateWithString:@"1987-04-10 00:00:00 +0000"];
    AKJulianDay JD = [date julianDayCoordinatedUniversalTime];
    double theta0 = AKMeanSiderealTimeAtGreenwichInDegrees(JD);
    XCTAssertTrue(fabs(theta0-197.693195)<0.000001, @"Test mean sidereal time at Greenwich at 0h UT 10 April 1987   theta0=%f",theta0);
    double theta = AKApparentSiderealTimeAtGreenwichInDegrees(JD);
    NSLog(@"   Theta = %@",AKHMSStringFromAngleInDegrees(theta));
    NSLog(@"   197.5008 = %@",AKHMSStringFromAngleInDegrees(197.5008));
    XCTAssertTrue(fabs(theta-197.6922295833543537)<0.000001, @"Test mean sidereal time at Greenwich at 0h UT 10 April 1987   theta=%f",theta);
    date = [NSDate dateWithString:@"1987-04-10 19:21:00 +0000"];
    JD = [date julianDayCoordinatedUniversalTime];
    theta0 = AKMeanSiderealTimeAtGreenwichInDegrees(JD);
    XCTAssertTrue(fabs(theta0-128.7378734)<0.000001, @"Test mean sidereal time at Greenwich at 0h UT 10 April 1987");
    theta = AKApparentSiderealTimeInDegrees(JD, USNO);
    NSLog(@"   Theta = %@",AKHMSStringFromAngleInDegrees(theta));
    NSLog(@"   51.6714708333 = %@",AKHMSStringFromAngleInDegrees(51.6714708333));
    NSLog(@"   long = %@",AKHMSStringFromAngleInDegrees(77.0655555556));
    XCTAssertTrue(fabs(theta-51.6714708333)<0.000001, @"Test apparent sidereal time at Greenwich at 19:21 UT 10 April 1987   theta=%f",theta);
}

- (void) testTimeConversions
{
    NSDate *date = [NSDate dateWithString:@"2014-03-21 19:26:24 +0000"];
    NSTimeInterval utc = [date timeIntervalSince1970];
    XCTAssertEqual(AKDifferenceBetweenCoordiantedUniversalTimeAndAtomicTimeAtTimeIntervalSince1970(utc), 35., @"TAI-UTC in March 2014");
    NSTimeInterval tai = AKCoordinatedUniversalTimeToAtomicTime(utc);
    NSDate *dateTAI = [NSDate dateWithTimeIntervalSince1970:tai];
    NSLog(@"TAI: %@",dateTAI);
    date = [NSDate dateWithString:@"1976-03-21 19:26:24 +0000"];
    utc = [date timeIntervalSince1970];
    XCTAssertEqual(AKDifferenceBetweenCoordiantedUniversalTimeAndAtomicTimeAtTimeIntervalSince1970(utc), 16., @"TAI-UTC in March 2014");
    date = [NSDate dateWithString:@"1982-11-21 19:26:24 +0000"];
    utc = [date timeIntervalSince1970];
    XCTAssertEqual(AKDifferenceBetweenCoordiantedUniversalTimeAndAtomicTimeAtTimeIntervalSince1970(utc), 22., @"TAI-UTC in March 2014");
    
    NSTimeInterval tt = [date timeIntervalSince1970TerrestrialTime];
    NSTimeInterval tcg = AKTerrestrialTimeToGeocentricCoordinateTime(tt);
    NSTimeInterval tt2 = AKGeocentricCoordinateTimeToTerrestrialTime(tcg);
    XCTAssertEqual(tt, tt2, @"Conversion from TT to TCG and back.");
    
    NSDate *B1950 = [NSDate B1950];
    XCTAssertEqual([B1950 julianDayTerrestrialTime], 2433282.4235, @"Testing the Julian date (TT) for B1950.0.");
    NSDate *J2000 = [NSDate J2000];
    XCTAssertEqual([J2000 julianDayTerrestrialTime], 2451545.00, @"Testing the Julian date (TT) for J2000.0.");
    NSDate *B2000 = [NSDate dateWithBesselianYear:2000.];
    XCTAssertNotEqual([J2000 julianDayTerrestrialTime], [B2000 julianDayTerrestrialTime], @"Testing (non) equality of B2000.0 and J2000.0.");
    XCTAssertTrue([@"B2000.0" isEqualToString:AKStringFromEpoch([B2000 besselianYear])], @"Testing string representation for epoch B2000.0");
    NSLog(@"Epoch for %@ is %@",date,AKStringFromEpoch([date epoch]));
    date = [NSDate dateWithString:@"1983-12-31 00:00:00 +0000"];
    NSLog(@"Epoch for %@ is %@",date,AKStringFromEpoch([date epoch]));
    date = [NSDate dateWithString:@"1984-01-01 00:00:00 +0000"];
    NSLog(@"Epoch for %@ is %@",date,AKStringFromEpoch([date epoch]));
}

- (void) testJulianDayConversion
{
    double jd = 2440587.500000;
    double ti = AKJulianDayToTimeIntervalSince1970(jd);
    XCTAssertEqual(ti, 0.0, @"Conversion from Julian day to time interval did not result in correct value.");
    double njd = AKTimeIntervalSince1970ToJulianDay(ti);
    XCTAssertEqual(jd, njd, @"Conversion from time interval to julian day did not result in correct value.");
    NSDate *date = [NSDate dateWithString:@"1957-10-04 19:26:24 +0000"];
    NSTimeInterval dti = [date timeIntervalSince1970];
    njd = AKTimeIntervalSince1970ToJulianDay(dti);
    NSLog(@"Launch of Sputnik date = %@  ti=%f  JD=%f",date,dti,njd);
    XCTAssertEqual(njd, 2436116.31, @"Launch of Sputnik");
    NSTimeInterval nti = AKJulianDayToTimeIntervalSince1970(njd);
    XCTAssertTrue(fabs(dti-nti)<0.00001, @"Conversion back to time interval. diff = %f",dti-nti);
    date = [NSDate dateWithString:@"1988-01-27 00:00:00 +0000"];
    dti = [date timeIntervalSince1970];
    njd = AKTimeIntervalSince1970ToJulianDay(dti);
    XCTAssertEqual(njd, 2447187.5, @"January 27, 1988, 0h UT");
    nti = AKJulianDayToTimeIntervalSince1970(njd);
    XCTAssertTrue(fabs(dti-nti)<0.00001, @"Conversion back to time interval. diff = %f",dti-nti);
    NSDate *jddate = [[NSDate alloc] initWithJulianDay:njd];
    AKJulianDay ndjd = [jddate julianDay];
    XCTAssertEqual(njd, ndjd, @"NSDate object initialised with JD for January 27, 1988, 0h UT");
    ndjd = [date julianDay];
    XCTAssertEqual(njd, ndjd, @"NSDate object initialised with JD for January 27, 1988, 0h UT");
}

- (void) testNormalizeAngle
{
    double angle = 0.3212;
    double nangle = AKNormalizeAngle(angle);
    XCTAssertEqual(nangle, angle, @"Angle normalisation in radians did not result in correct value.");
    angle = -0.3212;
    nangle = AKNormalizeAngle(angle);
    XCTAssertEqual(nangle, angle+2*M_PI, @"Angle normalisation in radians did not result in correct value.");
    angle = -0.3212-2*M_PI;
    nangle = AKNormalizeAngle(angle);
    XCTAssertEqual(nangle, angle+4*M_PI, @"Angle normalisation in radians did not result in correct value.");
    angle = 1.3212+6*M_PI;
    nangle = AKNormalizeAngle(angle);
    XCTAssertEqual(nangle, angle-6*M_PI, @"Angle normalisation in radians did not result in correct value.");
    angle = 90;
    nangle = AKNormalizeAngleInDegrees(angle);
    XCTAssertEqual(nangle, angle, @"Angle normalisation in radians did not result in correct value.");
    angle = -90;
    nangle = AKNormalizeAngleInDegrees(angle);
    XCTAssertEqual(nangle, 270, @"Angle normalisation in radians did not result in correct value.");
    angle = -450;
    nangle = AKNormalizeAngleInDegrees(angle);
    XCTAssertEqual(nangle, 270, @"Angle normalisation in radians did not result in correct value.");
    angle = 2087;
    nangle = AKNormalizeAngleInDegrees(angle);
    XCTAssertEqual(nangle, 287, @"Angle normalisation in radians did not result in correct value.");
}

- (void) testAngleDifference
{
    double angle1 = 0.5*M_PI;
    double angle2 = M_PI;
    double adif = AKAngularDifference(angle1, angle2);
    XCTAssertEqual(adif, 0.5*M_PI, @"Angular difference in radians");
    angle1 = 0.5*M_PI;
    angle2 = -M_PI;
    adif = AKAngularDifference(angle1, angle2);
    XCTAssertEqual(adif, 0.5*M_PI, @"Angular difference in radians");
    angle1 = -0.5*M_PI;
    angle2 = -M_PI;
    adif = AKAngularDifference(angle1, angle2);
    XCTAssertEqual(adif, -0.5*M_PI, @"Angular difference in radians");
    angle1 = -2.5*M_PI;
    angle2 = -M_PI;
    adif = AKAngularDifference(angle1, angle2);
    XCTAssertEqual(adif, -0.5*M_PI, @"Angular difference in radians");
    angle1 = 45;
    angle2 = 50;
    adif = AKAngularDifferenceInDegrees(angle1, angle2);
    XCTAssertEqual(adif, 5, @"Angular difference in degrees");
    angle1 = 55;
    angle2 = 50;
    adif = AKAngularDifferenceInDegrees(angle1, angle2);
    XCTAssertEqual(adif, -5, @"Angular difference in degrees");
    angle1 = 365;
    angle2 = 5;
    adif = AKAngularDifferenceInDegrees(angle1, angle2);
    XCTAssertEqual(adif, 0, @"Angular difference in degrees");
    angle1 = 365;
    angle2 = -5;
    adif = AKAngularDifferenceInDegrees(angle1, angle2);
    XCTAssertEqual(adif, -10, @"Angular difference in degrees");
    angle1 = 365;
    angle2 = -365;
    adif = AKAngularDifferenceInDegrees(angle1, angle2);
    XCTAssertEqual(adif, -10, @"Angular difference in degrees");
}

- (void) testAngleConversion
{
    double angle = 12.3211;
    double radangle = AKDegreesToRadians(angle);
    double nangle = AKRadiansToDegrees(radangle);
    double nradangle = AKDegreesToRadians(nangle);
    XCTAssertEqual(angle, nangle, @"Conversion from degrees to radians to degrees did not result in correct value: %f != %f",angle,nangle);
    XCTAssertEqual(radangle, nradangle, @"Conversion from radians to degrees to radians did not result in correct value: %f != %f",radangle,nradangle);
    angle = -312.32402;
    radangle = AKDegreesToRadians(angle);
    nangle = AKRadiansToDegrees(radangle);
    nradangle = AKDegreesToRadians(nangle);
    XCTAssertEqual(angle, nangle, @"Conversion from degrees to radians to degrees did not result in correct value: %f != %f",angle,nangle);
    XCTAssertEqual(radangle, nradangle, @"Conversion from radians to degrees to radians did not result in correct value: %f != %f",radangle,nradangle);
    angle = -1312.32402;
    radangle = AKDegreesToRadians(angle);
    nangle = AKRadiansToDegrees(radangle);
    nradangle = AKDegreesToRadians(nangle);
    XCTAssertEqual(angle, nangle, @"Conversion from degrees to radians to degrees did not result in correct value: %f != %f",angle,nangle);
    XCTAssertEqual(radangle, nradangle, @"Conversion from radians to degrees to radians did not result in correct value: %f != %f",radangle,nradangle);
}

@end
