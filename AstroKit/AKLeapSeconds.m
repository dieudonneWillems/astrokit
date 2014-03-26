//
//  AKLeapSeconds.m
//  AstroKit
//
//  Created by Don Willems on 20/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import "AKLeapSeconds.h"

@interface AKLeapSeconds (private)
+ (void) leapSecondsFromFileAtJulianDay:(AKJulianDay)JD;
+ (void) updateLeapSecondsFile:(NSString*)bfpath;
+ (BOOL) fileNeedsUpdate;
@end

static NSMutableArray *leapseconds;
static NSInteger fileYear;
static NSInteger fileMonth;

@implementation AKLeapSeconds

+ (double) leapSecondsAtJulianDay:(AKJulianDay)JD
{
    if(leapseconds==nil || [AKLeapSeconds fileNeedsUpdate]){
        [AKLeapSeconds leapSecondsFromFileAtJulianDay:JD];
    }
    
    // Determine leap seconds
    AKModifiedJulianDay MJD = AKJulianDayToModifiedJulianDay(JD);
    for(AKLeapSeconds *ls in leapseconds){
        if([ls MJD]>MJD) return [ls seconds];
    }
    
    return 35.;
}

+ (BOOL) fileNeedsUpdate
{
    BOOL needsUpdate = YES;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth | NSCalendarUnitYear fromDate:  [NSDate date]];
    NSInteger month = [components month];
    NSInteger year = [components year];
    if(fileMonth>=0){
        if(year==fileYear){
            if(month<=6) needsUpdate = NO;
            else if(month>6 && fileMonth>6) needsUpdate = NO;
        }else if(year<fileYear) needsUpdate = NO;
    }
    return needsUpdate;
}

+ (void) leapSecondsFromFileAtJulianDay:(AKJulianDay)JD
{
    // Get path of file leapSeconds.dat in AstroKit.framework bundle.
    NSBundle *bundle = [NSBundle bundleForClass:[AKLeapSeconds class]];
    NSString *path = [bundle pathForResource:@"leapSeconds" ofType:@"dat"];
    
    // Get contents of file
    NSError *error = nil;
    NSString *contents = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:&error];
    NSArray *scomps = [contents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    // Get latest update date from file
    fileYear=-1;
    fileMonth=-1;
    leapseconds = [NSMutableArray array];
    if([scomps count]>2){
        NSString *ystr = [scomps objectAtIndex:0];
        NSString *mstr = [scomps objectAtIndex:1];
        fileYear = [ystr integerValue];
        fileMonth = [mstr integerValue];
        NSInteger i;
        for(i=2;i<[scomps count];i++){
            NSString *line = [scomps objectAtIndex:i];
            NSArray *lcomps = [line componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            if([lcomps count]>=2){
                NSString *mjds = [lcomps objectAtIndex:0];
                NSString *lss = [lcomps objectAtIndex:1];
                AKLeapSeconds *ls = [[AKLeapSeconds alloc] initWithModifiedJulianDay:[mjds doubleValue] numberOfLeapSeconds:[lss doubleValue]];
                [leapseconds addObject:ls];
            }
        }
    }
    
    // Get current year and month to determine if file needs updating
    BOOL needsUpdate = [AKLeapSeconds fileNeedsUpdate];
    
    // If file needs updating
    if(needsUpdate){
        [AKLeapSeconds updateLeapSecondsFile:path];
    }
}

+ (void) updateLeapSecondsFile:(NSString*)bfpath
{
    NSDate *d1900 = [NSDate dateWithString:@"1900-01-01 00:00:00 +0000"];
    NSError *error = nil;
    NSString *upcontents = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.ietf.org/timezones/data/leap-seconds.list"] encoding:NSASCIIStringEncoding error:&error];
    if(!error){
        NSArray *upcomps = [upcontents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        NSInteger count = 0;
        for(NSString *upcomp in upcomps){
            NSString *line = [upcomp stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            if([line length]>0 && [line characterAtIndex:0]!='#'){
                NSArray *ar = [line componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                if([ar count]>1){
                    NSString *ts = [ar objectAtIndex:0];
                    NSString *ls = [ar objectAtIndex:1];
                    NSTimeInterval tsi = [ts doubleValue];
                    double lsd = [ls doubleValue];
                    tsi = tsi+[d1900 timeIntervalSince1970];
                    AKModifiedJulianDay mjd = AKTimeIntervalSince1970ToModifiedJulianDay(tsi);
                   // NSDate *lsdate = [NSDate dateWithTimeIntervalSince1970:tsi];
                    AKLeapSeconds *aks = [[AKLeapSeconds alloc] initWithModifiedJulianDay:mjd numberOfLeapSeconds:lsd];
                    if(![leapseconds containsObject:aks]){
                        [leapseconds addObject:aks];
                        count++;
                    }
                }
            }
        }
        NSArray *nar = [leapseconds sortedArrayUsingSelector:@selector(compare:)];
        NSMutableString *fstr = [NSMutableString string];
        NSDate *lastdate = [NSDate date];
        NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth | NSCalendarUnitYear fromDate:  lastdate];
        NSInteger month = [components month];
        NSInteger year = [components year];
        [fstr appendFormat:@"%ld\n%ld\n",year,month];
        for(AKLeapSeconds *ls in nar){
            [fstr appendFormat:@"%f\t%f\n",[ls MJD],[ls seconds]];
        }
        [fstr writeToFile:bfpath atomically:YES encoding:NSASCIIStringEncoding error:&error];
        fileYear = year;
        fileMonth = month;
        if(error){
            NSLog(@"Could not write new leap seconds file. %@",error);
        }
    }else {
        NSLog(@"Error updating leap minutes file: %@",error);
    }
}


- (id) initWithModifiedJulianDay:(AKModifiedJulianDay)ModJD numberOfLeapSeconds:(double)leapSeconds
{
    self = [super init];
    MJD = ModJD;
    seconds = leapSeconds;
    return self;
}

@synthesize MJD;
@synthesize seconds;

- (BOOL) isEqual:(id)object
{
    if([object isKindOfClass:[AKLeapSeconds class]]){
        return (MJD==[object MJD]);
    }
    return NO;
}

- (NSComparisonResult) compare:(AKLeapSeconds *)object
{
    if(MJD<[object MJD]) return NSOrderedAscending;
    if(MJD>[object MJD]) return NSOrderedDescending;
    return NSOrderedSame;
}
@end