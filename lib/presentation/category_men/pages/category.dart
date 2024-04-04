import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  static const String routeName = "category";

  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Text('Category_men'),
    ));
  }
}
