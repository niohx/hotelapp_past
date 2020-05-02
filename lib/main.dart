import 'package:flutter/material.dart';
import 'package:hotelapp/screens/homescreen.dart';
import 'package:hotelapp/screens/secondscreen.dart';
import 'package:hotelapp/screens/agreement.dart';
import 'package:hotelapp/screens/settings.dart';
import 'package:hotelapp/common/themedata.dart';
import 'package:provider/provider.dart';
import 'package:hotelapp/models/appmodel.dart';

void main() => runApp(
    ChangeNotifierProvider<AppModel>(create: (context) => AppModel(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          //お客様用画面のルーティング
          '/': (context) => HomeScreen(),
          '/agreement': (context) => Agreement(),
          '/settings': (context) => SettingPage(),
          '/editsentense': (context) => EditScreen(),
        },
        title: 'Flutter Demo',
        theme: mythemedata);
  }
}
