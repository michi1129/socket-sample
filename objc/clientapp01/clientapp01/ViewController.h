//
//  ViewController.h
//  clientapp01
//
//  Created by ro on 12/05/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *sendMessage;
@property (retain, nonatomic) IBOutlet UIButton *sendButton;

- (IBAction)sendButtonPressed:(id)sender;

@end
