//
//  Stack.m
//  Calculyator
//
//  Created by Admin on 6/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Stack.h"

@interface Stack()
@property (strong) NSMutableArray *data;
@end

@implementation Stack

typedef enum ShapeType : NSUInteger {
    kCircle,
    kRectangle,
    kOblateSpheroid
} ShapeType;

-(id)init {
    if (self=[super init]){
        _data = [[NSMutableArray alloc] init];
        _count = 0;
    }
    return  self;
}

-(void)push:(id)anObject {
    [self.data addObject:anObject];
    _count++;
    [self compare:anObject];
}

-(id)compare:(id)lastObject {
    id obj = nil;
    id lastObj = nil;
    for (id tempObj in _data) {

    }
    return obj;
}

-(id)pop {
    id obj = nil;
    if ([self.data count] > 0){
        obj = [self.data lastObject];
        [self.data removeLastObject];
        _count = self.data.count;
    }
    return obj;
}

-(void)clear {
    [self.data removeAllObjects];
    _count = 0;
}

-(id)lastObject {
    id obj = nil;
    if ([self.data count] > 0){
        obj = [self.data lastObject];
    }
    return obj;
}

@end
