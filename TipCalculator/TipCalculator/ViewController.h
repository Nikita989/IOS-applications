//
//  ViewController.h
//  TipCalculator
//
//  Created by BridgeLabz Solution LLP on 01/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


- (IBAction)slide:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *tipfield;
@property (weak, nonatomic) IBOutlet UILabel *totalfield;
- (IBAction)buttonClicked:(id)sender;

@end

