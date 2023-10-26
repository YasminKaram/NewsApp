import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper{
  static late SharedPreferences prefs;

  static setLanguage(String lang)async{
    await prefs.setString("lang", lang);
  }

  static String? getLanguage(){
    return prefs.getString("lang");
  }

  static setTheme(String mode)async{
    await prefs.setString("theme", mode);
  }

  static String? getTheme(){
    return prefs.getString("theme")?? "light";
  }


}