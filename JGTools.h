//
//  JGTools.h
//
//  Created by Jonathan Gander
//  https://github.com/Sigmanet15/jgtools
//  https://gander.family
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

// For bearing method
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JGTools : NSObject

/**
* Get a UIColor from a hex string
* @param str String representing hex for color. It can start with or without '#'.
* @return UIColor for hex string
*/
+ (UIColor *)colorWithHexString:(NSString *)str;

/**
 * @return Device language in two char
 */
+ (NSString *)deviceLanguage;

/**
 * Check if an URL string is an image. It only check for extension.
 * Note : A better solution would be to make a HEAD request and read Content-Type header.
 * @param string URL string
 * @return YES if URL is an image, NO otherwise
 */
+ (BOOL)urlStringIsImage:(NSString *)string;

/**
 * Bearing between two coordinates
 * @param coordinate1 First coordinate
 * @param coordinate2 Second coordinate
 * @return Bearing in degrees
 */
+ (double)bearingFromCoordinate:(CLLocationCoordinate2D)coordinate1 toCoordinate:(CLLocationCoordinate2D)coordinate2;

@end

NS_ASSUME_NONNULL_END
