import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';


class AppModel with ChangeNotifier {
  SharedPreferences _prefs;
  String path;
  String explanation;
  File img;

  //constructor read value from shared preferences.
  AppModel() {
    readSettingData();
  }
  //constructor (separete to its own).
  void readSettingData() async {
    print('reading begins');
    _prefs = await SharedPreferences.getInstance();
    path = _prefs.getString('imageplace') ?? null;
    explanation = _prefs.getString('explanation') ?? null;
  }

  //save directory of the image.
  void saveImagePlace(File img) {
    _prefs.setString('imageplace', img.path);
    print((explanation != null) ? explanation : 'no explanation');
    notifyListeners();
  }

  //save explanation
  void saveExplanation(String text) {
    _prefs.setString('explanation', text);
    notifyListeners();
  }

  //retreive image from image picker.
  Future getImage() async {
    img = await ImagePicker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }
}
