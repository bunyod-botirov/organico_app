import 'package:flutter/material.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/provider/sign_provider.dart';
import 'package:provider/provider.dart';

class TextFieldW {
  static SizedBox searchField(
    String label, {
    Widget? prefix,
    Widget? suffix,
    TextEditingController? textController,
    Function? onTap,
    bool enabling = false,
  }) {
    return SizedBox(
      width: SizeConst.width(374),
      height: SizeConst.height(48),
      child: TextFormField(
        readOnly: enabling,
        controller: textController,
        cursorColor: ColorsConst.pGreen,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: SizeConst.width(16),
          ),
          filled: true,
          fillColor: ColorsConst.tWhiteGrey,
          prefixIcon: prefix,
          suffixIcon: suffix,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: label,
          hintStyle: TextStyle(
            color: ColorsConst.tGrey,
            fontSize: FontsConst.regularFont,
            fontWeight: FontWeight.w700,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConst.width(100)),
            ),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConst.width(100)),
            ),
            borderSide: BorderSide.none,
          ),
        ),
        onTap: () => onTap!(),
      ),
    );
  }

  static SizedBox textForm({
    String? label,
    TextEditingController? textController,
    Widget? prefix,
    Widget? suffix,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return SizedBox(
      width: SizeConst.width(374),
      height: SizeConst.height(48),
      child: TextFormField(
        controller: textController,
        cursorColor: ColorsConst.pGreen,
        textAlignVertical: TextAlignVertical.center,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: TextStyle(
          fontSize: FontsConst.regularFont,
          color: ColorsConst.tBlack,
          fontWeight: FontWeight.w700,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: SizeConst.width(16),
          ),
          suffixIcon: suffix,
          prefixIcon: prefix,
          floatingLabelBehavior: FloatingLabelBehavior.never,
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

  static Row textFormModified(
    BuildContext context, {
    TextEditingController? textController,
  }) {
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
              context.watch<SignProvider>().popupValue,
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
              context.read<SignProvider>().changePopupValue(value);
            },
          ),
        ),
        SizedBox(
          width: SizeConst.width(280),
          height: SizeConst.height(48),
          child: TextFormField(
            controller: textController,
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
