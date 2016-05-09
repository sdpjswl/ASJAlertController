//
//  ViewController.m
//  ASJAlertControllerExample
//
//  Created by sudeep on 09/05/16.
//  Copyright © 2016 sudeep. All rights reserved.
//

#import "ViewController.h"
#import "ASJAlertController+Show.h"

@interface ViewController ()

@property (readonly, copy, nonatomic) NSArray<ASJAlertButton *> *alertButtons;

- (IBAction)showAlert:(id)sender;
- (IBAction)showActionSheet:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)showAlert:(id)sender
{
  [ASJAlertController showAlertWithTitle:@"Test"
                                 message:@"A test alert"
                       cancelButtonTitle:@"Cancel"
                            otherButtons:self.alertButtons
                          preferredStyle:ASJAlertControllerStyleAlert
                              tapHandler:^(ASJAlertAction * _Nullable action, NSString * _Nullable buttonTitle)
   {
     NSString *message = [NSString stringWithFormat:@"You tapped \"%@\"", buttonTitle];
     [self showAlertWithMessage:message];
   }];
}


- (IBAction)showActionSheet:(id)sender
{
  [ASJAlertController showAlertWithTitle:@"Test"
                                 message:@"A test action sheet"
                       cancelButtonTitle:@"Cancel"
                            otherButtons:self.alertButtons
                          preferredStyle:ASJAlertControllerStyleActionSheet
                              tapHandler:^(ASJAlertAction * _Nullable action, NSString * _Nullable buttonTitle)
   {
     NSString *message = [NSString stringWithFormat:@"You tapped \"%@\"", buttonTitle];
     [self showAlertWithMessage:message];
   }];
}

#pragma mark - Helpers

- (NSArray<ASJAlertButton *> *)alertButtons
{
  ASJAlertButton *button1 = [ASJAlertButton buttonWithTitle:@"Button 1" style:ASJAlertActionStyleDestructive];
  ASJAlertButton *button2 = [ASJAlertButton buttonWithTitle:@"Button 2" style:ASJAlertActionStyleDefault];
  ASJAlertButton *button3 = [ASJAlertButton buttonWithTitle:@"Button 3" style:ASJAlertActionStyleDefault];
  
  return @[button1, button2, button3];
}

- (void)showAlertWithMessage:(NSString *)message
{
  [ASJAlertController showAlertWithTitle:@"Message"
                                 message:message
                       cancelButtonTitle:@"OK"
                              tapHandler:^(ASJAlertAction * _Nullable action, NSString * _Nullable buttonTitle) {
                                // handle button taps here
                              }];
}

@end
