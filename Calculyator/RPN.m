//
//  RPN.m
//  Calculyator
//
//  Created by Admin on 6/13/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "RPN.h"
#import "Stack.h"

@implementation RPN

- (NSMutableArray *)convertToRPN:(NSString *)incomeString {
    NSMutableArray *outcomeRPNString = [[NSMutableArray alloc] init];
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"+-*/()"];
    Stack *stck = [[Stack alloc] init];
    for(int i = 0; i < [incomeString length]; i++) {
        if (i == [incomeString rangeOfCharacterFromSet:charSet].location) {
            NSString *number = [incomeString substringToIndex:i];
            [outcomeRPNString addObject:number];
            incomeString = [incomeString substringFromIndex:i];
            number = [incomeString substringToIndex:1];
            [stck push:number];
            incomeString = [incomeString substringFromIndex:1];
            //NSLog(@"outcomeRPNString - %@", outcomeRPNString);
            //NSLog(@"incomeString - %@", incomeString);
            i = 0;
        }
    }
    [outcomeRPNString addObject:incomeString];
    NSLog(@"stck - %@", stck);
    return outcomeRPNString;
}

@end
