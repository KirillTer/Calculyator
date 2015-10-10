//
//  ViewController.m
//  UITest
//
//  Created by Admin on 9/29/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
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
@property (weak, nonatomic) IBOutlet UIButton *buttonPoint;
@property (weak, nonatomic) IBOutlet UIButton *buttonSign;
@property (weak, nonatomic) IBOutlet UIButton *buttonPolinom;
@property (weak, nonatomic) IBOutlet UIButton *buttonMatrix;

@property (strong, nonatomic) NSString* s;
@property (strong, nonatomic) NSString* sign;
@property (assign, nonatomic) float a;
@property (assign, nonatomic) float b;

@end

@implementation ViewController

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
//Pointer in float number
- (IBAction)buttonPointer:(id)sender{
    if(![self.text1.text containsString:@"."]){
        self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"." ];
    }
}
//Operations
- (IBAction)buttonPlus:(id)sender{
    self.sign = @"+";
    self.a = [self.text1.text floatValue];
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"+" ];
    self.b = 0.0f;
}
- (IBAction)buttonSub:(id)sender{
    self.sign = @"-";
    self.a = [self.text1.text floatValue];
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"-"];
    self.b = 0.0f;
}
- (IBAction)buttonMult:(id)sender{
    self.sign = @"*";
    self.a = [self.text1.text floatValue];
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"*" ];
    self.b = 0.0f;
}
- (IBAction)buttonDevide:(id)sender{
    self.sign = @"/";
    self.a = [self.text1.text floatValue];
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"/" ];
    self.b = 0.0f;
}
//Result
- (IBAction)buttonRes:(id)sender{
    if(self.b == 0.0f){
        NSArray *sepArray = [self.text1.text componentsSeparatedByString:self.sign];
        self.b = [[sepArray lastObject] floatValue];
    }
    if([self.sign isEqual:@"+"]){
        self.text1.text = [NSString stringWithFormat:@"%f",(self.a + self.b)];
    }
    if([self.sign isEqual:@"-"]){
        self.text1.text = [NSString stringWithFormat:@"%f",(self.a - self.b)];
    }
    if([self.sign isEqual:@"*"]){
        self.text1.text = [NSString stringWithFormat:@"%f",(self.a * self.b)];
    }
    if([self.sign isEqual:@"/"]){
        self.text1.text = [NSString stringWithFormat:@"%f",(self.a / self.b)];
    }
    _a = [self.text1.text floatValue];
    NSArray *sepArray = [self.text1.text componentsSeparatedByString:@"."];
    CGFloat rest = [[sepArray lastObject] floatValue];
    NSLog(@"%f |a = %f |b = %f | %@",rest, _a, _b, _sign);
    if((rest <= 1.0f) || (rest >= 999999.0f)){
        self.text1.text = [NSString stringWithFormat:@"%d",(int)roundf([self.text1.text floatValue])];
    }
}
@end
