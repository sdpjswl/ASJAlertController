//
//  Test.h
//  ASJAlertControllerExample
//
//  Created by ABS_MAC02 on 11/06/16.
//  Copyright © 2016 ABS_MAC02. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonTappedBlock)();

@interface Test : UIView

@property (copy) ButtonTappedBlock buttonTappedBlock;

- (void)setButtonTappedBlock:(ButtonTappedBlock)buttonTappedBlock;

@end
