#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    NSMutableArray *a = [[NSMutableArray alloc] init];
    for (int i = 0; i < 8; i++){
        [a addObject: [NSNumber numberWithInt:n % 2]];
        n /= 2;
    }
    
    int new = 0, x = 1;
    for (int i = 7; i >= 0; i--){
        new += [a[i] intValue] * x;
        x *= 2;
    }
    
    return new;
}
