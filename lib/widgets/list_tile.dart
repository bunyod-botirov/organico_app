import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';

class ListTileW {
  static ListTile listTile({String? leading, String? title, Function? onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: SvgPicture.asset(
        leading!,
        fit: BoxFit.none,
      ),
      title: Text(
        title!,
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: FontsConst.regularFont,
          color: ColorsConst.tBlack,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: SvgPicture.asset(
        "assets/icons/arrow_forward.svg",
        fit: BoxFit.none,
      ),
      onTap: () {
        onTap!();
      },
    );
  }
}
