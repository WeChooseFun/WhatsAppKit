//
//  ViewController.m
//  WhatsAppKitDemo
//
//  Created by Fawkes Wei on 7/18/13.
//  Copyright (c) 2013 Fawkes Wei. All rights reserved.
//

#import "ViewController.h"

#import "WhatsAppKit.h"


@interface ViewController ()

@end

@implementation ViewController

//////////////////////////////////////
//
//
//	AQUESTA
//
//
///////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog([WhatsAppKit isWhatsAppInstalled]? @"installed" : @"not installed");
		
}



- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    	
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)launchWhatsApp:(UIButton *)sender {
    if ([WhatsAppKit isWhatsAppInstalled]) {
        [WhatsAppKit launchWhatsApp];
    }
}

- (IBAction)launchWhatsAppWithMessage:(UIButton *)sender {
    if ([WhatsAppKit isWhatsAppInstalled]) {
        [WhatsAppKit launchWhatsAppWithMessage:@"this is demo message"];
    }
}


//////////////////////////////////////
//
//
//	AQUESTA
//
//
///////////////////////////////////////

- (void)launchWhatsAppWithMessageForPerson:(int)uid {
    if ([WhatsAppKit isWhatsAppInstalled]) {
		[WhatsAppKit launchWhatsAppWithAddressBookId:uid andMessage:@"this is demo message"];
		
    }
}


//////////////////////////////////////
//
//
//	AQUESTA
//
//
///////////////////////////////////////
- (IBAction)showPicker:(UIButton *)sender
{
    ABPeoplePickerNavigationController *picker =
	[[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
	
    [self presentModalViewController:picker animated:YES];
}


// STANDARD SHIT
- (void)peoplePickerNavigationControllerDidCancel:
(ABPeoplePickerNavigationController *)peoplePicker
{
    [self dismissModalViewControllerAnimated:YES];
}


// STANDARD SHIT
- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person {
	
    [self displayPerson:person];
    [self dismissModalViewControllerAnimated:YES];
	
    return NO;
}

// STANDARD SHIT
- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                              identifier:(ABMultiValueIdentifier)identifier
{
    return NO;
}

//////////////////////////////////////
//
//
//	AQUESTA
//
//
///////////////////////////////////////


- (void)displayPerson:(ABRecordRef)person
{
//    NSString* name = (__bridge_transfer NSString*)ABRecordCopyValue(person,
//																	kABPersonFirstNameProperty);
//
//	
//    NSString* phone = nil;
//    ABMultiValueRef phoneNumbers = ABRecordCopyValue(person,
//													 kABPersonPhoneProperty);
//    if (ABMultiValueGetCount(phoneNumbers) > 0) {
//		phone = (__bridge_transfer NSString*)
//		ABMultiValueCopyValueAtIndex(phoneNumbers, 0);
//    } else {
//        phone = @"[None]";
//    }
//	NSLog(@"Name: %@", name);
//	NSLog(@"Telf: %@", phone);

	

	NSInteger uid = ABRecordGetRecordID(person);
	NSLog(@"UID: %i", uid);
	
	[self launchWhatsAppWithMessageForPerson:uid];
	
//    CFRelease(phoneNumbers);
}




@end
