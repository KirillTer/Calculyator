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
@property (strong,nonatomic) NSCharacterSet *charSetOper;
@property (strong,nonatomic) NSString *internalString;
@property (strong,nonatomic) NSString *number;
@property (assign,nonatomic) NSInteger *scobeCounter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.chartView.hidden = YES;
    self.text1.text = @"0";
    self.internalString = @"0";
    self.scobeCounter = 0;
    self.number = @"";
    self.charSet = [NSCharacterSet characterSetWithCharactersInString:@"+-*/()"];
    self.charSetOper = [NSCharacterSet characterSetWithCharactersInString:@"+-*/"];
    self.bezPath = [[UIBezierPath alloc] init];
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
    self.internalString = @"0";
    self.scobeCounter = 0;
    self.Label1.text = @"0";
}

#pragma mark - Drow Graph Button
- (IBAction)funcAction:(id)sender {
    if ([self.text1.text hasPrefix:@"0"] && [self.text1.text length] == 1) {self.text1.text = @""; self.internalString = @"";}
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"X" ];
}

#pragma mark - round scobes
- (IBAction)buttonScobeOpen:(id)sender {
    if ([self.text1.text hasPrefix:@"0"] && [self.text1.text length] == 1) {self.text1.text = @""; self.internalString = @"";}
    self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"(" ];
    self.internalString = [NSString stringWithFormat:@"%@%@", self.internalString, @"(" ];
    self.scobeCounter += 1;
}
- (IBAction)buttonScobeClose:(id)sender {
    if([self.text1.text containsString:@"("]){
        if ([self.text1.text hasPrefix:@"0"] && [self.text1.text length] == 1) {self.text1.text = @""; self.internalString = @"";}
        self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @")" ];
        self.internalString = [NSString stringWithFormat:@"%@%@", self.internalString, @")" ];
        self.scobeCounter -= 1;
    }
}

#pragma mark - digits
- (IBAction)numberPressed:(UIButton*)sender {
    NSUInteger number = sender.tag;
    if ([self.text1.text hasPrefix:@"0"] && [self.text1.text length] == 1) {self.text1.text = @""; self.internalString = @"";}
    self.text1.text = [NSString stringWithFormat:@"%@%lu", self.text1.text, (unsigned long)number ];
    self.internalString = [NSString stringWithFormat:@"%@%lu", self.internalString, (unsigned long)number ];
}

#pragma mark - unar minus
- (IBAction)buttonSign:(id)sender {
    if ([self.text1.text hasPrefix:@"-"]) {
        self.number = [self.text1.text stringByReplacingOccurrencesOfString:@"-" withString:@"$"];
    } else {
        self.number = self.internalString;
    }
    for(NSInteger i = [self.text1.text length]-1; i >= 0 ; i--) {
        //NSLog(@"Char - %@",[NSString stringWithFormat:@"%c", [self.text1.text characterAtIndex:i]]);
        if (i == [self.internalString rangeOfCharacterFromSet:self.charSet options:NSBackwardsSearch].location) {
            self.number = [self.internalString substringFromIndex:i+1];
            break;
        }
    }
    self.text1.text = [self.text1.text substringToIndex:[self.text1.text length]-[self.number length]];
    self.internalString = [self.internalString substringToIndex:[self.internalString length]-[self.number length]];
    if ([self.number hasPrefix:@"$"]) {
        self.number = [self.number substringFromIndex:1];
        self.text1.text = [NSString stringWithFormat:@"%@%@",self.text1.text, self.number];
        self.internalString = [NSString stringWithFormat:@"%@%@",self.internalString, self.number];
    } else if ((![self.text1.text  isEqual: @"0"]) && (![self.number isEqual:@""])) {
        self.text1.text = [NSString stringWithFormat:@"%@%@%@",self.text1.text, @"-", self.number];
        self.internalString = [NSString stringWithFormat:@"%@%@%@",self.internalString, @"$", self.number];
    }
    NSLog(@"%@",self.text1.text);
    NSLog(@"%@",self.internalString);
}

#pragma mark - pointer in float number
- (IBAction)buttonPointer:(id)sender {
    NSString *number = self.text1.text;
    for(NSUInteger i = [self.text1.text length]-1; i >= 1 ; i--) {
        //NSLog(@"Char - %@",[NSString stringWithFormat:@"%c", [self.text1.text characterAtIndex:i]]);
        if (i == [self.text1.text rangeOfCharacterFromSet:self.charSet options:NSBackwardsSearch].location) {
            number = [self.text1.text substringFromIndex:i];
            break;
        }
    }
    if(![number containsString:@"."]) {
        self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"."];
        self.internalString = [NSString stringWithFormat:@"%@%@", self.internalString, @"."];
    }
}

#pragma mark - operations
- (IBAction)buttonPlus:(id)sender {
    if (!([self.text1.text length] - 1 == [self.text1.text rangeOfCharacterFromSet:self.charSetOper options:4].location)) {
        self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"+"];
        self.internalString = [NSString stringWithFormat:@"%@%@", self.internalString, @"+"];
    }
}
- (IBAction)buttonSub:(id)sender {
    if (!([self.text1.text length] - 1 == [self.text1.text rangeOfCharacterFromSet:self.charSetOper options:4].location)) {
        self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"-"];
        self.internalString = [NSString stringWithFormat:@"%@%@", self.internalString, @"-"];
    }
}
- (IBAction)buttonMult:(id)sender {
    if (!([self.text1.text length] - 1 == [self.text1.text rangeOfCharacterFromSet:self.charSetOper options:4].location)) {
        self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"*"];
        self.internalString = [NSString stringWithFormat:@"%@%@", self.internalString, @"*"];
    }
}
- (IBAction)buttonDevide:(id)sender {
    if (!([self.text1.text length] - 1 == [self.text1.text rangeOfCharacterFromSet:self.charSetOper options:4].location)) {
        self.text1.text = [NSString stringWithFormat:@"%@%@", self.text1.text, @"/"];
        self.internalString = [NSString stringWithFormat:@"%@%@", self.internalString, @"/"];
    }
}

#pragma mark - result
- (IBAction)buttonRes:(id)sender {
    if (!(self.scobeCounter == 0)) {
        self.text1.text = @"incorrect number of parentheses";
    } else {
        self.Label1.text = self.text1.text;
        CalcBrain *counter = [[CalcBrain alloc] init];
        if ([self.text1.text containsString:@"X"]) {
            self.bezPath = [counter buildChartPathWith:self.text1.text forSize:self.chartView.bounds.size];
            self.chartView.bezPath = self.bezPath;
            [self.view bringSubviewToFront:self.chartView];
            [self.chartView setNeedsDisplay];
            self.chartView.hidden = NO;
        } else {
//            NSLog(@"self.text1.text - %@",self.text1.text);
//            NSLog(@"self.internalString - %@",self.internalString);
            self.text1.text = [NSString stringWithFormat:@"%@",[counter countValue:self.internalString]];
            if ([self.text1.text hasPrefix:@"-"]) {
                self.internalString = [self.text1.text stringByReplacingOccurrencesOfString:@"-" withString:@"$"];
            } else {
                self.internalString = self.text1.text;
            }
        }
    }
}
@end
