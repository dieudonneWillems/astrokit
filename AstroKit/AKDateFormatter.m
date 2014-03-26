//
//  AKDateFormatter.m
//  AstroKit
//
//  Created by Don Willems on 25/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import "AKDateFormatter.h"
#import "AKTimeFunctions.h"
#import "NSDate+AKTimeAdditions.h"

@interface AKDateFormatter (private)
- (NSString*) NSDateFormatterFormatStringFor:(NSString*)format;
@end

@implementation AKDateFormatter

- (id) init
{
    self = [super init];
    if(self){
        [self setDateFormat:@"yyyy-MM-dd HH:mm:ss.SS T"];
    }
    return self;
}

- (id)initWithDateFormat:(NSString *)format allowNaturalLanguage:(BOOL)flag {
    return nil;
}

- (NSString*) NSDateFormatterFormatStringFor:(NSString*)format
{
    NSMutableString *oldFormat = [NSMutableString string];
    NSInteger i;
    NSInteger ca = 0;
    for(i=0;i<[format length];i++){
        char c = [format characterAtIndex:i];
        if(c=='\'') ca++;
        if(ca==2) ca = 0;
        if(c=='T' && ca==0){
            [oldFormat appendFormat:@"'*T'"];
        }else{
            [oldFormat appendFormat:@"%c",c];
        }
    }
    return oldFormat;
}

- (NSString*) dateFormat
{
    return fullFormat;
}

- (void) setDateFormat:(NSString *)string
{
    fullFormat = string;
    NSString *oldformat = [self NSDateFormatterFormatStringFor:fullFormat];
    [super setDateFormat:oldformat];
}

- (NSTimeZone*) timeZone
{
    return nil;
}

- (void) setTimeZone:(NSTimeZone*)zone
{
}

- (NSDate *)dateFromString:(NSString *)string
{
    NSString *tsstr = @"UTC";
    NSRange rng = [string rangeOfString:tsstr options:NSBackwardsSearch];
    NSUInteger i=0;
    while(rng.location==NSNotFound){
        if(i==0) tsstr=@"UT1";
        else if(i==1) tsstr=@"TAI";
        else if(i==2) tsstr=@"TT";
        else if(i==3) tsstr=@"TCG";
        rng = [string rangeOfString:tsstr options:NSBackwardsSearch];
        i++;
    }
    if(i==0){
        self.timeSystem=AKCoordinatedUniversalTime;
    }else if(i==1){
        self.timeSystem=AKUniversalTime;
    }else if(i==2){
        self.timeSystem=AKAtomicTime;
    }else if(i==3){
        self.timeSystem=AKTerrestrialTime;
    }else if(i==4){
        self.timeSystem=AKGeocentricCoordinateTime;
    }
    NSString *nstr = [string copy];
    if(rng.location!=NSNotFound){
        nstr = [NSString stringWithFormat:@"%@*T%@",[nstr substringToIndex:rng.location],[nstr substringFromIndex:rng.location+rng.length]];
    }
    NSDate *date = [super dateFromString:nstr];
    NSDate *ndate = nil;
    if(self.timeSystem==AKCoordinatedUniversalTime){
        ndate = [NSDate dateWithTimeIntervalSince1970CoordinatedUniversalTime:[date timeIntervalSince1970]];
    }else if(self.timeSystem==AKUniversalTime){
        ndate = [NSDate dateWithTimeIntervalSince1970UniversalTime:[date timeIntervalSince1970]];
    }else if(self.timeSystem==AKAtomicTime){
        ndate = [NSDate dateWithTimeIntervalSince1970AtomicTime:[date timeIntervalSince1970]];
    }else if(self.timeSystem==AKTerrestrialTime){
        ndate = [NSDate dateWithTimeIntervalSince1970TerrestrialTime:[date timeIntervalSince1970]];
    }else if(self.timeSystem==AKGeocentricCoordinateTime){
        ndate = [NSDate dateWithTimeIntervalSince1970GeocentricCoordinateTime:[date timeIntervalSince1970]];
    }
    return ndate;
}

- (NSString *)stringFromDate:(NSDate *)date
{
    NSTimeInterval ti = [date timeIntervalSince1970];
    NSString *tsstr = @"UTC";
    if(self.timeSystem==AKCoordinatedUniversalTime){
        tsstr = @"UTC";
        ti = [date timeIntervalSince1970CoordinatedUniversalTime];
    }else if(self.timeSystem==AKUniversalTime){
        tsstr = @"UT1";
        ti = [date timeIntervalSince1970UniversalTime];
    }else if(self.timeSystem==AKAtomicTime){
        tsstr = @"TAI";
        ti = [date timeIntervalSince1970AtomicTime];
    }else if(self.timeSystem==AKTerrestrialTime){
        tsstr = @"TT";
        ti = [date timeIntervalSince1970TerrestrialTime];
    }else if(self.timeSystem==AKGeocentricCoordinateTime){
        tsstr = @"TCG";
        ti = [date timeIntervalSince1970GeocentricCoordinateTime];
    }
    NSDate *ndate = [NSDate dateWithTimeIntervalSince1970:ti];
    NSString *str = [super stringFromDate:ndate];
    NSRange rng = [str rangeOfString:@"*T" options:NSBackwardsSearch];
    if(rng.location!=NSNotFound){
        str = [NSString stringWithFormat:@"%@%@%@",[str substringToIndex:rng.location],tsstr,[str substringFromIndex:rng.location+rng.length]];
    }
    return str;
}
@end
