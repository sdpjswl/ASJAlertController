//
// ASJAlertController+Show.m
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

#import "ASJAlertController+Show.h"
#import <objc/runtime.h>

@interface UIAlertController (Private)

@property (strong, nonatomic) UIWindow *alertWindow;

@end

@implementation UIAlertController (Private)

@dynamic alertWindow;

- (void)setAlertWindow:(UIWindow *)alertWindow
{
  objc_setAssociatedObject(self, @selector(alertWindow), alertWindow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIWindow *)alertWindow
{
  return objc_getAssociatedObject(self, @selector(alertWindow));
}

@end

@implementation UIAlertController (Show)

- (void)viewDidDisappear:(BOOL)animated
{
  [super viewDidDisappear:animated];
  self.alertWindow.hidden = YES;
  self.alertWindow = nil;
}

#pragma mark - Convenience w/o destroy

+ (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                 cancelButtonTitle:(nullable NSString *)cancelTitle
                        tapHandler:(nullable TapHandler)tapHandler
{
  return [UIAlertController showAlertWithTitle:title message:message cancelButtonTitle:cancelTitle destructiveButtonTitle:nil otherTitles:nil preferredStyle:ASJAlertControllerStyleAlert tapHandler:tapHandler];
}

+ (instancetype)showActionSheetWithTitle:(NSString *)title
                                 message:(NSString *)message
                       cancelButtonTitle:(NSString *)cancelTitle
                  destructiveButtonTitle:(nullable NSString *)destructiveTitle
                             otherTitles:(nullable NSArray <NSString *>*)otherTitles
                              tapHandler:(TapHandler)tapHandler
{
  return [UIAlertController showAlertWithTitle:title message:message cancelButtonTitle:cancelTitle destructiveButtonTitle:destructiveTitle otherTitles:otherTitles preferredStyle:ASJAlertControllerStyleActionSheet tapHandler:tapHandler];
}

+ (instancetype)showAlertWithTitle:(NSString *)title
                           message:(NSString *)message
                 cancelButtonTitle:(NSString *)cancelTitle
                      otherButtons:(NSArray<ASJAlertButton *> *)otherButtons
                    preferredStyle:(ASJAlertControllerStyle)style
                        tapHandler:(nullable TapHandler)tapHandler
{
  UIAlertController *alert = [UIAlertController alertWithTitle:title message:message cancelButtonTitle:cancelTitle otherButtons:otherButtons preferredStyle:style tapHandler:tapHandler];
  [alert show];
  return alert;
}

+ (instancetype)alertWithTitle:(NSString *)title
                       message:(NSString *)message
             cancelButtonTitle:(NSString *)cancelTitle
                  otherButtons:(NSArray<ASJAlertButton *> *)otherButtons
                preferredStyle:(ASJAlertControllerStyle)style
                    tapHandler:(TapHandler)tapHandler
{
  for (id __attribute__((unused)) object in otherButtons)
  {
    NSAssert([object isKindOfClass:[ASJAlertButton class]], @"Other buttons must be of type ASJAlertButton");
  }
  
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyle)style];
  
  if (cancelTitle)
  {
    UIAlertAction *cancel = [UIAlertController cancelActionWithTitle:cancelTitle handler:tapHandler];
    [alert addAction:cancel];
  }
  
  for (ASJAlertButton *otherButton in otherButtons)
  {
    UIAlertAction *other = [UIAlertController otherActionWithAlertButton:otherButton handler:tapHandler];
    [alert addAction:other];
  }
  
  return alert;
}

#pragma mark - Convenience w/ destroy

+ (instancetype)showAlertWithTitle:(NSString *)title
                           message:(NSString *)message
                 cancelButtonTitle:(NSString *)cancelTitle
            destructiveButtonTitle:(NSString *)destructiveTitle
                       otherTitles:(NSArray<NSString *> *)otherTitles
                    preferredStyle:(ASJAlertControllerStyle)style
                        tapHandler:(TapHandler)tapHandler
{
  UIAlertController *alert = [UIAlertController alertWithTitle:title message:message cancelButtonTitle:cancelTitle destructiveButtonTitle:destructiveTitle otherTitles:otherTitles preferredStyle:style tapHandler:tapHandler];
  [alert show];
  return alert;
}

+ (instancetype)alertWithTitle:(NSString *)title
                       message:(NSString *)message
             cancelButtonTitle:(NSString *)cancelTitle
        destructiveButtonTitle:(NSString *)destructiveTitle
                   otherTitles:(NSArray <NSString *>*)otherTitles
                preferredStyle:(ASJAlertControllerStyle)style
                    tapHandler:(TapHandler)tapHandler
{
  for (id __attribute__((unused)) object in otherTitles)
  {
    NSAssert([object isKindOfClass:[NSString class]], @"Other buttons must be of type NSString");
  }
  
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyle)style];
  
  if (cancelTitle)
  {
    UIAlertAction *cancel = [UIAlertController cancelActionWithTitle:cancelTitle handler:tapHandler];
    [alert addAction:cancel];
  }
  
  if (destructiveTitle)
  {
    UIAlertAction *destroy = [UIAlertController destructiveActionWithTitle:destructiveTitle handler:tapHandler];
    [alert addAction:destroy];
  }
  
  for (NSString *otherTitle in otherTitles)
  {
    UIAlertAction *other = [UIAlertController otherActionWithTitle:otherTitle handler:tapHandler];
    [alert addAction:other];
  }
  
  return alert;
}

#pragma mark - Show

- (void)show
{
  [self show:YES];
}

- (void)show:(BOOL)animated
{
  self.alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.alertWindow.rootViewController = [[UIViewController alloc] init];
  self.alertWindow.tintColor = [UIApplication sharedApplication].delegate.window.tintColor;
  
  UIWindow *topWindow = [UIApplication sharedApplication].windows.lastObject;
  self.alertWindow.windowLevel = topWindow.windowLevel + 1;
  
  [self.alertWindow makeKeyAndVisible];
  [self.alertWindow.rootViewController presentViewController:self animated:animated completion:nil];
}

#pragma mark - Action constructors

+ (UIAlertAction *)cancelActionWithTitle:(NSString *)title handler:(TapHandler)handler
{
  return [UIAlertAction actionWithTitle:title style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action)
          {
            if (handler) {
              handler(action, title);
            }
          }];
}

+ (UIAlertAction *)destructiveActionWithTitle:(NSString *)title handler:(TapHandler)handler
{
  return [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action)
          {
            if (handler) {
              handler(action, title);
            }
          }];
}

+ (UIAlertAction *)otherActionWithAlertButton:(ASJAlertButton *)alertButton handler:(TapHandler)handler
{
  return [UIAlertAction actionWithTitle:alertButton.title style:(UIAlertActionStyle)alertButton.style handler:^(UIAlertAction * _Nonnull action)
          {
            if (handler) {
              handler(action, alertButton.title);
            }
          }];
}

+ (UIAlertAction *)otherActionWithTitle:(NSString *)title handler:(TapHandler)handler
{
  return [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
          {
            if (handler) {
              handler(action, title);
            }
          }];
}

@end

#pragma mark - ASJAlertButton

@implementation ASJAlertButton

+ (ASJAlertButton *)buttonWithTitle:(NSString *)title style:(ASJAlertActionStyle)style
{
  ASJAlertButton *button = [[ASJAlertButton alloc] init];
  button.title = title;
  button.style = style;
  return button;
}

@end
