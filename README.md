# ASJAlertController

`UIAlertController` is a major improvement over the good old `UIAlertView`. It doesn't however have a simple `show` method to make it appear on the screen and must be presented on a view controller. Like me, if you miss the old way of showing alerts, this little library will be of help.

This is a category on `UIAlertController` that adds the `show` method and a few convenience methods to create alerts and action sheets.

It works by creating a new `UIWindow` over the app's key window and presenting a `UIAlertController` on it. This is the method Apple supposedly [uses in their own implementation](http://stackoverflow.com/a/30941356).

# Installation

CocoaPods is the preferred way to install this library. Add this command to your `Podfile`:

```ruby
pod 'ASJAlertController'
```

# Usage

#### Show alert

```objc
[ASJAlertController showAlertWithTitle:@"Title"
                                 message:@"Message"
                       cancelButtonTitle:@"Cancel"
                              tapHandler:^(ASJAlertAction * _Nullable action, NSString * _Nullable buttonTitle)
   {
     // handle button taps here
   }];
```

#### Show action sheet

```objc
[ASJAlertController showActionSheetWithTitle:@"Title"
                                       message:@"Message"
                             cancelButtonTitle:@"Cancel"
                        destructiveButtonTitle:@"Destroy"
                                   otherTitles:@[@"Button 1", @"Button 2"]
                                    tapHandler:^(ASJAlertAction * _Nullable action, NSString * _Nullable buttonTitle)
   {
     // handle button taps here
   }];
```

#### Show alert/action sheet using `ASJAlertButton`s

```objc
ASJAlertButton *button1 = [ASJAlertButton buttonWithTitle:@"Button 1" style:ASJAlertActionStyleDestructive];
ASJAlertButton *button2 = [ASJAlertButton buttonWithTitle:@"Button 2" style:ASJAlertActionStyleDefault];

[ASJAlertController showAlertWithTitle:@"Test"
                                 message:@"A test action sheet"
                       cancelButtonTitle:@"Cancel"
                            otherButtons:@[button1, button2]
                          preferredStyle:ASJAlertControllerStyleActionSheet
                              tapHandler:^(ASJAlertAction * _Nullable action, NSString * _Nullable buttonTitle)
   {
     // handle button taps here
   }];
```

#### Show manually

You also have the option to not show the alert immediately. Use the `show` methods to do this. For `otherButtons`, you need to pass an `NSArray` of kind `ASJAlertButton`s or `NSString`s, depending on the method you use. You may keep `nil` any arguments you don't require.

```objc
ASJAlertController *alert = [ASJAlertController alertWithTitle:@"Title"
                                                      message:@"Message"
                                            cancelButtonTitle:@"Cancel"
                                       destructiveButtonTitle:nil
                                                  otherTitles:nil
                                              preferredStyle:ASJAlertControllerStyleAlert
                                                  tapHandler:^(ASJAlertAction * _Nullable action, NSString * _Nullable buttonTitle)
                               {
                                 // handle button taps here...
                               }];
[alert show];
```

# Credits

- To [Shashank Pali](https://github.com/shashankpali) for the motivation
- [How to present UIAlertController when not in a view controller?](http://stackoverflow.com/a/30941356)
- [How can I get rid of an “unused variable” warning in Xcode?](http://stackoverflow.com/a/5451181)

# License

`ASJAlertController` is available under the MIT license. See the LICENSE file for more info.
