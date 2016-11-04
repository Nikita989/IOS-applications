//
//  ViewController.h
//  ImagePicker
//
//  Created by BridgeLabz Solution LLP on 03/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "AudioToolbox/AudioToolbox.h"
#import <AudioToolbox/AudioToolbox.h>
@interface ViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    
    SystemSoundID mySound;
}
- (IBAction)buttonPressed:(UIButton *)sender;

@end

