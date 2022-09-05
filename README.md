# AppSize

This is a Fork of the [sizer package](https://github.com/TechnoUrmish/sizer).

A Flutter package for Easily make Flutter apps responsive. Automatically adapt UI to different screen sizes. Responsiveness made simple.

![Alt Text](https://raw.githubusercontent.com/TechnoUrmish/sizer/master/example/images/img_ss_with_lib.png)

![Alt Text](https://raw.githubusercontent.com/TechnoUrmish/sizer/master/example/images/img_ss_without_lib.png)

# Content

- [Installation](#installation)
- [Parameters](#parameters)
- [Usage](#usage)
- [Suggestions](#suggestions)
- [Note](#note)


# Installation ⬇️
Add to pubspec.yaml.
```dart
dependencies:
  ...
  appsize: ^1.1.0+2
```

# Parameters

* `canvasWidth` - The width of the figma canvas you're using, making `.sp` work as intended.
* `.h` - Returns a calculated height based on the app size.
* `.w` - Returns a calculated width based on the app size.
* `.dh` - Returns a calculated height based on the device.
* `.dw` - Returns a calculated width based on the device.
* `.sp` - Returns a calculated "Sizeable Pixel" width based on the canvas width.
* `AppSizeUtil.orientation` - for screen orientation portrait or landscape.
* `AppSizeUtil.deviceType` - for device type mobile or tablet.

# Usage

## Add the following imports to your Dart code:
```dart
import 'package:appsize/appsize.dart';
```

## Wrap MaterialApp with ResponsiveAppSize widget
```dart
MaterialApp(
  builder: (context, child) => AppSize(
    builder: (context, orientation, deviceType) => child!,
  ),
),
```
## Optional child builder
```dart
MaterialApp(
  builder: (context, child) => AppSize.child(
    child: child!,
  ),
);
```

## Height in Phones 📏
Because most phones vary in height and not in width, using the device height will make the UI change in size between devices. We recommend using it when adding spaces between widgets in a `Column()`.
```dart
SizedBox(
  height: 10.dh,
)
```

## Orientation 🔄

If you want to support both portrait and landscape orientations, use `.h` and `.w`, their sizes update when rotated, width becomes height and height becomes width. Extensions .dh and .dw don't share this behavior, they remain the same.

### Size changes when rotating the phone:
```dart
Container(
  width: 20.w,    //It will take a 20% of app width
  height: 30.h,   //It will take a 30% of app height
)
```

### Size will not change when rotating the phone:
```dart
Container(
  width: 20.dw,    //It will take a 20% of screen width
  height: 30.dh,   //It will take a 30% of screen height
)
```

We recommend to use .sp and .dw, even for heights when you want to make the app look the same in all phones.
```dart
Padding(
  padding: EdgeInsets.symmetric(
    vertical: 10.dw,
    horizontal: 5.dw,
  ),
  child: Text(
    'AppSize',
    style: TextStyle(
      fontSize: 15.sp,
    ),
  ),
);
```

## DeviceType 📱

If you want the same layout to look different in tablet and mobile, use the ``AppSizeUtil.deviceType`` method:

```dart
AppSizeUtil.deviceType == DeviceType.mobile
  ? Container(   // Widget for Mobile
      width: 100.w,
      height: 20.5.h,
   )
  : Container(   // Widget for Tablet
      width: 100.w,
      height: 12.5.h,
   )
```

# Suggestions

**Canvas Width**

To make the `num.sp` extension work correctly you need to specify the width of the canvas you're using. In the case that the width of it changes in some parts of the app, you just need to use another AppSize with a new `canvasWidth`, it'll update all the `num.sp` down the tree to make use of the new width.

**DeviceType**

If you want to give support for both mobile and tablet then make separate widget for both like deviceType example.

# Note

You need to import `appsize` package in order to access `num.h`, `num.w`, `num.dh`, `num.dw` and `num.sp`.
## Issues and feedback 💭

If you have any suggestion for including a feature or if something doesn't work, feel free to open a Github [issue](https://github.com/NazarenoCavazzon/AppSize/issues) for us to have a discussion on it.