import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class AppModel with ChangeNotifier {
  SharedPreferences _prefs;
  String imgpath;
  String explanation;
  File img;

   
  //constructor (separete to its own).
  Future<Map<String,String>> readSettingData() async {
  //  print('reading begins');
    _prefs = await SharedPreferences.getInstance();
    imgpath = _prefs.getString('imageplace') ?? null;
    explanation = _prefs.getString('explanation') ?? null;

    return {"imagepath":imgpath,"explanation":explanation};

    //notifyListeners();
    
    
  }

  //save directory of the image.
  void saveImagePlace(File img) async {
    
    await _prefs.setString('imageplace', img.path);
    print((explanation != null) ? explanation : 'no explanation');
    notifyListeners();
  }

  //save explanation
  void saveExplanation(String text) async {
    
    await _prefs.setString('explanation', text) ;
    notifyListeners();
  }

  //retreive image from image picker.
  Future<File> getImage() async {
    img = await ImagePicker.pickImage(source: ImageSource.gallery);
    return img;
    //notifyListeners();
    
  }
}
