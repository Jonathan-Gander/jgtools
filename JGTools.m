//
//  JGTools.m
//
//  Created by Jonathan Gander
//  https://github.com/Sigmanet15/jgtools
//  https://gander.family
//

#import "JGTools.h"

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

@end
