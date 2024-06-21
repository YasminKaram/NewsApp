import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/NewsResponse.dart';
import 'package:news_app/Shared/style/Colors.dart';
import 'package:provider/provider.dart';

import '../Provider/MyProvider.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = "details";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Articles;
    var pro = Provider.of<MyProvider>(context);
    return Container(
        decoration: BoxDecoration(
            color: pro.mode == ThemeMode.light ? Colors.white : darkPrimary,
            image: DecorationImage(
                image: AssetImage("assets/images/pattern.png"),
                opacity: 0.2,
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: primaryColor,
              title: Text(args.title ?? ""),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: CachedNetworkImage(
                      imageUrl: args.urlToImage ?? "",
                      fit: BoxFit.fill,
                      height: 230,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress)),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(args.title ?? "",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: primaryColor)),
                  SizedBox(height: 12,),
                  Text(args.description ?? "",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),

                  SizedBox(height: 15,),
                  Row(children: [
                    Expanded(
                      child: Text(args.author ?? "",
                          style:
                              TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.purple)),
                    ),
                    Text(args.publishedAt?.substring(0, 10) ?? "",

                        style:
                            TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color: Colors.purple)),
                  ])
                ]),
              ),
            )));
  }
}
