//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Kyle Maysey on 3/26/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    hasDecimal = FALSE;
    editBegan = FALSE;
    
    self.calcValues = [[CalculatorModel alloc] init];
    self.calcValues.previousOperator = 0;       
    self.calcValues.leftHandOperator = 0.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Purpose: Build value in text field
//Input: operand button, use tag to determine value
- (IBAction)OperandPressed:(UIButton *)sender
{
    if(editBegan)
    {
        self.resultField.text = [NSString stringWithFormat:@"%@%d", self.resultField.text, sender.tag];
    }
    else if (sender.tag != 0)
    {
        self.resultField.text = [NSString stringWithFormat:@"%d", sender.tag];
        editBegan = TRUE;
    }
}

//Purpose: Prepare values for operation when operator button pressed
//Input: Operator buttons, use tag to determine action
- (IBAction)OperatorPressed:(UIButton *)sender
{
    
    switch (sender.tag) {
        case 0:     //Press '=' operator
            
            
            self.resultField.text = [NSString stringWithFormat:@"%f",[self.calcValues performOperationWith:[self.resultField.text doubleValue]]];
            
            hasDecimal = FALSE;
            editBegan = FALSE;
            
            self.calcValues.previousOperator = 0;
            
            break;
        case 1:     //Subtraction
        case 2:     //Addition
        case 3:     //Division
        case 4:     //Multplication
            
            if (self.calcValues.previousOperator != 0)
            {
                self.resultField.text = [NSString stringWithFormat:@"%f",[self.calcValues performOperationWith:[self.resultField.text doubleValue]]];
            }
            
            self.calcValues.previousOperator = sender.tag;
            self.calcValues.leftHandOperator = [self.resultField.text doubleValue];
            
            hasDecimal = FALSE;
            editBegan = FALSE;
            
            break;
            
        case 5:     //Decimal point
            
            if (!hasDecimal)
            {
                hasDecimal = TRUE;
                
                if(!editBegan)
                {
                    self.resultField.text = @"0.";
                    editBegan = TRUE;
                }
                else
                {
                    self.resultField.text = [NSString stringWithFormat:@"%@.", self.resultField.text];
                }
            }
            
            break;
        
        case 6:     //Sqrt
            
            if([self.resultField.text doubleValue] < 0.0)
            {
                self.resultField.text = @"Imaginary Number";
            }
            else
            {
                self.resultField.text = [NSString stringWithFormat:@"%f", sqrt([self.resultField.text doubleValue])];
            }
            
            hasDecimal = FALSE;
            editBegan = FALSE;
            break;
        
        case 7:     //Negation
            
            self.resultField.text = [NSString stringWithFormat:@"%f", [self.resultField.text doubleValue] * -1.0];
                

            break;
        
        case 8: //Reset all values when AC is pressed
            
            self.resultField.text = @"0";
            hasDecimal = FALSE;
            editBegan = FALSE;
            
            [self.calcValues resetValues];
            
            break;
            
            
        default:
            break;
    }
}
@end
