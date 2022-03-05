import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';

class AppBarW {
  static AppBar appBar(
    BuildContext context, {
    String? title,
    List<Widget>? actions,
  }) {
    return AppBar(
      elevation: 0,
      leading: InkWell(
        child: SvgPicture.asset(
          "assets/icons/arrow_back.svg",
          fit: BoxFit.none,
        ),
        onTap: () => Navigator.pop(context),
      ),
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
