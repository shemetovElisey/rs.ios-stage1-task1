#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSString *brackets = @"(<[";
    NSString *backBrackets = @")>]";
    NSMutableString *mString = [NSMutableString stringWithString:string];
    NSMutableArray *output = [NSMutableArray arrayWithCapacity:5];
    int count = 0;
    for (int i = 0; i < [string length]; i++){
        for(int j = 0; j < 3; j++){
            if ([mString characterAtIndex:i] == [brackets characterAtIndex:j]) {
                for (int k = i + 1; k < string.length; k++) {
                    
                    if ([mString characterAtIndex:k] == [brackets characterAtIndex:j]) {
                        count++;
                        continue;
                    }
                    
                    if (([mString characterAtIndex:k] == [backBrackets characterAtIndex:j]) && (count != 0)) {
                        count--;
                        continue;
                    }
                    
                    if (([mString characterAtIndex:k] == [backBrackets characterAtIndex:j]) && (count == 0)) {
                        [output addObject:[string substringWithRange:NSMakeRange(i + 1, k - i - 1)]];
                        break;
                    }
                    
                }
            }
        }
    }
    return output;
}

@end
