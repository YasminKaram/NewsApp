import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/NewsResponse.dart';

import 'details.dart';

class NewsItem extends StatelessWidget {
  Articles articles;

  NewsItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context,  NewsDetails.routeName,arguments: articles );
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Card(
          elevation: 12,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.transparent)),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
            child: Column(children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14), topRight: Radius.circular(14)),
                child: CachedNetworkImage(
                  imageUrl: articles.urlToImage ?? "",
                  fit: BoxFit.fill,
                  height: 230,

                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Text(articles.title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(articles.description ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              Row(children: [
                Expanded(
                  child: Text(articles.author ?? "",
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                ),
                Text(articles.publishedAt?.substring(0, 10) ?? "",
                    maxLines: 1,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
              ])
            ]),
          ),
        ),
      ),
    );
  }
}
