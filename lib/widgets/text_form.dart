import 'package:flutter/material.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/provider/sign_in_provider.dart';
import 'package:provider/provider.dart';

class TextFieldW {
  static SizedBox textForm(String label, {Widget? prefix, Widget? suffix}) {
    return SizedBox(
      width: SizeConst.width(374),
      height: SizeConst.height(48),
      child: TextFormField(
        cursorColor: ColorsConst.pGreen,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: prefix,
          suffixIcon: suffix,
          labelText: label,
          labelStyle: TextStyle(
            color: ColorsConst.tGrey,
            fontSize: FontsConst.regularFont,
            fontWeight: FontWeight.w700,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConst.width(100)),
            ),
            borderSide: BorderSide(
              color: ColorsConst.tLineDark,
              width: SizeConst.width(1.5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConst.width(100)),
            ),
            borderSide: BorderSide(
              color: ColorsConst.tLineDark,
              width: SizeConst.width(1.5),
            ),
          ),
        ),
      ),
    );
  }

  static Row textFormModified(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: SizeConst.width(94),
          height: SizeConst.height(48),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SizeConst.width(100)),
              bottomLeft: Radius.circular(SizeConst.width(100)),
            ),
            border: Border.all(
              color: ColorsConst.tLineDark,
              width: SizeConst.width(1.5),
            ),
          ),
          child: PopupMenuButton(
            elevation: 0,
            color: ColorsConst.pGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeConst.width(30)),
            ),
            child: Text(
              context.watch<SignInProvider>().popupValue,
              style: TextStyle(
                color: ColorsConst.tBlack,
                fontSize: FontsConst.regularFont,
                fontWeight: FontWeight.w700,
              ),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "+1",
                child: Text(
                  "+1",
                  style: TextStyle(
                    color: ColorsConst.tWhite,
                    fontSize: FontsConst.regularFont,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              PopupMenuItem(
                value: "+998",
                child: Text(
                  "+998",
                  style: TextStyle(
                    color: ColorsConst.tWhite,
                    fontSize: FontsConst.regularFont,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
            onSelected: (value) {
              context.read<SignInProvider>().changePopupValue(value);
            },
          ),
        ),
        SizedBox(
          width: SizeConst.width(280),
          height: SizeConst.height(48),
          child: TextFormField(
            cursorColor: ColorsConst.pGreen,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              labelText: "Your Phone Number",
              labelStyle: TextStyle(
                color: ColorsConst.tGrey,
                fontSize: FontsConst.regularFont,
                fontWeight: FontWeight.w700,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(SizeConst.width(100)),
                  bottomRight: Radius.circular(SizeConst.width(100)),
                ),
                borderSide: BorderSide(
                  color: ColorsConst.tLineDark,
                  width: SizeConst.width(1.5),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(SizeConst.width(100)),
                  bottomRight: Radius.circular(SizeConst.width(100)),
                ),
                borderSide: BorderSide(
                  color: ColorsConst.tLineDark,
                  width: SizeConst.width(1.5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
