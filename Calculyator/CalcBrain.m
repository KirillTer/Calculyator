//
//  CalcBrain.m
//  Calculyator
//
//  Created by Admin on 6/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "CalcBrain.h"
#import "RPN.h"
#import "CalcRPN.h"

@implementation CalcBrain

- (double)countValue:(NSString *)incomeString {
    RPN *stringRPN = [[RPN alloc] init];
    NSMutableArray *tempRPN = [stringRPN convertToRPN:incomeString];
    CalcRPN *calc = [[CalcRPN alloc] init];
    return [calc countUsingRPN:tempRPN];
}

@end
