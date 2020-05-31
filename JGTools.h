//
//  JGTools.h
//
//  Created by Jonathan Gander on 07.05.20.
//  Copyright © 2020 Jonathan Gander. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JGTools : NSObject

// Alert
+ (void)displayAlertIn:(UIViewController *)viewController
             withTitle:(NSString *)title
               message:(NSString *)message
          cancelButton:(NSString *)button;

// Color
+ (UIColor *)colorWithHexString:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
