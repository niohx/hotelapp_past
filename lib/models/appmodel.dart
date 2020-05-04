import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class AppModel extends ChangeNotifier {
  SharedPreferences _prefs;
  String imgpath;
  String explanation;
  File img;

  //constructor read value from shared preferences.
  AppModel() {
    readAndSetData();
  }
  //constructor (separete to its own).
  void readAndSetData() async {
    _prefs = await SharedPreferences.getInstance();
    imgpath = _prefs.getString('imageplace') ?? null;
    explanation = _prefs.getString('explanation') ?? null;
    notifyListeners();
  }

  //save directory of the image.
  void saveImage(File img) async {
    Directory _direcotry = await getApplicationDocumentsDirectory();
    String path = _direcotry.path;
    print('$path');
    img.copy('$path/img.png');
    _prefs.setString('imageplace', '$path/img.png');
        
    notifyListeners();
  }

  //save explanation
  void saveExplanation(String text) {
    
    _prefs.setString('explanation', text);
    
    notifyListeners();
  }

  //retreive image from image picker.
  Future<File> getImage() async {
    print('getting images..');
    img = await ImagePicker.pickImage(source: ImageSource.gallery);
    print(img.path);
    
    notifyListeners();
    return img;
  }
}
