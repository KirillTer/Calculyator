//
//  CalcBrain.m
//  Calculyator
//
//  Created by Admin on 6/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "CalcBrain.h"
#import "CalcRPN.h"
#import "BuildGraph.h"

@implementation CalcBrain

- (NSString*)countValue:(NSString *)incomeString {
    CalcRPN *calc = [[CalcRPN alloc] init];
    return [calc countUsingRPN:incomeString];
}

- (UIBezierPath *)buildChartPathWith:(NSString *)equation forSize:(CGSize)viewSize {
    BuildGraph *graph = [[BuildGraph alloc] init];
    return [graph buildGraphPathWith:equation forSize:viewSize];
}

@end