#import "BillCounter.h"

@implementation BillCounter

// Complete the following function
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    NSMutableArray *mBill = [NSMutableArray arrayWithArray:bill];
    [mBill removeObjectAtIndex:index];
    
    int annaBill = 0;
    
    for (int i = 0; i < mBill.count; i++) {
        annaBill += [mBill[i] intValue];
    }
    
    annaBill /= 2;
    
    if (annaBill == [sum intValue]) {
        return @"Bon Appetit";
    } else {
        return [NSString stringWithFormat:@"%d", [sum intValue] - annaBill];
    }
}

@end
