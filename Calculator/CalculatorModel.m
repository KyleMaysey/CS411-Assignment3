//
//  CalculatorModel.m
//  Calculator
//
//  Created by Kyle Maysey on 3/26/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import "CalculatorModel.h"

@implementation CalculatorModel

//Purpose:  Uses model information to perform math operation
//Input:    double value for RHS of operation
-(double) performOperationWith:(double)rhs
{
    double result;
    switch (self.previousOperator)
    {
        case 1:     //subtraction tag
            
            result = self.leftHandOperator - rhs;
            break;
        
        case 2:     //addition tag
            
            result = self.leftHandOperator + rhs;
            break;
        
        case 3:     //division tag
            
            result = self.leftHandOperator / rhs;
            break;
        
        case 4:     //Multiplication tag
            
            result = self.leftHandOperator * rhs;
            break;
            
        default:    //If a number is entered and presses equal
            result = rhs;
            break;
    }
    
    return result;
}

-(void) resetValues
{
    self.leftHandOperator = 0.0;
    self.previousOperator = 0;
}

@end
