//
//  AKNutationTerms.m
//  AstroKit
//
//  Created by Don Willems on 23/03/14.
//  Copyright (c) 2014 lapsedpacifist. All rights reserved.
//

#import "AKNutationTerms.h"

static NSMutableArray *__terms;

@interface AKNutationTerms (private)
+ (void) loadNutationFile;
- (id) initWithD:(int)D M:(int)M Ma:(int)Ma F:(int)F Omega:(int)Omega longitude:(double)l1 secondOrderLongitude:(double)l2 obliquity:(double)o1 secondOrderObliquity:(double)o2;
@end

@implementation AKNutationTerms

+ (AKNutation) calculateNutationWithD:(double)D M:(double)M Ma:(double)Ma F:(double)F Omega:(double)Omega atJulianCenturies:(AKJulianCenturies)T
{
    double rpi = 180./M_PI;
    AKNutation nutation;
    if(!__terms) [AKNutationTerms loadNutationFile];
    if(__terms){
        double nlon = 0;
        double nobl = 0;
        for(AKNutationTerms *term in __terms){
            double angle = term.D*D+term.M*M+term.Ma*Ma+term.F*F+term.Omega*Omega;
            angle = angle/rpi;
            nlon = nlon+(term.lon1+term.lon2*T)*2.777777777777777778e-8*sin(angle);
            nobl = nobl+(term.obl1+term.obl2*T)*2.777777777777777778e-8*cos(angle);
        }
        nutation.longitude = nlon/rpi;
        nutation.obliquity = nobl/rpi;
    }
    return nutation;
}

+ (void) loadNutationFile
{
    NSBundle *bundle = [NSBundle bundleForClass:[AKNutationTerms class]];
    NSString *path = [bundle pathForResource:@"nutation_IAU1980" ofType:@"dat"];
    NSError *error = nil;
    NSString *contents = [[NSString alloc] initWithContentsOfFile:path encoding:NSASCIIStringEncoding error:&error];
    if(error){
        NSLog(@"Error loading nutation file: %@",error);
        return;
    }
    NSArray *lines = [contents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    if(lines && [lines count]>0){
        __terms = [[NSMutableArray alloc] init];
        for(NSString *line in lines){
            NSString *tline = [line stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            if([tline length]>0 && [tline characterAtIndex:0]!='#'){
                NSArray *cols = [tline componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                NSInteger ccount = 0;
                int _d=0,_m=0,_ma=0,_f=0,_omeg=0;
                double _l1=0,_l2=0,_o1=0,_o2=0;
                for(NSString *col in cols){
                    if([col length]>0){
                        if(ccount==0) _ma = [col intValue];
                        if(ccount==1) _m = [col intValue];
                        if(ccount==2) _f = [col intValue];
                        if(ccount==3) _d = [col intValue];
                        if(ccount==4) _omeg = [col intValue];
                        if(ccount==6) _l1 = [col doubleValue];
                        if(ccount==7) _l2 = [col doubleValue];
                        if(ccount==8) _o1 = [col doubleValue];
                        if(ccount==9) _o2 = [col doubleValue];
                        ccount ++;
                    }
                }
              //  NSLog(@"cols: M:%d M':%d F:%d D:%d Omega:%d  l1:%f l2:%f  o1:%f o2:%f",_m,_ma,_f,_d,_omeg,_l1,_l2,_o1,_o2);
                AKNutationTerms *term = [[AKNutationTerms alloc] initWithD:_d M:_m Ma:_ma F:_f Omega:_omeg longitude:_l1 secondOrderLongitude:_l2 obliquity:_o1 secondOrderObliquity:_o2];
                [__terms addObject:term];
            }
        }
    }
}

- (id) initWithD:(int)D M:(int)M Ma:(int)Ma F:(int)F Omega:(int)Omega longitude:(double)l1 secondOrderLongitude:(double)l2 obliquity:(double)o1 secondOrderObliquity:(double)o2
{
    self = [super init];
    if(self){
        _D = D;
        _M = M;
        _Ma = Ma;
        _F = F;
        _Omega = Omega;
        _lon1 = l1;
        _lon2 = l2;
        _obl1 = o1;
        _obl2 = o2;
    }
    return self;
}

@end
