import 'package:flutter/material.dart';
import 'package:hotelapp/common/appbar.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingappbar,
//      drawer: settingdrawer,
      body: ListView(
        children: <Widget>[
          SettingCard(
            text: Text('header settings'),
            subtitle: Text('最初の文章の設定'),
          ),
          SettingCard(
            text: Text('visibility settings'),
            subtitle: Text('各要素の表示・非表示'),
          ),
          SettingCard(
            text:Text('setting color'),
            subtitle: Text('全体の色の設定'),
          ),
          SettingCard(
            text:Text('menu settings')
          ),
          SettingCard(
            text:Text('Agreement Settings'),
            subtitle: Text('宿泊約款URLの登録'),
          )
        ],
      ),
    );
  }
}

class SettingCard extends StatelessWidget {
  final VoidCallback onTap;
  final Text text;
  final Text subtitle;
  SettingCard({Key key, this.onTap, this.text,this.subtitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: text, onTap: onTap,subtitle: subtitle,),
    );
  }
}
