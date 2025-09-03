import 'package:flutter/material.dart';

/// A helper class for responsive UI scaling
/// Use it after initializing in your `main.dart`
///
/// Example:
///   ScreenUtilHelper.init(context);
///   20.w   // width
///   15.h   // height
///   16.sp  // font size
///   10.r   // radius
///
class ScreenUtilHelper {
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _scaleWidth;
  static late double _scaleHeight;
  static late double _textScaleFactor;

  /// Base sizes (design reference) – adjust according to your Figma/XD design
  static const double baseWidth = 390; // e.g. iPhone 12 width
  static const double baseHeight = 844; // e.g. iPhone 12 height

  /// Initialize with context
  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;
    _scaleWidth = _screenWidth / baseWidth;
    _scaleHeight = _screenHeight / baseHeight;
    _textScaleFactor = MediaQuery.of(context).textScaleFactor;
  }

  /// Scale width
  static double setWidth(double width) => width * _scaleWidth;

  /// Scale height
  static double setHeight(double height) => height * _scaleHeight;

  /// Scale text
  static double setSp(double fontSize) =>
      fontSize * _scaleWidth * (_textScaleFactor > 1 ? 1 : _textScaleFactor);

  /// Scale radius (uses the smaller scale factor for consistency)
  static double setRadius(double radius) =>
      radius * (_scaleWidth < _scaleHeight ? _scaleWidth : _scaleHeight);

  /// Padding
  static EdgeInsets setPadding({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: setWidth(left),
      top: setHeight(top),
      right: setWidth(right),
      bottom: setHeight(bottom),
    );
  }

  /// Margin
  static EdgeInsets setMargin({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return setPadding(left: left, top: top, right: right, bottom: bottom);
  }
}

/// Extension methods so you can use `.w`, `.h`, `.sp`, `.r` on numbers
extension ScreenUtilExtensions on num {
  double get w => ScreenUtilHelper.setWidth(toDouble());
  double get h => ScreenUtilHelper.setHeight(toDouble());
  double get sp => ScreenUtilHelper.setSp(toDouble());
  double get r => ScreenUtilHelper.setRadius(toDouble());
}
