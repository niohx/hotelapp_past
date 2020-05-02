import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


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
  File _image;
  GlobalKey _globalKey = GlobalKey();
  final TextEditingController _controller = TextEditingController();
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Page Context'),
      ),
      body: Form(
        key: _globalKey,
        child: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _image == null
                  ? Container()
                  : SizedBox(
                      width: 150.0, height: 200.0, child: Image.file(_image)),
              RaisedButton.icon(
                icon: Icon(Icons.add_a_photo),
                label: Text('写真の追加'),
                onPressed: (){},
              ),
              Text('文章'),
              SizedBox(height: 20),
              TextFormField(
                controller: _controller,
                onChanged: (value) {
                  
                },
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            
            Navigator.pushReplacementNamed(context,'/');
          },
          child: Icon(Icons.sync)),
    );
  }
}
