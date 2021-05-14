#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    if (array == nil)return @[];
    
    NSMutableArray *stringArray = [[NSMutableArray alloc] init];
    NSMutableArray *intArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < array.count; i++){
        if (![array[0] isKindOfClass:[NSArray class]]){
            return @[];
        }
        for (int j = 0; j < array[i].count; j++)
            if ([array[i][j] isKindOfClass:[NSString class]]){
                [stringArray addObject:array[i][j]];
            }
            else{
                [intArray addObject:array[i][j]];
            }
    }
    
    [intArray sortUsingDescriptors:
             [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES]]];
    [stringArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    if (intArray.count == 0)return stringArray;
    else if (stringArray.count == 0)return intArray;
    else return [NSArray arrayWithObjects:intArray, stringArray, nil];
}

@end

