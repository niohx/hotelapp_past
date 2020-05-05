import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hotelapp/common/appbar.dart';
import 'package:hotelapp/models/appmodel.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //String _mytext;
  //String _myPath;
  bool isLogin = true;

   _launchyoutube(url) async {
    String _url = url;
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'coud not open $_url';
    }
  }

  final isVisible = true;
  final _password = 'admin';
  String _editedPassword;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppModel appmodel = Provider.of<AppModel>(context);
    appmodel.readSettingData();
    return Scaffold(
      appBar: new AppBar(
        title: Text('welcome'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(10.0),
//Consumer Pattern
/*              child: Consumer<AppModel>(
                builder:(context,appmodel,child){
                return Row(children: <Widget>[
                (appmodel.imgpath != null)
                    ? SizedBox(
                        height: 200.0,
                        width: 200.0,
                        child: Image.file(File(appmodel.imgpath)))
                    : Container(),
                Text('${appmodel.explanation}'),
                
              ]);}
              )
*/
//using Provider.of<AppModel>(context) pattern
              child: FutureBuilder(
                  future: appmodel.readSettingData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<Map<String, Map>> snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return CircularProgressIndicator();
                    } else {
                      return Row(
                        children: <Widget>[
                          if (snapshot.data["firstData"]['imagepath'] != null)
                            SizedBox(
                              height: 200.0,
                              width: 200.0,
                              child:
                                  Image.file(File(snapshot.data['firstData']['imagepath'])),
                            ),
                          if (snapshot.data['firstData']["explanation"] != null)
                            Text(snapshot.data['firstData']['explanation']),
                        ],
                      );
                    }
                  })),
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
              onTap: _launchyoutube('http://www.youtube.co.jp'),
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
            onTap: () {},
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
