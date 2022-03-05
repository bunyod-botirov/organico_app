import 'package:flutter/material.dart';
import 'package:organico_app/screens/auth/otp_page.dart';
import 'package:organico_app/screens/auth/sign_up_page.dart';
import 'package:organico_app/screens/bottom_navbar.dart';
import 'package:organico_app/screens/auth/forgot_password_page.dart';
import 'package:organico_app/screens/auth/sign_in_page.dart';
import 'package:organico_app/screens/splash_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/splash":
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );
      case "/sign_in":
        return MaterialPageRoute(
          builder: (context) => const SignInPage(),
        );
      case "/sign_up":
        return MaterialPageRoute(
          builder: (context) =>  SignUpPage(),
        );
      case "/forgot_password":
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordPage(),
        );
      case "/otp_page":
        return MaterialPageRoute(
          builder: (context) => OTPPage(verificationId: args.toString()),
        );
      case "/bottom_navbar":
        return MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        );
    }
  }
}
