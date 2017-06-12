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
@property (weak, nonatomic) IBOutlet UILabel *numberOfPeopleLabel;
@property (weak, nonatomic) IBOutlet UISlider *numberOfPeopleSlider;
@property int people;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _tipPercentageSlider.minimumValue = 10;
    _tipPercentageSlider.maximumValue = 30;
    
    _numberOfPeopleSlider.minimumValue = 2;
    _numberOfPeopleSlider.maximumValue = 8;
    _totalLabel.text = @"0.00";
}
- (IBAction)tipPercentSlider:(id)sender
{
    _currentVal = (int)self.tipPercentageSlider.value;
    NSLog(@"%f", self.currentVal);
    
    NSString* tipString = [NSString stringWithFormat:@"%.f%%", self.currentVal];
    self.tipLabel.text = tipString;
    
    float total =  [[self.billAmountTextField text] floatValue];
    float totalWithTip = total * (self.currentVal/100) + total ;
    float divideByPeople = totalWithTip/(1*self.people);
    NSString* totalWithTipString = [NSString stringWithFormat:@"%.2f", divideByPeople];
    self.totalLabel.text = totalWithTipString;
}
- (IBAction)calculateTipButton:(id)sender
{

}
- (IBAction)numberOfPeopleSlider:(id)sender
{
    _people = (int)self.numberOfPeopleSlider.value;
    NSString* peopleString = [NSString stringWithFormat:@"%i people", self.people];
    self.numberOfPeopleLabel.text = peopleString;
    
    float total =  [[self.billAmountTextField text] floatValue];
    float totalWithTip = total * (self.currentVal/100) + total ;
    float divideByPeople = totalWithTip/(1*self.people);
    NSString* totalWithTipString = [NSString stringWithFormat:@"%.2f", divideByPeople];
    self.totalLabel.text = totalWithTipString;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
