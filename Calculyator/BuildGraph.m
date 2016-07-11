//
//  BuildGraph.m
//  Calculyator
//
//  Created by Admin on 7/9/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "BuildGraph.h"

@implementation BuildGraph

- (UIBezierPath *)buildGraphPathWith:(NSString *)equation forSize:(CGSize)viewSize{
    NSMutableArray *points = [self drowGraph:equation];
    UIBezierPath *bezPath = [[UIBezierPath alloc] init];
    BOOL firstEntry = YES;
    for (NSValue *value in points) {
        if (firstEntry) {
            [bezPath moveToPoint:CGPointMake(viewSize.width / 2 + [value CGPointValue].x,
                                             viewSize.height / 2 - [value CGPointValue].y)];
            firstEntry = NO;
            NSLog(@"X : %lf Y: %lf", [value CGPointValue].x, [value CGPointValue].y);
        } else {
            [bezPath addLineToPoint:CGPointMake(viewSize.width / 2 + [value CGPointValue].x,
                                                viewSize.height / 2 - [value CGPointValue].y)];
            
        }
    }
    return bezPath;
}

- (NSMutableArray*)drowGraph:(NSString *)incomeString {
    NSMutableArray *points = [[NSMutableArray alloc]init];
    for (CGFloat i = -200; i < 200; i += 0.5) {
        NSString *expressionString = [incomeString stringByReplacingOccurrencesOfString:@"X" withString:[NSString stringWithFormat:@"%lf", i]];
        
        NSExpression *expression = [NSExpression expressionWithFormat:expressionString];
        
        NSNumber *number = [expression expressionValueWithObject:nil context:nil];
        //NSLog(@"%g", [number doubleValue]);
        CGPoint point = CGPointMake(i, [number doubleValue]);
        [points addObject:[NSValue valueWithCGPoint:point]];
    }
    return points;
}
@end
