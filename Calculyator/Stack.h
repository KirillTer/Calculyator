//
//  Stack.h
//  Calculyator
//
//  Created by Admin on 6/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

-(NSMutableArray*)push:(NSString*)anObject;
-(NSMutableArray*)compare:(NSString*)lastObject;
-(NSMutableArray*)popAll;

@end
