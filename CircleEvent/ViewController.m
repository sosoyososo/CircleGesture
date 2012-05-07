//
//  ViewController.m
//  CircleEvent
//
//  Created by Xizhu on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "CircleGesture.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)GestureHasCircledByAngle:(CGFloat)angle {
    NSLog(@"%s", __FUNCTION__);
    
    NSLog(@"view isCircling , angle :  %f", angle);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CircleGesture *gesture = [[CircleGesture alloc] init];
    gesture.delegate = self;
    [self.view addGestureRecognizer:gesture];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
