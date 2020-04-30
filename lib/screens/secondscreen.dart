import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';

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

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  String _mytext;
  final TextEditingController _controller = TextEditingController();

  Future<void> _saveImageAndText(File _image, String _text) async {
    if (_image == null) { return;
    } else {
      Directory path = await getApplicationDocumentsDirectory();
      String pathName = path.path;
      var fileName = basename(_image.path);
      _image.copy('$pathName/$fileName');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('imageplace', pathName);
      prefs.setString('explaination', _text);
      print(_text);
    }
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
              _image == null
                  ? Container()
                  : SizedBox(
                      width: 150.0, height: 200.0, child: Image.file(_image)),
              RaisedButton.icon(
                icon: Icon(Icons.add_a_photo),
                label: Text('写真の追加'),
                onPressed: getImage,
              ),
              Text('文章'),
              SizedBox(height: 20),
              TextFormField(
                controller: _controller,
                onChanged: (value){
                  _mytext = value;
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
      floatingActionButton:
          FloatingActionButton(onPressed: () {
            print(_mytext);
            _saveImageAndText(_image, _mytext);
            
            setState((){
              _image = null;
              _mytext = null;
              _controller.clear();
            });

          }, child: Icon(Icons.sync)),
    );
  }
}
