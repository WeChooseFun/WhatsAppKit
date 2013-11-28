//
//  ViewController.h
//  WhatsAppKitDemo
//
//  Created by Fawkes Wei on 7/18/13.
//  Copyright (c) 2013 Fawkes Wei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ViewController : UIViewController<ABPeoplePickerNavigationControllerDelegate>

- (IBAction)launchWhatsApp:(UIButton *)sender;
- (IBAction)launchWhatsAppWithMessage:(UIButton *)sender;




//marc

@property (weak, nonatomic) IBOutlet UILabel *firstName;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;

- (IBAction)showPicker:(UIButton *)sender;

@end
