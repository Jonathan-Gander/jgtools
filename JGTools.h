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

#pragma mark - Numbers
+ (NSInteger)randomIntegerBetweenMin:(NSInteger)min andMax:(NSInteger)max;

#pragma mark - Color
+ (UIColor *)colorWithHexString:(NSString *)str;

#pragma mark - Image
+ (BOOL)urlStringIsImage:(NSString *)string;

#pragma mark - Date and time
+ (NSTimeInterval)currentTimestamp;

#pragma mark - Location and bearing
+ (double)bearingFromCoordinate:(CLLocationCoordinate2D)coordinate1 toCoordinate:(CLLocationCoordinate2D)coordinate2;

#pragma mark - Device
+ (NSString *)deviceLanguage;

@end

NS_ASSUME_NONNULL_END
