import 'package:flutter/material.dart';
import 'package:news_app/Models/CatogaryModel.dart';

import '../Shared/network/remote/Api_manager.dart';
import 'Tab_Controller.dart';

class NewsTab extends StatelessWidget {
String catId;

String txt;
NewsTab(this.catId,this.txt);

  @override
  Widget build(BuildContext context) {

    return Padding(
          padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: ApiManager.getSources(catId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("some Thing went wrong"));
                }
                var data = snapshot.data?.sources ?? [];

                return Tab_Controller(data,txt!);
              },
            ),
          );
  }
}
