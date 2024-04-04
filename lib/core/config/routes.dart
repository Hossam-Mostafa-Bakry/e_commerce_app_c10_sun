import 'package:e_commerce_app_c10_sun/core/config/page_routes_name.dart';
import 'package:e_commerce_app_c10_sun/presentation/layoutView/layout_view.dart';
import 'package:e_commerce_app_c10_sun/presentation/login/pages/login_view.dart';
import 'package:e_commerce_app_c10_sun/presentation/registration/pages/registration_view.dart';
import 'package:e_commerce_app_c10_sun/presentation/splash/pages/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesNames.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
      case PageRoutesNames.login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
          settings: settings,
        );

      case PageRoutesNames.registration:
        return MaterialPageRoute(
          builder: (context) => const RegistrationView(),
          settings: settings,
        );
      case PageRoutesNames.layout:
        return MaterialPageRoute(
          builder: (context) => LayoutView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}
