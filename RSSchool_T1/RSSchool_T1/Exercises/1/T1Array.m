#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    if ([sadArray  isEqual: @[]]) {
        return @[];
    }
    NSMutableArray *happyArray = [NSMutableArray arrayWithObject: [sadArray firstObject]];
    for (int i = 1; i < sadArray.count - 1; i++) {
        if ([sadArray[i - 1] intValue] + [sadArray[i + 1] intValue] >= [sadArray[i] intValue]) {
            [happyArray addObject:sadArray[i]];
        }
    }
    [happyArray addObject: [sadArray lastObject]];
    
    if (sadArray.count != happyArray.count) {
        happyArray = [NSMutableArray arrayWithArray:[self convertToHappy: happyArray]];
    }
    
    return happyArray;
}

@end
