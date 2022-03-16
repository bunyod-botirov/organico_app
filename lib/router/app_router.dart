import 'package:flutter/material.dart';
import 'package:organico_app/screens/auth/otp_page.dart';
import 'package:organico_app/screens/auth/reset_password_page.dart';
import 'package:organico_app/screens/auth/sign_up_page.dart';
import 'package:organico_app/screens/bottom_navbar.dart';
import 'package:organico_app/screens/auth/forgot_password_page.dart';
import 'package:organico_app/screens/auth/sign_in_page.dart';
import 'package:organico_app/screens/home/coupons_page.dart';
import 'package:organico_app/screens/home/product_page.dart';
import 'package:organico_app/screens/home/search_page.dart';
import 'package:organico_app/screens/home/types_page.dart';
import 'package:organico_app/screens/profile/edit_profile_page.dart';
import 'package:organico_app/screens/profile/favourites_page.dart';
import 'package:organico_app/screens/splash_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    Object? args = settings.arguments;
    switch (settings.name) {
      case "/splash":
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );
      case "/sign_in":
        return MaterialPageRoute(
          builder: (context) => SignInPage(),
        );
      case "/sign_up":
        return MaterialPageRoute(
          builder: (context) => SignUpPage(),
        );
      case "/otp_page":
        return MaterialPageRoute(
          builder: (context) => OTPPage(datas: args as List),
        );
      case "/forgot_password":
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordPage(),
        );
      case "/reset_password":
        return MaterialPageRoute(
          builder: (context) => ResetPasswordPage(),
        );
      case "/bottom_navbar":
        return MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        );
      case "/product":
        return MaterialPageRoute(
          builder: (context) => ProductPage(data: args as List),
        );
      case "/search":
        return MaterialPageRoute(
          builder: (context) => const SearchPage(),
        );
      case "/coupons":
        return MaterialPageRoute(
          builder: (context) => const CouponsPage(),
        );
      case "/types":
        return MaterialPageRoute(
          builder: (context) => TypesPage(data: args as List),
        );
      case "/edit_profile":
        return MaterialPageRoute(
          builder: (context) => EditProfilePage(),
        );
      case "/favourites":
        return MaterialPageRoute(
          builder: (context) => const FavouritesPage(),
        );
    }
  }
}
