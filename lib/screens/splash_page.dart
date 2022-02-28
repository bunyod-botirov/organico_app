import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico_app/core/constants/size_constant.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConst().init(context);
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, "/bottom_navbar"),
    );
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          "assets/images/logo.svg",
          fit: BoxFit.cover,
          width: SizeConst.width(143),
          height: SizeConst.height(203),
        ),
      ),
    );
  }
}
