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
