//
//  FirstTask.h
//  Cousres_ThinkMobiles
//
//  Created by Admin on 8/16/15.
//  Copyright (c) 2015 Kirill Tereschenko. All rights reserved.
//

#ifndef Cousres_ThinkMobiles_FirstTask_h
#define Cousres_ThinkMobiles_FirstTask_h

#endif

@interface FirstTask : NSObject <NSObject>

    @property (assign, nonatomic) NSInteger numerator;
    @property (assign, nonatomic) NSInteger denomenator;
 
//Constructors
- (instancetype)init;
- (instancetype)initWithOne: (NSInteger)number;
- (instancetype)initWithFir: (NSInteger)number1 Sec: (NSInteger)number2;

//Methods

- (NSString*)summ:(FirstTask*) secondNumber;
- (NSString*)minus:(FirstTask*) secondNumber;
- (NSString*)multiply:(FirstTask*) secondNumber;
- (NSString*)divide:(FirstTask*) secondNumber;

@end