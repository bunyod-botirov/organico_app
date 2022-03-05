import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/padding_margin_const.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/widgets/app_bar.dart';
import 'package:organico_app/widgets/buttons.dart';
import 'package:organico_app/widgets/text_form.dart';

class OTPPage extends StatelessWidget {
  OTPPage({Key? key, required this.verificationId}) : super(key: key);

  final TextEditingController _otpController = TextEditingController();
  final String verificationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarW.appBar(
        context,
        title: "OTAC Number",
      ),
      body: Padding(
        padding: PaddingMarginConst.symmetricHorizontalPM,
        child: Column(
          children: <Widget>[
            SizeConst.hBox(48),
            Text(
              "Enter Authorization Code",
              style: TextStyle(
                fontSize: FontsConst.largeFont,
                color: ColorsConst.tBlack,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizeConst.hBox(16),
            Text(
              "We have sent SMS to:",
              style: TextStyle(
                fontSize: FontsConst.regularFont,
                color: ColorsConst.tGrey,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "+XXXXXXXXX",
              style: TextStyle(
                fontSize: FontsConst.mediumFont,
                color: ColorsConst.tBlack,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizeConst.hBox(40),
            TextFieldW.textForm(
              "6 Digit Code",
              textController: _otpController,
              keyboardType: TextInputType.number,
            ),
            SizeConst.hBox(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  child: Text(
                    "Resend Code",
                    style: TextStyle(
                      fontSize: FontsConst.regularFont,
                      color: ColorsConst.pGreen,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
            SizeConst.hBox(40),
            ButtonsW.buttonGreen(
              374,
              52,
              "Next",
              () async {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: verificationId,
                  smsCode: _otpController.text,
                );

                await FirebaseAuth.instance.signInWithCredential(credential);

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/bottom_navbar",
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
