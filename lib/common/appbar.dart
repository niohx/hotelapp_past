import 'package:flutter/material.dart';
final generalappbar = AppBar(title:Text('ようこそ伊勢屋へ！'));

final settingappbar = AppBar(
  title: Text('Settings'),
);

final settingdrawer = Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      ListTile(title: Text('header setting'),),
      ListTile(title: Text('alarm setting'),),
      ListTile(title: Text('youtube setting'),),
      ListTile(title: Text('recomendation setting'),),
      ListTile(title: Text('Agreement setting'),),
      
    ],
  ),
);

class SettingDrawer extends StatelessWidget{
  Widget build(BuildContext context){
    Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      ListTile(title: Text('header setting'),),
      ListTile(title: Text('alarm setting'),),
      ListTile(title: Text('youtube setting'),),
      ListTile(title: Text('recomendation setting'),),
      ListTile(title: Text('Agreement setting'),),
      
    ],
  ),
);
  }
}