#import "PalindromeSolver.h"
#import <string.h>

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    int numberOfDigits = [n intValue];
    int changesCount = [k intValue];
    NSMutableString *mString = [NSMutableString stringWithString:s];
    
    for (int i = 0; i < numberOfDigits / 2; i++) {
        NSString *charAtIndex = [NSString stringWithFormat:@"%c", [mString characterAtIndex:i]];
        NSString *charAtBackwardIndex = [NSString stringWithFormat:@"%c", [mString characterAtIndex:numberOfDigits - 1 - i]];
        if (changesCount > 0) {
            if (charAtIndex.intValue < charAtBackwardIndex.intValue) {
                [mString replaceCharactersInRange:NSMakeRange(i, 1) withString:charAtBackwardIndex];
                changesCount--;
            } else if (charAtIndex.intValue > charAtBackwardIndex.intValue) {
                [mString replaceCharactersInRange:NSMakeRange(mString.length - 1 - i, 1) withString:charAtIndex];
                changesCount--;
            }
        }
    }
    
    for (int i = 0; i < numberOfDigits / 2; i++) {
        if (changesCount % 2 && changesCount > 0) {
            changesCount -= 2;
            [mString replaceCharactersInRange:NSMakeRange(i, 1) withString:@"9"];
            [mString replaceCharactersInRange:NSMakeRange(mString.length - 1 - i, 1) withString:@"9"];
        } else {
            break;
        }
    }
    
    NSMutableString *revString = [NSMutableString string];
    NSInteger charIndex = [mString length];
    while (charIndex > 0) {
        charIndex--;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [revString appendString:[mString substringWithRange:subStrRange]];
    }
    
    if ([mString isEqual:revString]) {
        return mString;
    } else {
        return @"-1";
    }
    
}

@end
