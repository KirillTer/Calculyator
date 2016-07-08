//
//  ChartView.m
//  Calculyator
//
//  Created by Admin on 7/7/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ChartView.h"

@implementation ChartView

- (void)drawRect:(CGRect)rect {
    [self.bezPath setLineWidth:2];
    [self.bezPath stroke];
}

@end
