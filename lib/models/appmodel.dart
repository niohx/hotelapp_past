import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class AppModel with ChangeNotifier {
  SharedPreferences _prefs;

  //最初の画像と文章用
  String imgpath;
  String explanation;
  File img;

  //カードを表示させるかどうか
  AppVisibility appVisibility;
  
  //constructor
  Future<Map<String, Map>> readSettingData() async {
    //最初の画像と文章のロード
    _prefs = await SharedPreferences.getInstance();
    imgpath = _prefs.getString('imageplace') ?? null;
    explanation = _prefs.getString('explanation') ?? null;
    appVisibility = new AppVisibility();
    
    return {"firstData":{"imagepath": imgpath, "explanation": explanation},
            };
  }

  //save directory of the image.
  void saveImagePlace(File img) async {
    await _prefs.setString('imageplace', img.path);
    print((explanation != null) ? explanation : 'no explanation');
    notifyListeners();
  }

  //save explanation
  void saveExplanation(String text) async {
    await _prefs.setString('explanation', text);
    notifyListeners();
  }

  //retreive image from image picker.
  Future<File> getImage() async {
    img = await ImagePicker.pickImage(source: ImageSource.gallery);
    return img;
    //notifyListeners();
  }
}

//使うかどうかわかんない
class AppVisibility {

  bool alarmclock ;
  bool youtube ;
  bool recomendation ;
  bool menu;
  bool agreement;

  SharedPreferences _prefs;

  AppVisibility(){getVisibility();}

  Future<void> getVisibility() async{
    _prefs = await SharedPreferences.getInstance() ;
    youtube = _prefs.getBool('youtube') ?? true;
    alarmclock = _prefs.getBool('alarmclock') ?? true;
    recomendation = _prefs.getBool('recomendation') ?? true;
    menu = _prefs.getBool('menu') ?? true;
    agreement = _prefs.getBool('agreement') ?? true;
    }
  
}