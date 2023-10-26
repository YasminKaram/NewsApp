import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/prefs_Helper.dart';

class MyProvider extends ChangeNotifier{
  String Language='en';
  ThemeMode mode=ThemeMode.light;

 void changeLanguage(String lang){
    Language=lang;
    PrefsHelper.setLanguage(lang);
    notifyListeners();
  }


  changeThemeing(ThemeMode newmode){
   mode=newmode;
   if(newmode==ThemeMode.light){
     PrefsHelper.setTheme('light');
   }
   else{
     PrefsHelper.setTheme('dark');
   }
   notifyListeners();
  }



   void init() async{
   String ? newlang=PrefsHelper.getLanguage();
   changeLanguage(newlang ?? "en");
   String ?newMode=PrefsHelper.getTheme();
   if(newMode=='light'){
     changeThemeing(ThemeMode.light);
   }
   else{
     changeThemeing(ThemeMode.dark);
   }

  }

}