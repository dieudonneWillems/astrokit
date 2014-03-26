AstroKit
========

AstroKit is an Objective-C library for Mac OS X and iOS providing implementation of astronomical algorithms used 
in the calculation of the position of the planets and stars. It mostly follows the algorithms as layed out in Jean Meeus' 
Astronomical Algorithms, second edition 1998.

Documentation is available via the [wiki](https://github.com/lapsedPacifist/astrokit/wiki). 

##Releases:

###AstroKit Release 0.1
* Time functions
  * Conversions between time systems such as UTC, UT1, TT (TDT), TAI, and TCG.
  * Date formatting in strings with time systems.
  * Acces methods with different time systems in a category of NSDate.
    * Class methods to create dates within a specific time system.
    * Init methods to create dates within a specific time system.
    * Getters to return time information for a specific time system.
  * Updating of TAI-UTC (leap seconds) and TT-UT1 automatically from the internet.
  * Julian day and Modified Julian Day 
    * Including within the different time systems 
* Sidereal time.
* Angles
  * Normalisation to [0,pi) or [0,360).
  * Differences between angles.
  * Conversion between radians and degrees.
  * Simple angle string representation
    * Hour Minute Second format
    * ±Degree Arcminute Arcsecond format.
* Nutation and Obliquity
  * Obliquity of the Ecliptic
  * Nutation in Longitude
  * Nutation in Obliquity
