//
//  ViewController.m
//  TipCalculator
//
//  Created by BridgeLabz Solution LLP on 01/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    float value;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)slide:(UISlider *)sender {
    value = sender.value; //getting the slider value
    _tipfield.text = [NSString stringWithFormat:@"$ %2f",value*100];
}


- (IBAction)buttonClicked:(id)sender {
    
    NSString *val = _textField.text;//getting the bill amount
    
    float bill = [val floatValue];
    
    float totalamt = value*bill; //calulating tip amount
    NSString *amount=[NSString stringWithFormat:@"%f",totalamt+bill];
    [_totalfield setText:amount];
}
@end
