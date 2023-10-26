import 'package:flutter/material.dart';
import 'package:news_app/Screens/NewsItem.dart';
import 'package:news_app/Screens/SourceItem.dart';
import 'package:news_app/Shared/network/remote/Api_manager.dart';
import 'package:provider/provider.dart';

import '../Models/SourceResponse.dart';
import '../Provider/MyProvider.dart';

class Tab_Controller extends StatefulWidget {
  List<Sources> sources;
  String txt;

  Tab_Controller(this.sources,this.txt);

  @override
  State<Tab_Controller> createState() => _Tab_ControllerState();
}

class _Tab_ControllerState extends State<Tab_Controller> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: (value) {
                selectedIndex = value;
                setState(() {

                });
              },
              indicatorColor:pro.mode==ThemeMode.light? Colors.transparent:Colors.black,
              isScrollable: true,
              tabs: widget.sources
                  .map((source) =>
                  Tab(
                      child: SourceItem(
                          source, widget.sources.indexOf(source) == selectedIndex)
                  ))
                  .toList(),
            )),
        FutureBuilder(future: ApiManager.getNews(widget.sources[selectedIndex].id??"",widget.txt)
            ,builder:(context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("some Thing went wrong"));
            }
            var newsList=snapshot.data?.articles??[];
            return Expanded(
              child: ListView.builder(itemBuilder:(context, index) {
                return  NewsItem(newsList[index]);
              },itemCount: newsList.length,),
            );

            },)
      ],
    );
  }
}
