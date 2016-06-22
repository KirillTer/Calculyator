//
//  Stack.h
//  Calculyator
//
//  Created by Admin on 6/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

@property (assign,readonly) long count;

-(void)push:(id)anObject;
-(id)compare;
-(id)pop;
-(void)clear;
-(id)lastObject;

@end
