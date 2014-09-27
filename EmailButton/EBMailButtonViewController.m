//
//  EBMailButtonViewController.m
//  EmailButton
//
//  Created by Joshua Howland on 6/5/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "EBMailButtonViewController.h"
#import <MessageUI/MessageUI.h>

@interface EBMailButtonViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation EBMailButtonViewController

- (IBAction)sendEmail:(id)sender {

    MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
    
    mailViewController.mailComposeDelegate = self;
    
    [mailViewController setSubject:@"Subject"];
    [mailViewController setMessageBody:@"body here" isHTML:NO];
    
    if ([MFMailComposeViewController canSendMail]) {
        [self presentViewController:mailViewController animated:yes completion:nil];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Can't send mail!" message:@"set up an email address and try again!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    }
    
    [self presentViewController:mailViewController animated:YES completion:nil];
    
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [controller dismissViewControllerAnimated:YES completion:nil];
    
}

@end
