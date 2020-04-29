import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hotelapp/common/appbar.dart';

class HomeScreen extends StatefulWidget{
  @override 
  _HomeScreenState createState()=> _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      appBar: generalappbar,
      body: ListView(
        children: <Widget>[
          //トップへ？
          Center(
              child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                      'ようこそ伊勢屋へ！\n\n free-wifi \n SSID:iseya-free-wifi '))),
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
            trailing: IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:(BuildContext context){
                      return AlertDialog(
                        title: Text('パスワードを入力してください'),
                        content: TextField(
                          onChanged: (value){
                            _editedPassword = value;
                          },
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('submit'),
                            onPressed:(){
                              if(_editedPassword ==  _password){
                                Navigator.pop(context);
                                Navigator.pushNamed(context,'/settings');
                              }else{
                                Navigator.pop(context);
                              }
                            }
                            ),
                          FlatButton(
                            child: Text('cancel'),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          )
                        ],

                      );
                    },
                  );
                  //Navigator.pushNamed(context, '/settings');
                }),
          )
        ],
      ),
    );
  }
}
