//
//  CalcBrain.m
//  Calculyator
//
//  Created by Admin on 6/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "CalcBrain.h"
#import "CalcRPN.h"

@implementation CalcBrain

- (NSString*)countValue:(NSString *)incomeString {
    CalcRPN *calc = [[CalcRPN alloc] init];
    return [calc countUsingRPN:incomeString];
}

- (NSMutableArray*)drowGraph:(NSString *)incomeString {
    NSString *equation = @"x*3+3";
    NSMutableArray *points = [[NSMutableArray alloc]init];
    for (CGFloat i = -5; i < 5; i += 0.1) {
        NSString *expressionString = [equation stringByReplacingOccurrencesOfString:@"x" withString:[NSString stringWithFormat:@"%lf", i]];
        //////
        NSExpression *expression = [NSExpression expressionWithFormat:expressionString];
        //////
        NSNumber *number = [expression expressionValueWithObject:nil context:nil];
        NSLog(@"%g", [number doubleValue]);
        CGPoint point = CGPointMake(i, [number doubleValue]);
        [points addObject:[NSValue valueWithCGPoint:point]];
    }
    return points;
}
@end
