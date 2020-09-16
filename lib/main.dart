import 'package:flutter/material.dart';

import 'package:flutter_app_w_images/welcomePage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Login/Register Demo Design',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}