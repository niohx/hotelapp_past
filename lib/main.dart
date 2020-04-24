import 'package:flutter/material.dart';
import 'package:hotelapp/screens/homescreen.dart';
import 'package:hotelapp/screens/secondscreen.dart';
import 'package:hotelapp/screens/agreement.dart';
import 'package:hotelapp/screens/settings.dart';
import 'package:hotelapp/common/themedata.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          //お客様用画面のルーティング
          '/': (context) => HomeScreen(),
          '/second': (context) => SecondScreen(),
          '/agreement': (context) => Agreement(),
          '/settings': (context) => SettingPage(),
        },
        title: 'Flutter Demo',
        theme: mythemedata);
  }
}
