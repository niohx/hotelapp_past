import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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

  Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState((){
      image = _image;
    });
  }

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
                _image == null ? Container(): Image.file(_image),
                RaisedButton.icon(icon:Icon(Icons.add_a_photo),label:Text('写真の追加'),onPressed: getImage,
                ),
                Text('文章'),
                SizedBox(height:20),
                TextFormField(
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                              ],
            ),
          )),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){},
        child:Icon(Icons.sync)
        ),
        );
  }
}
