//
//  AKDateFormatter.h
//  AstroKit
//
//  Created by Don Willems on 25/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum __time_system {
    AKCoordinatedUniversalTime,
    AKUniversalTime,
    AKTerrestrialTime,
    AKAtomicTime,
    AKGeocentricCoordinateTime
} AKTimeSystem;

@interface AKDateFormatter : NSDateFormatter {
    NSString *fullFormat;
}


/**
 * Creates a new date formatter that supports time systems. The date
 * format adds support for time systems. Time zones are meaningless for
 * time systems other than local time systems and these are not supported
 * by <code>AKDateFormatter</code>. If time zones are needed use
 * <code>NSDateFormatter</code>.
 * The default format string is: <code>yyyy-MM-dd HH:mm:ss.SS T</code>,
 * where the format as defined in
 * <a href="http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns">http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns</a> is used with a new symbol 'T' added to designate the time system.
 * @return The date formatter.
 */
- (id) init;

/**
 * This initialiser in <code>NSDateFormatter</code> cannot use the 10.4
 * date formatting behaviour. Only 10.4 behaviour is supported by
 * <code>AKDateFormatter</code>, this method will, therefore, return
 * <code>nill</code>. Use <code>init</code> instead, and use 
 * <code>setDateFormat</code> to set the date formatting string.
 */
- (id)initWithDateFormat:(NSString *)format allowNaturalLanguage:(BOOL)flag;

/**
 * The system of time used in the formatter (e.g. UTC, UT1, TT, TAI, or 
 * TGC.
 */
@property (readwrite) AKTimeSystem timeSystem;

/**
 * Returns the date format as used by this formatter.
 * The format is defined in
 * <a href="http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns">http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns</a> is used with a new symbol 'T' added to designate the time system.
 * @return The date format string.
 */
- (NSString*) dateFormat;

/**
 * Returns the date format as used by this formatter.
 * The format is defined in
 * <a href="http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns">http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns</a> is used with a new symbol 'T' added to designate the time system.
 * @param string The date format string.
 */
- (void) setDateFormat:(NSString *)string;

/**
 * Time zones are meaningless in astronomical time systems.
 * @return nil
 */
- (NSTimeZone*) timeZone;

/**
 * Time zones are meaningless in astronomical time systems.
 * This method does nothing.
 */
- (void) setTimeZone:(NSTimeZone*)zone;
@end
