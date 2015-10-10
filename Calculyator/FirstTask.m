//
//  FirstTask.m
//  Cousres_ThinkMobiles
//
//  Created by Admin on 8/16/15.
//  Copyright (c) 2015 Kirill Tereschenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FirstTask.h"

@interface FirstTask ()

-(void)cut;
@end

@implementation FirstTask

//constructor by default
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Initial number by default");
        _numerator = 1;
        _denomenator = 1;
    }
    return self;
}
//constructor with one parameter
- (instancetype)initWithOne: (NSInteger)number
{
    if (self = [super init])
    {
        _numerator = 1;
        if(number != 0){_denomenator = number;} else{_denomenator = 1;}
        NSLog(@"Initial ONE int parameter - %li", (long)_denomenator);
    }
    return self;
}
//constructor with two parameters
- (instancetype)initWithFir: (NSInteger)number1 Sec: (NSInteger)number2
{
    if (self = [super init])
    {
        _numerator = number1;
        if(number2 != 0){_denomenator = number2;} else{_denomenator = 1;}
        NSLog(@"Initial TWO int parameters - %li and %li", _numerator, _denomenator);
    }
    return self;
}
//methods
//cut - private method - not present in .h files
-(void)cut{
    NSInteger fTop =  self.numerator;
    NSInteger fBottom = self.denomenator;
    NSInteger fTemp =1;
    while(fBottom != 0){
        fTemp = (fTop % fBottom);
        fTop = fBottom;
        fBottom = fTemp;
    }
    self.numerator = self.numerator/fTop;
    self.denomenator = self.denomenator/fTop;
}
//methods (+  -  *  /)
- (NSString*)summ:(FirstTask*)secondNumber{
    self.numerator=(self.numerator * secondNumber.denomenator)+(self.denomenator * secondNumber.numerator);
    self.denomenator=(self.denomenator * secondNumber.denomenator);
    [self cut];
    NSLog(@"Added");
    return [NSString stringWithFormat:@"%li|%li", self.numerator, self.denomenator];
}
- (NSString*)minus:(FirstTask*)secondNumber{
    self.numerator=((self.numerator * secondNumber.denomenator)-(self.denomenator * secondNumber.numerator));
    self.denomenator=(self.denomenator * secondNumber.denomenator);
    [self cut];
    NSLog(@"Subtracted");
    return [NSString stringWithFormat:@"%li|%li", self.numerator, self.denomenator];
}

- (NSString*)multiply:(FirstTask*)secondNumber{
    self.numerator = self.numerator * secondNumber.numerator;
    self.denomenator = self.denomenator * secondNumber.denomenator;
    [self cut];
    NSLog(@"Multiplied");
    return [NSString stringWithFormat:@"%li|%li", self.numerator, self.denomenator];
}

-(NSString*)divide:(FirstTask*)secondNumber{
    self.numerator=self.numerator * secondNumber.denomenator;
    self.denomenator=self.denomenator * secondNumber.numerator;
    [self cut];
    NSLog(@"Divided");
    return [NSString stringWithFormat:@"%li|%li", self.numerator, self.denomenator];
}
@end