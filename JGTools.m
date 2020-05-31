//
//  JGTools.m
//
//  Created by Jonathan Gander
//  https://github.com/Sigmanet15/jgtools
//  https://gander.family
//

#import "JGTools.h"

// For bearing method
#define degreesToRadians(x) (M_PI * x / 180.0)
#define radiandsToDegrees(x) (x * 180.0 / M_PI)

@implementation JGTools

#pragma mark - Color

+ (UIColor *)colorWithHexString:(NSString *)str {
    if (![[str substringToIndex:1] isEqualToString:@"#"])
        str = [NSString stringWithFormat:@"#%@",str];
    const char *cStr = [str cStringUsingEncoding:NSASCIIStringEncoding];
    long x = strtol(cStr+1, NULL, 16);
    return [JGTools colorWithHex:(UInt32)x];
}

+ (UIColor *)colorWithHex:(UInt32)col {
    unsigned char r, g, b;
    b = col & 0xFF;
    g = (col >> 8) & 0xFF;
    r = (col >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1];
}

#pragma mark - Device language
+ (NSString *)deviceLanguage {
    NSString *language = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSRange startRange = [language rangeOfString:@"-"];
    if (startRange.location != NSNotFound) {
        language = [language substringToIndex:startRange.location];
    }

    return language;
}

#pragma mark - Image
+ (BOOL)urlStringIsImage:(NSString *)string {
    NSArray *imageExtensions = @[@"jpg", @"jpeg", @"jpe", @"jif", @"jfif", @"jfi", @"png", @"gif", @"webp", @"tiff", @"tif", @"bmp", @"jp2", @"j2k", @"jpf", @"jpx", @"jpm", @"mj2"];

    NSURL *url = [NSURL URLWithString:string];
    if (url == nil) {
        return NO;
    }
    
    NSString *extension = [[url pathExtension] lowercaseString];
    return [imageExtensions containsObject:extension];
}
#pragma mark - Bearing
+ (double)bearingFromCoordinate:(CLLocationCoordinate2D)coordinate1 toCoordinate:(CLLocationCoordinate2D)coordinate2 {
    
    // Sources :
    // http://www.movable-type.co.uk/scripts/latlong.html
    // http://stackoverflow.com/questions/8123049/calculate-bearing-between-two-locations-lat-long
    // http://software.intel.com/en-us/blogs/2012/11/30/calculating-a-bearing-between-points-in-location-aware-apps
    // http://stackoverflow.com/questions/3809337/calculating-bearing-between-two-cllocationcoordinate2ds
    
    double lat1 = degreesToRadians(coordinate1.latitude);
    double lng1 = degreesToRadians(coordinate1.longitude);
    double lat2 = degreesToRadians(coordinate2.latitude);
    double lng2 = degreesToRadians(coordinate2.longitude);
    
    double dLon = (lng2-lng1);
    double y = sin(dLon) * cos(lat2);
    double x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
    double bearing = radiandsToDegrees(atan2(y, x));
    
    if (bearing < 0) {
        bearing += 360;
    }
    
    return bearing;
}

@end
