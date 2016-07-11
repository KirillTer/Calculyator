//
//  CalcRPN.m
//  Calculyator
//
//  Created by Admin on 6/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "CalcRPN.h"
#import "RPN.h"

@implementation CalcRPN

- (NSString*)countUsingRPN:(NSString *)incomeString {
    RPN *stringRPN = [[RPN alloc] init];
    NSMutableArray *incomeRPNString = [stringRPN convertToRPN:incomeString];
    for (int i = 0; i < [incomeRPNString count]; i++) {
        [incomeRPNString replaceObjectAtIndex:i withObject:[[incomeRPNString objectAtIndex:i] stringByReplacingOccurrencesOfString:@"$" withString:@"-"]];
    }
    if (([incomeRPNString count] <= 2) && ([incomeRPNString count] > 1)) {
        return @"Incorrect number of arguments";
    } else {
        for(int i = 0; i < [incomeRPNString count]; i++) {
            NSString *sign = [NSString stringWithFormat:@"%@", [incomeRPNString objectAtIndex:i]];
            if([sign isEqual:@"+"]){
                [incomeRPNString replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%f",([incomeRPNString[i-1] doubleValue] + [incomeRPNString[i-2] doubleValue])]];
                [incomeRPNString removeObjectAtIndex:(i-1)];
                [incomeRPNString removeObjectAtIndex:(i-2)];
                i = 1;
            }
            if([sign isEqual:@"-"]){
                [incomeRPNString replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%f",([incomeRPNString[i-2] doubleValue] - [incomeRPNString[i-1] doubleValue])]];
                [incomeRPNString removeObjectAtIndex:(i-1)];
                [incomeRPNString removeObjectAtIndex:(i-2)];
                i = 1;
            }
            if([sign isEqual:@"*"]){
                [incomeRPNString replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%f",([incomeRPNString[i-1] doubleValue] * [incomeRPNString[i-2] doubleValue])]];
                [incomeRPNString removeObjectAtIndex:(i-1)];
                [incomeRPNString removeObjectAtIndex:(i-2)];
                i = 1;
            }
            if([sign isEqual:@"/"]){
                if (!([incomeRPNString[i-1] isEqualToString:@"0"])) {
                    [incomeRPNString replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%f",([incomeRPNString[i-2] doubleValue] / [incomeRPNString[i-1] doubleValue])]];
                    [incomeRPNString removeObjectAtIndex:(i-1)];
                    [incomeRPNString removeObjectAtIndex:(i-2)];
                    i = 1;
                } else {
                    [incomeRPNString replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"%@",@"devision by zero"]];
                }
            }
            NSLog(@"Calculated incomeRPNString - %@",incomeRPNString);
        }
    }
    return incomeRPNString[0];
}

@end
