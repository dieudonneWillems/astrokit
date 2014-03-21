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
