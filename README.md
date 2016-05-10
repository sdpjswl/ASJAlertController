# ASJAlertController

`UIAlertController` is a major improvement over the good old alert view. It doesn't however have a simple "show" method to make it appear on the screen and must be presented on a view controller. Like me, if you miss the old way of showing alerts, this little library will be of help.

This is a category on `UIAlertController` that adds the `show` method and a few convenience methods to create alerts.

# Installation

CocoaPods is the preferred way to install this library. Add this command to your `Podfile`:

```
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

###Thanks
- To this [Stack Overflow answer](http://stackoverflow.com/questions/26554894/how-to-present-uialertcontroller-when-not-in-a-view-controller) that started this
- To [Shashank Pali](https://github.com/shashankpali) for the motivation

# License

ASJAlertController is available under the MIT license. See the LICENSE file for more info.
