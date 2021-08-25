import 'package:flutter/material.dart';
import 'package:hippo_v2/locator.dart';
import 'package:hippo_v2/view/page/landing_page.dart';
import 'package:hippo_v2/view/page/splash_page.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => SplashPage(
          onComplete: () => Navigator.popAndPushNamed(context, "/landing"),
        ),
        "/landing": (context) => Landing(),
      },
    );
  }
}
