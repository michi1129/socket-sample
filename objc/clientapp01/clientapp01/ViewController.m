//
//  ViewController.m
//  clientapp01
//
//  Created by 大道　亮 on 12/05/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize sendMessage;
@synthesize sendButton;
@synthesize sendButtonPressed;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setSendMessage:nil];
    [self setSendButtonPressed:nil];
    [self setSendButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [sendMessage release];
    [sendButtonPressed release];
    [sendButton release];
    [super dealloc];
}
@end
