//
//  ViewController.m
//  ImagePicker
//
//  Created by BridgeLabz Solution LLP on 03/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //loading the audio file
    NSURL *soundurl=[[NSBundle mainBundle]URLForResource:@"Bloomp" withExtension:@"aiff"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundurl, &mySound);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    UIImagePickerController *imagePicker=[[UIImagePickerController alloc]init];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [imagePicker setDelegate:self];
    [self presentViewController:imagePicker animated:YES completion:NULL];
    
}



//method to recognize panGesture
-(void)panGestureRecognized:(UIPanGestureRecognizer*)gesture
{
    AudioServicesPlaySystemSound(mySound);
    CGPoint point=[gesture locationInView:[self view]];
    [[self view]bringSubviewToFront:[gesture view]];
    [[gesture view]setCenter:point];
    
    
}



//method to recognize tapGesture
-(void)tapGestureRecognized:(UITapGestureRecognizer*)gesture
{
    [[self view]bringSubviewToFront:[gesture view]];
    [UIView animateWithDuration:0.2 animations:^{
    
        [[gesture view]setBounds:CGRectMake(0, 0, 100, 100)];
    
    
    } completion:^(BOOL finished){
    
        
        [UIView animateWithDuration:0.2 animations:^{
        
            [[gesture view]setBounds:CGRectMake(0, 0, 80, 80)];
        
        
        
        }];
    
    
    
    }];
    
    
}



-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image=[info objectForKey:UIImagePickerControllerOriginalImage];
    UIImageView *newimage=[[UIImageView alloc]initWithImage:image];
    [newimage setFrame:CGRectMake(-80, -80, 80, 80)];
    [newimage setUserInteractionEnabled:YES];
    UIPanGestureRecognizer *gestureRecognizer=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureRecognized:)];
    [newimage addGestureRecognizer:gestureRecognizer];
    
    
    
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureRecognized:)];
    
    [newimage addGestureRecognizer:tapGesture];
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        AudioServicesPlaySystemSound(mySound);
     [[self view]addSubview:newimage];
        
        [UIView animateWithDuration:0.5 animations:^{
            [newimage setFrame:CGRectMake(arc4random_uniform(240), arc4random_uniform(300), 80, 80)];
            

        }];
    
    }];
    
    
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}






@end
