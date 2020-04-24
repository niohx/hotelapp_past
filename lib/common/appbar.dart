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

/*class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTap;
  final AppBar appBar;

  const SettingAppBar({Key key, this.onTap,this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:(){},
    child: AppBar(title:Text('伊勢屋')));
  }

  // TODO: implement preferredSize
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}*/