//
// ASJAlertController+Show.h
//
// Copyright (c) 2016 Sudeep Jaiswal
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

@import UIKit;

typedef UIAlertController ASJAlertController;
typedef UIAlertAction ASJAlertAction;

NS_ASSUME_NONNULL_BEGIN

typedef void(^TapHandler)(ASJAlertAction * _Nullable action, NSString * _Nullable buttonTitle);

typedef NS_ENUM(NSInteger, ASJAlertControllerStyle)
{
  ASJAlertControllerStyleActionSheet,
  ASJAlertControllerStyleAlert
};

typedef NS_ENUM(NSInteger, ASJAlertActionStyle)
{
  ASJAlertActionStyleDefault = 0,
  ASJAlertActionStyleDestructive = 2
};

@class ASJAlertButton;

@interface UIAlertController (Show)

/**
 *  Creates and shows an alert using title, message and cancel title. DOES NOT require a view controller to be presented upon.
 *
 *  @param title       The alert's title.
 *  @param message     The alert's message.
 *  @param cancelTitle The cancel button's title. Tapping it should ONLY dismiss the alert.
 *  @param tapHandler  A block to handle any button tapped on the alert.
 *
 *  @return Returns an instance of UIAlertController.
 */
+ (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                 cancelButtonTitle:(nullable NSString *)cancelTitle
                        tapHandler:(nullable TapHandler)tapHandler;

/**
 *  Creates and shows an action sheet using title, message and cancel title. DOES NOT require a view controller to be presented upon.
 *
 *  @param title       The action sheet's title.
 *  @param message     The action sheet's message.
 *  @param cancelTitle The cancel button's title. Tapping it should ONLY dismiss the alert.
 *  @param tapHandler  A block to handle any button tapped on the alert.
 *
 *  @return Returns an instance of UIAlertController.
 */
+ (instancetype)showActionSheetWithTitle:(nullable NSString *)title
                                 message:(nullable NSString *)message
                       cancelButtonTitle:(nullable NSString *)cancelTitle
                              tapHandler:(nullable TapHandler)tapHandler;

/**
 *  Creates and shows an alert/action sheet using title, message and cancel title and other button objects. DOES NOT require a view controller to be presented upon.
 *
 *  @param title        The alert's title.
 *  @param message      The alert's message.
 *  @param cancelTitle  The cancel button's title. Tapping it should ONLY dismiss the alert.
 *  @param otherButtons An array of 'ASJAlertButton' objects to be shown on the alert.
 *  @param style        Specify whether it's an alert or action sheet.
 *  @param tapHandler   A block to handle any button tapped on the alert.
 *
 *  @return Returns an instance of UIAlertController.
 */
+ (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                 cancelButtonTitle:(nullable NSString *)cancelTitle
                      otherButtons:(nullable NSArray<ASJAlertButton *> *)otherButtons
                    preferredStyle:(ASJAlertControllerStyle)style
                        tapHandler:(nullable TapHandler)tapHandler;

/**
 *  Creates an alert/action sheet using title, message and cancel title and other button objects. It is your call when to present it on the screen.
 *
 *  @param title        The alert's title.
 *  @param message      The alert's message.
 *  @param cancelTitle  The cancel button's title. Tapping it should ONLY dismiss the alert.
 *  @param otherButtons An array of 'ASJAlertButton' objects to be shown on the alert.
 *  @param style        Specify whether it's an alert or action sheet.
 *  @param tapHandler   A block to handle any button tapped on the alert.
 *
 *  @return Returns an instance of UIAlertController.
 */
+ (instancetype)alertWithTitle:(nullable NSString *)title
                       message:(nullable NSString *)message
             cancelButtonTitle:(nullable NSString *)cancelTitle
                  otherButtons:(nullable NSArray<ASJAlertButton *> *)otherButtons
                preferredStyle:(ASJAlertControllerStyle)style
                    tapHandler:(nullable TapHandler)tapHandler;

/**
 *  Creates and shows an alert/action sheet using title, message and cancel title and other button strings.
 *
 *  @param title            The alert's title.
 *  @param message          The alert's message.
 *  @param cancelTitle      The cancel button's title. Tapping it should ONLY dismiss the alert.
 *  @param destructiveTitle The destructive button's title. Tapping it should dismiss the alert AND perform some destructive action such as deleting data.
 *  @param otherTitles      An array of strings for any other buttons in the alert.
 *  @param style            Specify whether it's an alert or action sheet.
 *  @param tapHandler       A block to handle any button tapped on the alert.
 *
 *  @return Returns an instance of UIAlertController.
 */
+ (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                 cancelButtonTitle:(nullable NSString *)cancelTitle
            destructiveButtonTitle:(nullable NSString *)destructiveTitle
                       otherTitles:(nullable NSArray <NSString *>*)otherTitles
                    preferredStyle:(ASJAlertControllerStyle)style
                        tapHandler:(nullable TapHandler)tapHandler;

/**
 *  Creates an alert/action sheet using title, message and cancel title and other button strings. It is your call when to present it on the screen.
 *
 *  @param title            The alert's title.
 *  @param message          The alert's message.
 *  @param cancelTitle      The cancel button's title. Tapping it should ONLY dismiss the alert.
 *  @param destructiveTitle The destructive button's title. Tapping it should dismiss the alert AND perform some destructive action such as deleting data.
 *  @param otherTitles      An array of strings for any other buttons in the alert.
 *  @param style            Specify whether it's an alert or action sheet.
 *  @param tapHandler       A block to handle any button tapped on the alert.
 *
 *  @return Returns an instance of UIAlertController.
 */
+ (instancetype)alertWithTitle:(nullable NSString *)title
                       message:(nullable NSString *)message
             cancelButtonTitle:(nullable NSString *)cancelTitle
        destructiveButtonTitle:(nullable NSString *)destructiveTitle
                   otherTitles:(nullable NSArray <NSString *>*)otherTitles
                preferredStyle:(ASJAlertControllerStyle)style
                    tapHandler:(nullable TapHandler)tapHandler;

/**
 *  Show the alert on the screen with animation. This method is a throwback to the UIAlertView days and does NOT require a view controller to present the UIAlertController.
 */
- (void)show;

/**
 *  Show the alert on the screen with or without animation. This method is a throwback to the UIAlertView days and DOES NOT require a view controller to present the UIAlertController.
 *
 *  @param animated Pass a BOOL to show alert with or without animation.
 */
- (void)show:(BOOL)animated;

@end

@interface ASJAlertButton : NSObject

/**
 *  The alert button's title.
 */
@property (nullable, copy, nonatomic) NSString *title;

/**
 *  The alert button's style. Can be of styles 'ASJAlertActionStyleDefault' or 'ASJAlertActionStyleDestructive'.
 */
@property (assign, nonatomic) ASJAlertActionStyle style;

/**
 *  Convenience constructor to quickly create instances.
 *
 *  @param title The alert button's title.
 *  @param style The alert button's style. Can be of styles 'ASJAlertActionStyleDefault' or 'ASJAlertActionStyleDestructive'.
 *
 *  @return Returns an instance of ASJAlertButton.
 */
+ (ASJAlertButton *)buttonWithTitle:(nullable NSString *)title style:(ASJAlertActionStyle)style;

@end

NS_ASSUME_NONNULL_END
