import 'package:flutter/material.dart';
import 'homepage.dart';
import 'firstScreen.dart';
import 'register.dart';
import 'login.dart';
import 'settings.dart';
import 'spinnerloader.dart';  
import 'package:flare_splash_screen/flare_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen('assets/splashscreen/splash.flr',FirstScreen() ,startAnimation: 'Untitled',backgroundColor: Color(0xfff5f5f5)),
      debugShowCheckedModeBanner: false, 
      initialRoute: '/',
      routes: {
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/homescreen': (context) => Homepage(),
        '/settingscreen' : (context) => Settings(),
        '/loaderspinnerscreen' : (context) => SpinnerWidget()
      },
    );
  }
}
