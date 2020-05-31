//
//  JGTools.m
//
//  Created by Jonathan Gander on 07.05.20.
//  Copyright © 2020 Jonathan Gander. All rights reserved.
//

#import "JGTools.h"

@implementation JGTools

#pragma mark - Alert
+ (void)displayAlertIn:(UIViewController *)viewController
             withTitle:(NSString *)title
               message:(NSString *)message
          cancelButton:(NSString *)button {
    
    if (viewController == nil) {
        return;
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:button
                                              style:UIAlertActionStyleCancel
                                            handler:NULL]];
    
    [viewController presentViewController:alert animated:YES completion:nil];
}

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
@end
