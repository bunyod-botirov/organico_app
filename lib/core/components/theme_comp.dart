import 'package:flutter/material.dart';
import 'package:organico_app/core/constants/colors_constant.dart';

class ThemeComp {
  static ThemeData themeData = ThemeData(
    fontFamily: 'Nunito',
    scaffoldBackgroundColor: ColorsConst.tWhite,
    primarySwatch: const MaterialColor(
      0xFF2ECC71,
      {
        50: Color.fromRGBO(46, 204, 113, .1),
        100: Color.fromRGBO(46, 204, 113, .2),
        200: Color.fromRGBO(46, 204, 113, .3),
        300: Color.fromRGBO(46, 204, 113, .4),
        400: Color.fromRGBO(46, 204, 113, .5),
        500: Color.fromRGBO(46, 204, 113, .6),
        600: Color.fromRGBO(46, 204, 113, .7),
        700: Color.fromRGBO(46, 204, 113, .8),
        800: Color.fromRGBO(46, 204, 113, .9),
        900: Color.fromRGBO(46, 204, 113, 1),
      },
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsConst.tWhite,
      iconTheme: IconThemeData(color: ColorsConst.tBlack),
      actionsIconTheme: IconThemeData(color: ColorsConst.tBlack),
    ),
  );
}
