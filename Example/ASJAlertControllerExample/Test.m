//
//  Test.m
//  ASJAlertControllerExample
//
//  Created by ABS_MAC02 on 11/06/16.
//  Copyright © 2016 ABS_MAC02. All rights reserved.
//

#import "Test.h"

@interface Test ()

- (IBAction)dismissTapped:(id)sender;

@end

@implementation Test

- (IBAction)dismissTapped:(id)sender
{
  if (_buttonTappedBlock) {
    _buttonTappedBlock();
  }
}

@end
