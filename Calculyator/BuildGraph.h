//
//  BuildGraph.h
//  Calculyator
//
//  Created by Admin on 7/9/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BuildGraph : NSObject

- (UIBezierPath *)buildGraphPathWith:(NSString *)equation forSize:(CGSize)viewSize;

@end
