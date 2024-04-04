import 'package:bot_toast/bot_toast.dart';
import 'package:e_commerce_app_c10_sun/core/config/application_theme_manager.dart';
import 'package:e_commerce_app_c10_sun/core/config/page_routes_name.dart';
import 'package:e_commerce_app_c10_sun/core/config/routes.dart';
import 'package:e_commerce_app_c10_sun/core/services/loading_service.dart';
import 'package:e_commerce_app_c10_sun/core/services/web_serivces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E_commerce App',
      theme: ApplicationThemeManger.themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: PageRoutesNames.initial,
      onGenerateRoute: Routes.onGenerate,
      navigatorKey: navigatorKey,
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
    );
  }
}
