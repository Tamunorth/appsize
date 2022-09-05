part of appsize;

/// {@template app_size_util}
/// The util class with all the stuff that we use to get the size of the app.
/// {@endtemplate}
class AppSizeUtil {
  /// Device's BoxConstraints.
  static late Size size;

  /// Device's Orientation.
  static late Orientation orientation;

  /// Type of Device.
  ///
  /// This can either be mobile or tablet.
  static late DeviceType deviceType;

  /// Responsive Height.
  static late double height;

  /// Device's Height.
  static late double deviceHeight;

  /// Responsive Width.
  static late double width;

  /// Device's Width.
  static late double deviceWidth;

  /// The amount of required to multiply the size to get a pixel.
  static double? pixelRatio;

  /// Sets the Screen's size and Device's Orientation,
  /// BoxConstraints, Height, and Width.
  static void setScreenSize(
    Size appSize,
    Orientation currentOrientation,
    double? canvasWidth,
  ) {
    pixelRatio ??= 1 / (canvasWidth ?? 375);

    // Sets boxconstraints and orientation.
    size = appSize;
    orientation = currentOrientation;

    // Sets device's height and width.
    if (orientation == Orientation.portrait) {
      deviceWidth = size.width;
      deviceHeight = size.height;
    } else {
      deviceWidth = size.height;
      deviceHeight = size.width;
    }

    // Because we take the width and height from the MediaQuery we don't need to
    // check the orientation.
    width = size.width;
    height = size.height;

    // Sets ScreenType.
    if (kIsWeb) {
      deviceType = DeviceType.web;
    } else if (Platform.isAndroid || Platform.isIOS) {
      if ((orientation == Orientation.portrait && width < 600) ||
          (orientation == Orientation.landscape && height < 600)) {
        deviceType = DeviceType.mobile;
      } else {
        deviceType = DeviceType.tablet;
      }
    } else if (Platform.isMacOS) {
      deviceType = DeviceType.mac;
    } else if (Platform.isWindows) {
      deviceType = DeviceType.windows;
    } else if (Platform.isLinux) {
      deviceType = DeviceType.linux;
    } else {
      deviceType = DeviceType.fuchsia;
    }
  }

  /// For responsive web.
  static dynamic getWebResponsiveSize({
    dynamic smallSize,
    dynamic mediumSize,
    dynamic largeSize,
  }) {
    if (width < 600) {
      return smallSize; //'phone'.
    } else if (width >= 600 && width <= 1024) {
      return mediumSize; //'tablet'.
    }
    return largeSize; //'desktop'.
  }
}

/// Type of Device.
///
/// This can be either mobile or tablet.
enum DeviceType {
  /// Mobile Device.
  mobile,

  /// Tablet Device.
  tablet,

  /// Web Device.
  web,

  /// Mac OS Device.
  mac,

  /// Windows OS Device.
  windows,

  /// Linux OS Device.
  linux,

  /// Fuchsia distro Device.
  fuchsia,
}
