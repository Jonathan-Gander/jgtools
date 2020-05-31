//
//  JGTools.h
//
//  Created by Jonathan Gander
//  https://github.com/Sigmanet15/jgtools
//  https://gander.family
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

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

@end

NS_ASSUME_NONNULL_END
