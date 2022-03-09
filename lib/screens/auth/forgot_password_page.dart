import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/padding_margin_const.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/provider/sign_provider.dart';
import 'package:organico_app/widgets/app_bar_widget.dart';
import 'package:organico_app/widgets/buttons_widget.dart';
import 'package:organico_app/widgets/text_form_widget.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarW.appBar(
        context,
        title: "Forgot Password",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingMarginConst.symmetricHorizontalPM,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.884,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/images/forgot_illustration.svg",
                  fit: BoxFit.cover,
                  width: SizeConst.width(349),
                  height: SizeConst.height(345.75),
                ),
                SizeConst.hBox(70.25),
                Text(
                  "Enter your phone number",
                  style: TextStyle(
                    fontSize: FontsConst.largeFont,
                    color: ColorsConst.tBlack,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizeConst.hBox(16),
                Text(
                  "We need to verify you. We will send you a one-time authorization code. ",
                  style: TextStyle(
                    fontSize: FontsConst.regularFont,
                    color: ColorsConst.tGrey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizeConst.hBox(32),
                ChangeNotifierProvider(
                  create: (context) => SignProvider(),
                  builder: (BuildContext context, Widget? child) {
                    return TextFieldW.textFormModified(context);
                  },
                ),
                SizeConst.hBox(79),
                ButtonsW.buttonGreen(374, 52, "Next", () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
