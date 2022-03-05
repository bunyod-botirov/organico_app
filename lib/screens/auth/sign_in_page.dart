import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/colors_constant.dart';
import 'package:organico_app/core/constants/fonts_constant.dart';
import 'package:organico_app/core/constants/padding_margin_const.dart';
import 'package:organico_app/core/constants/size_constant.dart';
import 'package:organico_app/provider/sign_provider.dart';
import 'package:organico_app/widgets/buttons.dart';
import 'package:organico_app/widgets/text_form.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: PaddingMarginConst.symmetricHorizontalPM,
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              child: ChangeNotifierProvider(
                create: (context) => SignProvider(),
                builder: (BuildContext context, Widget? child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/images/welcome_illustration.svg",
                        fit: BoxFit.cover,
                        width: SizeConst.width(349),
                        height: SizeConst.height(318.11),
                      ),
                      SizeConst.hBox(65.89),
                      Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: FontsConst.largeFont,
                          color: ColorsConst.tBlack,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizeConst.hBox(16),
                      Text(
                        "Welcome to Organico Mobile Apps. Please fill in the field below to sign in.",
                        style: TextStyle(
                          fontSize: FontsConst.regularFont,
                          color: ColorsConst.tGrey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizeConst.hBox(32),
                      TextFieldW.textFormModified(context),
                      SizeConst.hBox(20),
                      TextFieldW.textForm(
                        "Password",
                        prefix: SvgPicture.asset(
                          "assets/icons/lock.svg",
                          fit: BoxFit.none,
                        ),
                        suffix: InkWell(
                          child: SvgPicture.asset(
                            "assets/icons/eye.svg",
                            fit: BoxFit.none,
                          ),
                          onTap: () =>
                              context.read<SignProvider>().changeObsecureText(),
                        ),
                        obscureText: context.watch<SignProvider>().obsecureText,
                      ),
                      SizeConst.hBox(24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          InkWell(
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                fontSize: FontsConst.regularFont,
                                color: ColorsConst.pGreen,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, "/forgot_password");
                            },
                          ),
                        ],
                      ),
                      SizeConst.hBox(44),
                      ButtonsW.buttonGreen(374, 52, "Sign In", () {}),
                      SizeConst.hBox(16),
                      ButtonsW.buttonGreen(
                        374,
                        52,
                        "Sign Up",
                        () => Navigator.pushNamed(context, "/sign_up"),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
