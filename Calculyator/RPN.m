//
//  RPN.m
//  Calculyator
//
//  Created by Admin on 6/13/16.
//  Copyright © 2016 Admin. All rights reserved.
// 34-67*56+23/56

#import "RPN.h"
#import "Stack.h"

@implementation RPN

- (NSMutableArray *)convertToRPN:(NSString *)incomeString {
    NSLog(@"incomeString - %@", incomeString);
    NSMutableArray *outcomeRPNString = [[NSMutableArray alloc] init];
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"+-*/()"];
    Stack *stck = [[Stack alloc] init];
    for(int i = 0; i < [incomeString length]; i++) {
        if (i == [incomeString rangeOfCharacterFromSet:charSet].location) {
            NSString *number = [incomeString substringToIndex:i];
            if (!([number isEqualToString:@""])) {
                [outcomeRPNString addObject:number];
            }
            incomeString = [incomeString substringFromIndex:i];
            NSString *operand = [incomeString substringToIndex:1];
            incomeString = [incomeString substringFromIndex:1];
            NSMutableArray *tempOperand = [stck push:operand];
            if (!([tempOperand count] == 0)) {
                [outcomeRPNString addObjectsFromArray:tempOperand];
            }
            NSLog(@"outcomeRPNString - %@", outcomeRPNString);
            NSLog(@"incomeString - %@", incomeString);
            i = -1;
        }
    }
    [outcomeRPNString addObject:incomeString];
    [outcomeRPNString addObjectsFromArray:[stck popAll]];
    for (int i =0; i < [outcomeRPNString count]; i++){
        if ([outcomeRPNString[i] isEqualToString:@""]) {
            [outcomeRPNString removeObjectAtIndex:i];
        }
    }
    return outcomeRPNString;
}

@end
