import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/padding_margin_const.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/widgets/app_bar_widget.dart';
import 'package:organico_app/widgets/buttons_widget.dart';
import 'package:organico_app/widgets/messenger_widget.dart';
import 'package:organico_app/widgets/text_form_widget.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({Key? key}) : super(key: key);

  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarW.appBar(
        context,
        title: "Reset Password",
      ),
      body: Padding(
        padding: PaddingMarginConst.symmetricHorizontalPM,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizeConst.hBox(40),
            Text(
              "Please fill in the field below to reset your current password.",
              style: TextStyle(
                color: ColorsConst.tGrey,
                fontSize: FontsConst.regularFont,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizeConst.hBox(48),
            Text(
              "New Password",
              style: TextStyle(
                color: ColorsConst.tDarkGrey,
                fontSize: FontsConst.regularFont,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizeConst.hBox(10),
            TextFieldW.textForm(
              textController: _password,
              label: "New Password",
              obscureText: true,
              suffix: SvgPicture.asset(
                "assets/icons/eye.svg",
                fit: BoxFit.none,
              ),
            ),
            SizeConst.hBox(16),
            Text(
              "New Password Confirmation",
              style: TextStyle(
                color: ColorsConst.tDarkGrey,
                fontSize: FontsConst.regularFont,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizeConst.hBox(10),
            TextFieldW.textForm(
              textController: _passwordConf,
              label: "New Password Confirmation",
              obscureText: true,
              suffix: SvgPicture.asset(
                "assets/icons/eye.svg",
                fit: BoxFit.none,
              ),
            ),
            SizeConst.hBox(48),
            ButtonsW.buttonGreen(
              374,
              52,
              "Reset password",
              () {
                if (_password.text == _passwordConf.text &&
                    _password.text.isNotEmpty) {
                  FirebaseFirestore.instance
                      .collection("users")
                      .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
                      .update(
                    {
                      "password": _password.text,
                    },
                  );
                  MessengerW.messenger(context, "Changed!");
                } else {
                  MessengerW.messenger(context, "Passwords does not matching!");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
