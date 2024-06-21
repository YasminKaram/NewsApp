import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Layout/homeLayout.dart';
import 'package:news_app/Provider/MyProvider.dart';
import 'package:news_app/Shared/style/MyThemedata.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/observer.dart';
import 'package:news_app/prefs_Helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/details.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  PrefsHelper.prefs = await SharedPreferences.getInstance();
Bloc.observer=MyBlocObserver();

  runApp(ChangeNotifierProvider(create: (context) => MyProvider()..init(),child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute:HomeLayout.routeName ,
      routes: {
        HomeLayout.routeName:(context) => HomeLayout(),
        NewsDetails.routeName:(context) =>NewsDetails()

      },
      locale: Locale(pro.Language),
      themeMode:pro.mode,
       theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
    );
  }
}
