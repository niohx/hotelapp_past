import 'package:global_configuration/global_configuration.dart';

void loadFromAssets() async{
  var cfg = await GlobalConfiguration().loadFromAsset('cfg.json');
  

}

class AppSettings {
  
}

