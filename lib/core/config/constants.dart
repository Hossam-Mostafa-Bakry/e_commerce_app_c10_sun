import 'package:flutter/material.dart';

import '../../main.dart';

class Constants {

  static const String baseURL = "https://route-ecommerce.onrender.com";
  static var theme = Theme.of(navigatorKey.currentState!.context);
  static var mediaQuery =
      MediaQuery.of(navigatorKey.currentState!.context).size;
}
