//
//  AKDeltaT.m
//  AstroKit
//
//  Created by Don Willems on 24/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import "AKDeltaT.h"
#import "NSDate+AKTimeAdditions.h"

static NSMutableArray *__deltaTs;
static NSInteger __fileJD = 0;

@interface AKDeltaT (private)
+ (void) loadData;
+ (void) updateDataFile;
- (instancetype) initWithJD:(AKJulianDay)JD deltaT:(double)dT;
@end

@implementation AKDeltaT

+ (double) deltaTAtJulianDay:(AKJulianDay)JD
{
    NSDate *now = [NSDate date];
    AKJulianDay jd = [now julianDay];
    if(__deltaTs==nil){
        [self loadData];
    }
    if(__fileJD+1<jd){
        [self updateDataFile];
    }
    double prevdt = 42;
    AKJulianDay prevJD = 2433282.4235;
    for(AKDeltaT *deltaT in __deltaTs){
        AKJulianDay fJD = [deltaT JD];
        if(JD<=fJD){
            double fracjd = (JD-prevJD)/([deltaT JD]-prevJD);
            double dt = prevdt + fracjd*([deltaT deltaT]-prevdt);
            return dt;
        }
        prevdt = [deltaT deltaT];
        prevJD = [deltaT JD];
    }
    return 42.;
}

+ (void) loadData
{
    NSBundle *bundle = [NSBundle bundleForClass:[AKDeltaT class]];
    NSString *path = [bundle pathForResource:@"deltaT" ofType:@"dat"];
    NSLog(@"deltaT path: %@",path);
    NSError *error;
    NSString *contents = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:&error];
    __deltaTs = [NSMutableArray array];
    if(!error){
        NSArray *upcomps = [contents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        for(NSString* line in upcomps){
            if([line length]>0){
                NSArray *cols = [line componentsSeparatedByString:@"\t"];
                NSString *jdstr = [cols objectAtIndex:0];
                NSString *deltatstr = [cols objectAtIndex:1];
                double jd = [jdstr doubleValue];
                double dt = [deltatstr doubleValue];
                AKDeltaT *deltat = [[AKDeltaT alloc] initWithJD:jd deltaT:dt];
                [__deltaTs addObject:deltat];
                __fileJD = jd;
            }
        }
        __fileJD = __fileJD+31.;
        if(__fileJD<[[NSDate date] julianDay]){
            [self updateDataFile];
        }
    }else{
        NSLog(@"Error reading deltaT file at '%@': %@",path,error);
    }
}

+ (void) updateDataFile
{
    NSError *error = nil;
    NSString *upcontents = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://maia.usno.navy.mil/ser7/deltat.data"] encoding:NSASCIIStringEncoding error:&error];
    if(!error){
        __deltaTs = [NSMutableArray array];
        NSMutableString *filestr = [NSMutableString string];
        NSArray *upcomps = [upcontents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        for(NSString* line in upcomps){
            if(line && [line length]>0){
                NSInteger year=1;
                NSInteger month=1;
                NSInteger day=1;
                double dt=42;
                NSArray *cols = [line componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                int col = 0;
                for(NSString *colstr in cols){
                    if(colstr && [colstr length]>0){
                        if(col==0){
                            year = [colstr integerValue];
                        }else if(col==1){
                            month = [colstr integerValue];
                        }else if(col==2){
                            day = [colstr integerValue];
                        }else if(col==3){
                            dt = [colstr doubleValue];
                        }
                        col++;
                    }
                }
                NSCalendar *calendar = [NSCalendar currentCalendar];
                NSDateComponents *components = [[NSDateComponents alloc] init];
                [components setDay:day];
                [components setMonth:month];
                [components setYear:year];
                [components setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
                NSDate *date = [calendar dateFromComponents:components];
                AKJulianDay JD = [date julianDay];
                AKDeltaT *deltaT = [[AKDeltaT alloc] initWithJD:JD deltaT:dt];
                [__deltaTs addObject:deltaT];
                [filestr appendFormat:@"%f\t%f\n",JD,dt];
                __fileJD = JD;
            }
        }
        NSBundle *bundle = [NSBundle bundleForClass:[AKDeltaT class]];
        NSString *path = [bundle pathForResource:@"deltaT" ofType:@"dat"];
        NSLog(@"deltaT path: %@",path);
        [filestr writeToFile:path atomically:YES encoding:NSASCIIStringEncoding error:&error];
    }
    if(error){
        NSLog(@"Error updating deltaT file: %@",error);
    }
    __fileJD = [[NSDate date] julianDay];
}

- (instancetype) initWithJD:(AKJulianDay)JD deltaT:(double)dT
{
    self=[super init];
    _JD = JD;
    _deltaT = dT;
    return self;
}

@end
