/// This is the main.dart of the BMI Calculator app!!

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'input_page.dart';

void main() {
  runApp(MyApp());
}

/// The root widget of the BMI Calculator app.
///
/// It sets the app's title, theme, and the initial home page using GetX.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ProductSans',
      ),
      home: InputPage(),
    );
  }
}
