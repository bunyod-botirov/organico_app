import 'package:flutter/material.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/size_constant.dart';

class ButtonsW {
  static SizedBox buttonGreen(double width, double height, String child) {
    return SizedBox(
      width: SizeConst.width(width),
      height: SizeConst.height(height),
      child: ElevatedButton(
        child: Text(
          child,
          style: TextStyle(
            fontSize: FontsConst.regularFont,
            color: ColorsConst.tWhite,
            fontWeight: FontWeight.w700,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: ColorsConst.pGreen,
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeConst.width(100)),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
