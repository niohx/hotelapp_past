import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hotelapp/common/appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _mytext;
  String _myPath;
  bool isLogin = true;

  void retrieveTextAndPath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _myPath = prefs?.getString('imageplace');
    _mytext = prefs?.getString('explanation');
    setState(() {});
  }

  @override
  void initState() {
    retrieveTextAndPath();
    super.initState();
  }

  void _launchyoutube() async {
    const url = 'https://youtube.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'coud not open $url';
    }
  }

  final isVisible = true;
  final _password = 'admin';
  String _editedPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('welcome'),
      ),
      body: ListView(
        children: <Widget>[
          //トップへ？
          Container(
              padding: EdgeInsets.all(10.0),
              child: Row(children: <Widget>[
                (_myPath != null)
                    ? SizedBox(
                        height: 200.0,
                        width: 200.0,
                        child: Image.file(File(_myPath)))
                    : Container(),
                Text('$_mytext'),
              ])),
          Card(
            child: ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
              subtitle: Text('アラームです。'),
              onTap: () {},
            ),
          ),
          Container(
            child: (isVisible)
                ? Card(
                    child: ListTile(
                      leading: Icon(Icons.local_bar),
                      title: Text('Menu'),
                      subtitle: Text('ドリンクと本日のオススメ別注料理'),
                      onTap: () {},
                    ),
                  )
                : Container(),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.video_library),
              title: Text('Youtube'),
              subtitle: Text('Youtubeアプリが開きます。'),
              onTap: _launchyoutube,
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('Nearby Reccomendations'),
              subtitle: Text('お近くのオススメスポットです。'),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.hotel),
              title: Text('宿泊約款'),
              onTap: () {
                Navigator.pushNamed(context, '/agreement');
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.access_time),
            onTap: () {
              retrieveTextAndPath();
              print(_mytext);
              print(_myPath);
              setState(() {});
            },
            trailing: IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  if (isLogin) {
                    Navigator.pushNamed(context, '/settings');
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('パスワードを入力してください'),
                          content: TextField(
                            onChanged: (value) {
                              _editedPassword = value;
                            },
                          ),
                          actions: <Widget>[
                            FlatButton(
                                child: Text('submit'),
                                onPressed: () {
                                  if (_editedPassword == _password) {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, '/settings');
                                  } else {
                                    Navigator.pop(context);
                                  }
                                }),
                            FlatButton(
                              child: Text('cancel'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      },
                    );
                  }

                  //Navigator.pushNamed(context, '/settings');
                }),
          )
        ],
      ),
    );
  }
}
