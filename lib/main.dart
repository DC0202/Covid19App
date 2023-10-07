import 'package:covid19app/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Splashscreen.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    return MaterialApp(
      builder: (BuildContext context, Widget child){
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0,alwaysUse24HourFormat: false),
          child: child,
        );
      },
      theme: ThemeData(
        // primaryColor: Color(0xFF12DBE7),
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}