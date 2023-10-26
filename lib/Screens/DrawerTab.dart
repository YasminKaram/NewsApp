import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../Provider/MyProvider.dart';
class DrawerTab extends StatelessWidget {
  Function onClick;

  DrawerTab(this.onClick);

static int Cat_Id=1;
static int Sett_Id=2;


  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width*.6,
        decoration: BoxDecoration(
            color: pro.mode==ThemeMode.light?Colors.white:Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12))),
        child: Column(

            children: [
              Container(
                height:100 ,
                width: double.infinity,
                color: Colors.green,
                child: Center(child: Text("News App")),
              ),
          InkWell(
            onTap: (){
              onClick(Cat_Id);
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Icon(Icons.list_rounded),
                  SizedBox(width: 20,),
                  Text(AppLocalizations.of(context)!.category,style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              onClick(Sett_Id);
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 20,),
                  Text(AppLocalizations.of(context)!.settings,style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
