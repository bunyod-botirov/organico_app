import 'package:flutter/material.dart';
import 'package:organico_app/screens/bottom_navbar.dart';
import 'package:organico_app/screens/forgot_password_page.dart';
import 'package:organico_app/screens/sign_in_page.dart';
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
      case "/forgot_password":
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordPage(),
        );
      case "/bottom_navbar":
        return MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        );
    }
  }
}
