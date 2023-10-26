import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/Provider/MyProvider.dart';
import 'package:provider/provider.dart';

class ShowBottomSheetLanguage extends StatelessWidget {
  const ShowBottomSheetLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisSize: MainAxisSize.min,
            children: [
          InkWell(
            onTap: (){
              pro.changeLanguage("en");
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.english,style: Theme.of(context).textTheme.bodySmall,),
                  Spacer(),
                  pro.Language=='en'?
                  Icon(Icons.check):SizedBox.shrink(),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: (){
              pro.changeLanguage("ar");
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.arabic,style: Theme.of(context).textTheme.bodySmall),
                  Spacer(),
                  pro.Language=='ar'?
                  Icon(Icons.check):SizedBox.shrink(),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
