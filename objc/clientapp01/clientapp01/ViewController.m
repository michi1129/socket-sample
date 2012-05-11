//
//  ViewController.m
//  clientapp01
//
//  Created by ro on 12/05/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize sendMessage;
@synthesize sendButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setSendMessage:nil];
    [self setSendButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc
{
    [sendMessage release];
    [sendButton release];
    [super dealloc];
}

- (IBAction)sendButtonPressed:(id)sender
{
//    UInt8 buffer[] = "Hello, i'm socket on macosx";
    const char* buffer = [sendMessage.text cStringUsingEncoding:NSUTF8StringEncoding];
    
    SInt32 port = 15555;
    CFStringRef hostname = (CFStringRef)@"192.168.22.108";
    
    CFHostRef host = CFHostCreateWithName(kCFAllocatorDefault, hostname);
    CFReadStreamRef readStream = NULL;
    CFWriteStreamRef writeStream = NULL;
    CFStreamCreatePairWithSocketToCFHost(kCFAllocatorDefault, host, port, &readStream, &writeStream);
    
    BOOL bothStreamOpened = YES;
    if (!CFReadStreamOpen(readStream)) {
        NSLog(@"read stream is not open.");
        
        bothStreamOpened = NO;
        CFReadStreamClose(readStream);
        CFRelease(readStream);
    }
    if (!CFWriteStreamOpen(writeStream)) {
        NSLog(@"write stream is not open.");
        
        bothStreamOpened = NO;
        CFWriteStreamClose(writeStream);
        CFRelease(writeStream);
    }
    if (!bothStreamOpened) {
        return;
    }
    
    NSLog(@"both stream are opened.");
    CFIndex bufLen = (CFIndex)strlen(buffer);
    CFIndex writtenBytes = CFWriteStreamWrite(writeStream, buffer, bufLen);
    
    NSLog(@"writeten: [%ld] %s",writtenBytes,buffer);
    
    CFReadStreamClose(readStream);
    CFRelease(readStream);
    CFWriteStreamClose(writeStream);
    CFRelease(writeStream);
}

@end
