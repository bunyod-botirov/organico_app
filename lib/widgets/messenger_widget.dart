import 'package:flutter/material.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';

class MessengerW {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> messenger(
      BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: MediaQuery.of(context).size.width * 0.9,
        backgroundColor: ColorsConst.pGreen,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: FontsConst.regularFont,
            color: ColorsConst.tWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
