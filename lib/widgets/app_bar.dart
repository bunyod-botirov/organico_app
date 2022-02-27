import 'package:flutter/material.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';

class AppBarW {
  static AppBar appBar(
      {Widget? leading, String? title, List<Widget>? actions}) {
    return AppBar(
      elevation: 0,
      leading: leading,
      title: Text(
        title.toString(),
        style: TextStyle(
          fontSize: FontsConst.mediumFont,
          color: ColorsConst.tBlack,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: actions,
    );
  }
}
