//
//  ViewController.m
//  UITest
//
//  Created by Admin on 9/29/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "ViewController.h"
#import "CalcBrain.h"

@interface ViewController ()
@property (strong, nonatomic)UIBezierPath *bezPath;
@property (weak, nonatomic) IBOutlet ChartView *chartView;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIButton *funcButton;

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
@property (weak, nonatomic) IBOutlet UIButton *buttonScobeOpen;
@property (weak, nonatomic) IBOutlet UIButton *buttonScobeClose;

@property (strong,nonatomic) NSCharacterSet *charSet;
@property (strong,nonatomic) NSString *internalString;
@property (assign,nonatomic) NSInteger *scobeCounter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.chartView.hidden = YES;
    self.text1.text = @"0";
    self.scobeCounter = 0;
    self.charSet = [NSCharacterSet characterSetWithCharactersInString:@"+-*/"];
    self.bezPath = [[UIBezierPath alloc] init];
    [self.bezPath moveToPoint:CGPointMake(0, 0)];
    [self.bezPath addLineToPoint:CGPointMake(100, 100)];
    self.chartView.bezPath = self.bezPath;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)closeAction:(id)sender {
    self.chartView.hidden = YES;
}
- (IBAction)buttonClean:(id)sender{
    self.text1.text = @"0";
}
- (IBAction)funcAction:(id)sender {
    if ([self.text1.text hasPrefix:@"0"] && [self.text1.text length] == 1) {self.text1.text = @"";}
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"X" ];
}

#pragma mark - round scobes
- (IBAction)buttonScobeOpen:(id)sender {
    if ([self.text1.text hasPrefix:@"0"] && [self.text1.text length] == 1) {self.text1.text = @"";}
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"(" ];
    self.scobeCounter += 1;
}
- (IBAction)buttonScobeClose:(id)sender {
    if([self.text1.text containsString:@"("]){
        if ([self.text1.text hasPrefix:@"0"] && [self.text1.text length] == 1) {self.text1.text = @"";}
        self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @")" ];
        self.scobeCounter -= 1;
    }
}

#pragma mark - digits
- (IBAction)numberPressed:(UIButton*)sender {
    NSUInteger number = sender.tag;
    if ([self.text1.text hasPrefix:@"0"] && [self.text1.text length] == 1) {self.text1.text = @"";}
    self.text1.text = [NSString stringWithFormat:@"%@%lu", self.text1.text, (unsigned long)number ];
}

#pragma mark - unar minus
- (IBAction)buttonSign:(id)sender{
    self.internalString = self.text1.text;
    if ([self.text1.text hasPrefix:@"-"] && [self.text1.text length] > 1) {
        self.text1.text = [self.text1.text substringFromIndex:1];
    }
    else if (![self.text1.text  isEqual: @"0"]){
        self.text1.text = [NSString stringWithFormat:@"%@%@", @"-", self.text1.text];
        self.internalString = [NSString stringWithFormat:@"%@%@", @"$", self.internalString];
    }
}

#pragma mark - pointer in float number
- (IBAction)buttonPointer:(id)sender{
    NSString *number = self.text1.text;
    for(NSUInteger i = [self.text1.text length]-1; i >= 1 ; i--) {
        //NSLog(@"Char - %@",[NSString stringWithFormat:@"%c", [self.text1.text characterAtIndex:i]]);
        if (i == [self.text1.text rangeOfCharacterFromSet:self.charSet options:NSBackwardsSearch].location) {
            number = [self.text1.text substringFromIndex:i];
            break;
        }
    }
    if(![number containsString:@"."]){
        self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"." ];
    }
}

#pragma mark - operations
- (IBAction)buttonPlus:(id)sender{
    if (!([self.text1.text length] - 1 == [self.text1.text rangeOfCharacterFromSet:self.charSet options:4].location)) {
        self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"+" ];
    }
}
- (IBAction)buttonSub:(id)sender{
    if (!([self.text1.text length] - 1 == [self.text1.text rangeOfCharacterFromSet:self.charSet options:4].location)) {
        self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"-"];
    }
}
- (IBAction)buttonMult:(id)sender{
    if (!([self.text1.text length] - 1 == [self.text1.text rangeOfCharacterFromSet:self.charSet options:4].location)) {
        self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"*" ];
    }
}
- (IBAction)buttonDevide:(id)sender{
    if (!([self.text1.text length] - 1 == [self.text1.text rangeOfCharacterFromSet:self.charSet options:4].location)) {
        self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"/" ];
    }
}

#pragma mark - result
- (IBAction)buttonRes:(id)sender{
    if (!(self.scobeCounter == 0)) {
        self.text1.text = @"incorrect number of parentheses";
    } else {
        self.Label1.text = self.text1.text;
        CalcBrain *counter = [[CalcBrain alloc] init];
        self.text1.text = [NSString stringWithFormat:@"%@",[counter countValue:self.text1.text]];
        if ([self.text1.text containsString:@"X"]) {
            self.chartView.hidden = NO;
        }
    }
}

@end
