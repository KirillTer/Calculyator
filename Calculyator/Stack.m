//
//  Stack.m
//  Calculyator
//
//  Created by Admin on 6/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Stack.h"

@interface Stack()

@property (strong, nonatomic) NSMutableArray *data;
@property (strong, nonatomic) NSDictionary *operationMap;

@end

@implementation Stack

-(id)init {
    if (self=[super init]){
        _data = [[NSMutableArray alloc] init];
    }
    return  self;
}

-(NSMutableArray*)push:(NSString*)anObject {
    [self.data insertObject:anObject atIndex:0];
    //[self.data addObject:anObject];
    return [self compare:anObject];
}

-(NSMutableArray*)compare:(NSString*)lastObj {
    //NSLog(@"data - %@", self.data);
    //NSLog(@"lastObject - '%@'", lastObj);
    NSMutableArray* retObj = [[NSMutableArray alloc] init];
    self.operationMap = @{@"+": @3, @"-": @3, @"*": @4, @"/": @4,};
    if ([self.data count] > 1) {
        for (int i = 1; i < [self.data count]; i++) {
            if ([[self.data objectAtIndex:i-1] isEqualToString:@")"]) {
                [retObj addObject:[self.data objectAtIndex:i]];
                [self.data removeObjectAtIndex:i-1];
                [self.data removeObjectAtIndex:i-1];
                [self.data removeObject:@"("];
            }
            if (!([lastObj isEqualToString:@"("])&&([self.data count] > 1)&&([[self.operationMap valueForKey: lastObj] intValue] <= [[self.operationMap valueForKey: [self.data objectAtIndex:i]] intValue])) {
                //NSLog(@"obj - '%@' prior - %d",[self.data objectAtIndex:i],[[self.operationMap valueForKey: [self.data objectAtIndex:i]] intValue]);
                //NSLog(@"tempObj - %@", [self.data objectAtIndex:i]);
                [retObj addObject:[self.data objectAtIndex:i]];
                [self.data removeObjectAtIndex:i];
                i=0;
            } else {
                break;
            }
        }
    }
    return retObj;
}

-(NSMutableArray*)popAll {
    NSMutableArray *obj = [[NSMutableArray alloc] init];
    for (NSString *tempObj in self.data) {
        [obj addObject:tempObj];
    }
    return obj;
}

@end
