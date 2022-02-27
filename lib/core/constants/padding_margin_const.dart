import 'package:flutter/material.dart';
import 'package:organico_app/core/constants/size_constant.dart';

class PaddingMarginConst {
  static EdgeInsets symmetricHorizontalPM = EdgeInsets.symmetric(
    horizontal: SizeConst.width(20),
  );

  static EdgeInsets kExtraSmallPM = const EdgeInsets.all(6);
  static EdgeInsets kSmallPM = const EdgeInsets.all(12);
  static EdgeInsets kMediumPM = const EdgeInsets.all(16);
  static EdgeInsets kLargePM = const EdgeInsets.all(18);
  static EdgeInsets kExtraLargePM = const EdgeInsets.all(22);
}
