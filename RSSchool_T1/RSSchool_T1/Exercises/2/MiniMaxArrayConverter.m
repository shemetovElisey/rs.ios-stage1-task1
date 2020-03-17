#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    NSMutableArray *mArray = [NSMutableArray arrayWithArray:array];
    
    for (int i = 0; i < mArray.count; i++) {
        for (int j = i; j < mArray.count; j++) {
            if ([mArray[i] intValue] < [mArray[j] intValue]) {
                NSNumber *buffer = mArray[i];
                mArray[i] = mArray[j];
                mArray[j] = buffer;
            }
        }
    }
    
    int maxValue = 0;
    int minValue = 0;
    NSArray *max = [mArray subarrayWithRange:NSMakeRange(0, mArray.count - 1)];
    NSArray *min = [mArray subarrayWithRange:NSMakeRange(1, mArray.count - 1)];
    for (int i = 0; i < max.count; i++) {
        maxValue += [max[i] intValue];
        minValue += [min[i] intValue];
    }
    NSArray *output = [NSArray arrayWithObjects:[NSNumber numberWithInt:minValue], [NSNumber numberWithInt:maxValue], nil];
    
    return output;
}

@end
