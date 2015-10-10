//
//  RationalViewController.m
//  Calculyator
//
//  Created by Admin on 10/10/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "RationalViewController.h"


@interface RationalViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Label1;
@property (weak, nonatomic) IBOutlet UITextField *text1;
@property (weak, nonatomic) IBOutlet UIButton *Clean;
@property (weak, nonatomic) IBOutlet UIButton *button0;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;
@property (weak, nonatomic) IBOutlet UIButton *buttonRes;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlus;
@property (weak, nonatomic) IBOutlet UIButton *buttonSub;
@property (weak, nonatomic) IBOutlet UIButton *buttonMult;
@property (weak, nonatomic) IBOutlet UIButton *buttonDevide;
@property (weak, nonatomic) IBOutlet UIButton *buttonPipe;
@property (weak, nonatomic) IBOutlet UIButton *buttonSign;

@property (strong, nonatomic) NSString* s;
@property (strong, nonatomic) NSString* sign;
@property (strong, nonatomic) FirstTask* firstNumber;
@property (strong, nonatomic) FirstTask* secondNumber;

@end

@implementation RationalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.text1.text = @"0";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonClean:(id)sender{
    self.text1.text = @"0";
}
- (IBAction)button0:(id)sender{
    if([self.text1.text length] > 0){
        self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"0" ];
    }
}
- (IBAction)button1:(id)sender{
    if ([self.text1.text hasPrefix:@"0"] && [self.text1.text length] == 1) {
        self.text1.text = @"";
    }
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"1" ];
}
- (IBAction)button2:(id)sender{
    if ([self.text1.text hasPrefix:@"0"] && [self.text1.text length] == 1) {
        self.text1.text = @"";
    }
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"2" ];
}
- (IBAction)button3:(id)sender{
    if ([self.text1.text hasPrefix:@"0"] && [self.text1.text length] == 1) {
        self.text1.text = @"";
    }
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"3" ];
}
- (IBAction)button4:(id)sender{
    if ([self.text1.text hasPrefix:@"0"] && [self.text1.text length] == 1) {
        self.text1.text = @"";
    }
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"4" ];
}
- (IBAction)button5:(id)sender{
    if ([self.text1.text hasPrefix:@"0"] && [self.text1.text length] == 1) {
        self.text1.text = @"";
    }
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"5" ];
}
- (IBAction)button6:(id)sender{
    if ([self.text1.text hasPrefix:@"0"] && [self.text1.text length] == 1) {
        self.text1.text = @"";
    }
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"6" ];
}
- (IBAction)button7:(id)sender{
    if ([self.text1.text hasPrefix:@"0"] && [self.text1.text length] == 1) {
        self.text1.text = @"";
    }
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"7" ];
}
- (IBAction)button8:(id)sender{
    if ([self.text1.text hasPrefix:@"0"] && [self.text1.text length] == 1) {
        self.text1.text = @"";
    }
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"8" ];
}
- (IBAction)button9:(id)sender{
    if ([self.text1.text hasPrefix:@"0"] && [self.text1.text length] == 1) {
        self.text1.text = @"";
    }
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"9" ];
}
//Sign before number
- (IBAction)buttonSign:(id)sender{
    if ([self.text1.text hasPrefix:@"-"] && [self.text1.text length] > 1) {
        self.text1.text = [self.text1.text substringFromIndex:1];
    }
    else if (![self.text1.text  isEqual: @"0"]){
        self.text1.text = [NSString stringWithFormat:@"%@%@", @"-", self.text1.text ];
    }
}
//Pipe in Rational number
- (IBAction)buttonPipe:(id)sender{
        self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"|" ];
}
//Operations
- (IBAction)buttonPlus:(id)sender{
    self.sign = @"+";
    NSArray *sepArray = [self.text1.text componentsSeparatedByString:@"|"];
    NSInteger a = [[sepArray firstObject] intValue];
    if (![self.text1.text containsString:@"|"]) {
        self.firstNumber = [[FirstTask alloc] initWithFir:a Sec:1];
    }else{
        NSInteger b = [[sepArray lastObject] intValue];
        self.firstNumber = [[FirstTask alloc] initWithFir:a Sec:b];
    }
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"+" ];
}
- (IBAction)buttonSub:(id)sender{
    self.sign = @"-";
    NSArray *sepArray = [self.text1.text componentsSeparatedByString:@"|"];
    NSInteger a = [[sepArray firstObject] intValue];
    if (![self.text1.text containsString:@"|"]) {
        self.firstNumber = [[FirstTask alloc] initWithFir:a Sec:1];
    }else{
        NSInteger b = [[sepArray lastObject] intValue];
        self.firstNumber = [[FirstTask alloc] initWithFir:a Sec:b];
    }
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"-" ];
}
- (IBAction)buttonMult:(id)sender{
    self.sign = @"*";
    NSArray *sepArray = [self.text1.text componentsSeparatedByString:@"|"];
    NSInteger a = [[sepArray firstObject] intValue];
    if (![self.text1.text containsString:@"|"]) {
        self.firstNumber = [[FirstTask alloc] initWithFir:a Sec:1];
    }else{
        NSInteger b = [[sepArray lastObject] intValue];
        self.firstNumber = [[FirstTask alloc] initWithFir:a Sec:b];
    }
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"*" ];
}
- (IBAction)buttonDevide:(id)sender{
    self.sign = @"/";
    NSArray *sepArray = [self.text1.text componentsSeparatedByString:@"|"];
    NSInteger a = [[sepArray firstObject] intValue];
    if (![self.text1.text containsString:@"|"]) {
        self.firstNumber = [[FirstTask alloc] initWithFir:a Sec:1];
    }else{
        NSInteger b = [[sepArray lastObject] intValue];
        self.firstNumber = [[FirstTask alloc] initWithFir:a Sec:b];
    }
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"/" ];
}
//Result
- (IBAction)buttonRes:(id)sender{
    if([self.text1.text containsString:self.sign]){
        NSArray *signSepArray = [self.text1.text componentsSeparatedByString:self.sign];
        self.s = [signSepArray lastObject];
        NSArray *sepArray = [self.s componentsSeparatedByString:@"|"];
        NSInteger a = [[sepArray firstObject] intValue];
        if (![self.s containsString:@"|"]) {
            self.secondNumber = [[FirstTask alloc] initWithFir:a Sec:1];
        }else{
            NSInteger b = [[sepArray lastObject] intValue];
            self.secondNumber = [[FirstTask alloc] initWithFir:a Sec:b];
        }
    }
    if([self.sign isEqual:@"+"]){
        self.text1.text = [self.firstNumber summ:self.secondNumber];
    }
    if([self.sign isEqual:@"-"]){
        self.text1.text = [self.firstNumber minus:self.secondNumber];
    }
    if([self.sign isEqual:@"*"]){
        self.text1.text = [self.firstNumber multiply:self.secondNumber];
    }
    if([self.sign isEqual:@"/"]){
        self.text1.text = [self.firstNumber divide:self.secondNumber];
    }
    NSArray *sepArray = [self.text1.text componentsSeparatedByString:@"|"];
    NSInteger a = [[sepArray firstObject] intValue];
    NSInteger b = [[sepArray lastObject] intValue];
    self.firstNumber = [[FirstTask alloc] initWithFir:a Sec:b];
}
@end
