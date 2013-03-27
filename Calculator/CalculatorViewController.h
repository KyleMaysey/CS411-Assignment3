//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Kyle Maysey on 3/26/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorModel.h"

@interface CalculatorViewController : UIViewController
{
    BOOL hasDecimal;    //Variable to decide when resultField has a decimal
    BOOL editBegan;     //Variable to know when operands are being entered
}

@property (weak, nonatomic) IBOutlet UILabel *resultField;  //Outlet for result of calculations
@property (strong, nonatomic) CalculatorModel *calcValues;  //Simple model to store values and perform calculations

//Purpose: Build value in text field
//Input: operand button, use tag to determine value
- (IBAction)OperandPressed:(UIButton *)sender;      //Action sent by operand buttons

//Purpose: Prepare values for operation when operator button pressed
//Input: Operator buttons, use tag to determine action
- (IBAction)OperatorPressed:(UIButton *)sender;     //Action sent by operator buttons

@end
