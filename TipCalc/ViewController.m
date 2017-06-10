//
//  ViewController.m
//  TipCalculator
//
//  Created by Katrina de Guzman on 2017-06-09.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UISlider *tipPercentageSlider;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property float currentVal;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _tipPercentageSlider.minimumValue = 10;
    _tipPercentageSlider.maximumValue = 30;
}
- (IBAction)tipPercentSlider:(id)sender
{
    _currentVal = (int)self.tipPercentageSlider.value;
    NSLog(@"%f", self.currentVal);
    
    NSString* tipString = [NSString stringWithFormat:@"%.f", self.currentVal];
    self.tipLabel.text = tipString;
}

- (IBAction)calculateTipButton:(id)sender
{
    float total =  [[self.billAmountTextField text] floatValue];
    float totalWithTip = total * (self.currentVal/100) + total ;
    NSString* totalWithTipString = [NSString stringWithFormat:@"%.2f", totalWithTip];
    self.totalLabel.text = totalWithTipString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
