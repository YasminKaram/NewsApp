import 'package:flutter/material.dart';
import 'package:news_app/Provider/MyProvider.dart';
import 'package:provider/provider.dart';

import 'BottomSheets/ShowBottomSheetLanguage.dart';
import 'BottomSheets/ShowBottomSheetTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.bodyMedium),
            InkWell(
              onTap: () {
                ShowLanguageSheet();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                    color: pro.mode==ThemeMode.light?Colors.white:Colors.black,

                      border: Border.all(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(pro.Language == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,style: Theme.of(context).textTheme.bodySmall),
                  ),
                ),
              ),
            ),
            Text(AppLocalizations.of(context)!.theme,style: Theme.of(context).textTheme.bodyMedium),
            InkWell(
              onTap: () {
                ShowThemeingSheet();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                    color: pro.mode==ThemeMode.light?Colors.white:Colors.black,

                      border: Border.all(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(pro.mode == ThemeMode.light
                        ? AppLocalizations.of(context)!.light
                        : AppLocalizations.of(context)!.dark,style: Theme.of(context).textTheme.bodySmall),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ShowLanguageSheet() {
    return showModalBottomSheet(
        context: context,
        elevation: 12,
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12)),
            side: BorderSide(color: Colors.transparent)),
        builder: (context) {
          return ShowBottomSheetLanguage();
        });
  }

  ShowThemeingSheet() {
    return showModalBottomSheet(
        context: context,
        elevation: 12,
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12)),
            side: BorderSide(color: Colors.transparent)),
        builder: (context) {
          return ShowBottomSheetTheme();
        });
  }
}
