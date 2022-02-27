import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/padding_margin_const.dart';
import 'package:organico_app/widgets/app_bar.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarW.appBar(
        leading: SvgPicture.asset(
          "assets/icons/arrow_back.svg",
          fit: BoxFit.none,
        ),
        title: "Forgot Password",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingMarginConst.symmetricHorizontalPM,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[],
            ),
          ),
        ),
      ),
    );
  }
}
