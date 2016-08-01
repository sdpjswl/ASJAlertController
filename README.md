# ASJAlertController

`UIAlertController` is a major improvement over the good old `UIAlertView`. It doesn't however have a simple `show` method to make it appear on the screen and must be presented on a view controller. Like me, if you miss the old way of showing alerts, this little library will be of help.

This is a category on `UIAlertController` that adds the `show` method and a few convenience methods to create alerts and action sheets.

# Installation

CocoaPods is the preferred way to install this library. Add this command to your `Podfile`:

```ruby
pod 'ASJAlertController'
```

# Usage

```objc
[UIAlertController showAlertWithTitle:@"Title"
                                message:@"Message"
                      cancelButtonTitle:@"Cancel"
                             tapHandler:^(ASJAlertAction * _Nullable action, NSString * _Nullable buttonTitle)
                             {
                               // handle button taps here
                             }];
```

```objc
ASJAlertButton *button1 = [ASJAlertButton buttonWithTitle:@"Button 1" style:ASJAlertActionStyleDestructive];
ASJAlertButton *button2 = [ASJAlertButton buttonWithTitle:@"Button 2" style:ASJAlertActionStyleDefault];
  
[ASJAlertController showAlertWithTitle:@"Title"
                                 message:@"Message"
                       cancelButtonTitle:@"Cancel"
                            otherButtons:@[button1, button2, ...]
                          preferredStyle:ASJAlertControllerStyleActionSheet
                              tapHandler:^(ASJAlertAction * _Nullable action, NSString * _Nullable buttonTitle)
                             {
                                // handle button taps here...
                            }];
```

For `otherButtons`, you need to pass an `NSArray` of kind `ASJAlertButton`s or `NSString`s, depending on the method you use. You may keep `nil` any arguments you don't require.

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

To create an alert object and manually show it on the screen.

# Credits

- To [Shashank Pali](https://github.com/shashankpali) for the motivation
- [How to present UIAlertController when not in a view controller?](http://stackoverflow.com/questions/26554894/how-to-present-uialertcontroller-when-not-in-a-view-controller)
- [How can I get rid of an “unused variable” warning in Xcode?](http://stackoverflow.com/questions/5451123/how-can-i-get-rid-of-an-unused-variable-warning-in-xcode)

# License

`ASJAlertController` is available under the MIT license. See the LICENSE file for more info.
