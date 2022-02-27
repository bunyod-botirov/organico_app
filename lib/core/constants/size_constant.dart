import 'package:flutter/material.dart';

class SizeConst {
  static MediaQueryData? _mediaQueryData;
  static double? _screenWidth;
  static double? _screenHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData!.size.width;
    _screenHeight = _mediaQueryData!.size.height;
  }

  static double height(double inputHeight) {
    return (inputHeight / 896.0) * SizeConst._screenHeight!;
  }

  static double width(double inputWidth) {
    return (inputWidth / 414.0) * SizeConst._screenWidth!;
  }

  static hBox(double size) => SizedBox(height: SizeConst.height(size));

  static wBox(double size) => SizedBox(width: SizeConst.width(size));
}
