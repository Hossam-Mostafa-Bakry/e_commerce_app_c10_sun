import 'package:e_commerce_app_c10_sun/core/config/page_routes_name.dart';
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

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}
