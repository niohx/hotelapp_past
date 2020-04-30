import 'package:flutter/material.dart';
import 'package:hotelapp/common/appbar.dart';
import 'package:system_settings/system_settings.dart';

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
            onTap:(){Navigator.pushNamed(context,'/editsentense');}
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
          ),
          SettingCard(
            text:Text('携帯の設定画面へ'),
            subtitle: Text('こちらからホーム画面の解除は出来ます。'),
            onTap:SystemSettings.app,
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
