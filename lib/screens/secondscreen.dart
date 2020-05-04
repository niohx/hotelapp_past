import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hotelapp/models/appmodel.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('secondpage'),
      ),
      body: Center(
        child: Text('its second'),
      ),
    );
  }
}

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  String _text;
  File _file;
  //GlobalKey _globalKey = GlobalKey();
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppModel appmodel = Provider.of<AppModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Top Page Context'),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _file == null
                ? Container()
                : SizedBox(
                    width: 150.0,
                    height: 200.0,
                    child: Image.file(_file)),
            RaisedButton.icon(
              icon: Icon(Icons.add_a_photo),
              label: Text('写真の追加'),
              onPressed: () {
                appmodel.getImage().then((image) {
                  _file = image;
                  
                });
                
                setState(() {});
              },
            ),
            Text('文章'),
            SizedBox(height: 20),
            TextFormField(
              controller: _controller,
              onChanged: (value) {
                _text = value;
              },
              maxLines: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_file == null) {
              appmodel.saveExplanation(_text);

              Navigator.pushNamed(context, '/');
            } else {
              appmodel.saveExplanation(_text);
              appmodel.saveImage(_file);

              Navigator.pushNamed(context, '/');
            }
          },
          child: Icon(Icons.sync)),
    );
  }
}
