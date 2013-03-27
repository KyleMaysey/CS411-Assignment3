//
//  CalculatorModel.h
//  Calculator
//
//  Created by Kyle Maysey on 3/26/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//
//  Purpose:    Simple model for storing values and operations to be performed in calculations.
//              Values only sent to model from view via viewController when operations are
//              requested.

#import <Foundation/Foundation.h>

@interface CalculatorModel : NSObject

@property (assign) double leftHandOperator; //Stores left hand side of operations
@property (assign) int previousOperator;    //Stores the operation requested

//Purpose:  Uses model information to perform math operation
//Input:    double value for RHS of operation
-(double) performOperationWith:(double)rhs;

//Purpose:  Reset values in model
//Input:    None
-(void) resetValues;

@end
