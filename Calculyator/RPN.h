//
//  RPN.h
//  Calculyator
//
//  Created by Admin on 6/13/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPN : NSObject

- (NSMutableArray *)convertToRPN:(NSString *)incomeString;

@end
