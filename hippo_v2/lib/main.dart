import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hippo_v2/locator.dart';
import 'package:hippo_v2/view/page/landing_page.dart';
import 'package:hippo_v2/view/page/main_page.dart';
import 'package:hippo_v2/view/page/splash_page.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  // to disable landscape mode.
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);


  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hippo2.0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => SplashPage(
          onComplete: () => Navigator.popAndPushNamed(context, "/main"),
        ),
        "/landing": (context) => Landing(),
        "/main": (context) => MainPage(),
      },
    );
  }
}
