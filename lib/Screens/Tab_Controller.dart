import 'package:flutter/material.dart';
import 'package:news_app/Screens/NewsItem.dart';
import 'package:news_app/Screens/SourceItem.dart';
import 'package:news_app/Screens/home/Cubit/cubit.dart';
import 'package:news_app/Shared/network/remote/Api_manager.dart';
import 'package:provider/provider.dart';

import '../Models/SourceResponse.dart';
import '../Provider/MyProvider.dart';

class Tab_Controller extends StatelessWidget {
  String txt;

  Tab_Controller(this.txt);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Column(
      children: [
        DefaultTabController(
            length: HomeCubit.get(context).sources.length,
            child: TabBar(
              onTap: (value) {
                HomeCubit.get(context).changSource(value);
              },
              indicatorColor: pro.mode == ThemeMode.light
                  ? Colors.transparent
                  : Colors.black,
              isScrollable: true,
              tabs: HomeCubit.get(context)
                  .sources
                  .map((source) => Tab(
                      child: SourceItem(
                          source,
                          HomeCubit.get(context).sources.indexOf(source) ==
                              HomeCubit.get(context).selectedIndex)))
                  .toList(),
            )),
        Expanded(
          child: ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(HomeCubit.get(context).articals[index]);
              },
              itemCount: HomeCubit.get(context).articals.length),
        )
      ],
    );
  }
}
