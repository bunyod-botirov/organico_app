import 'package:flutter/material.dart';
import 'package:organico_app/core/constants/colors_constant.dart';

class ThemeComp {
  static ThemeData themeData = ThemeData(
    fontFamily: 'Nunito',
    scaffoldBackgroundColor: ColorsConst.tWhite,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsConst.tWhite,
      iconTheme: IconThemeData(color: ColorsConst.tBlack),
      actionsIconTheme: IconThemeData(color: ColorsConst.tBlack),
    ),
  );
}
