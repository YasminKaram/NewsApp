import 'package:flutter/material.dart';
import 'package:news_app/Models/SourceResponse.dart';
import 'package:news_app/Shared/style/Colors.dart';

class SourceItem extends StatelessWidget {
  Sources sources;
  bool selected;

  SourceItem(this.sources, this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      decoration: BoxDecoration(
          color: selected ? primaryColor : Colors.white,
          borderRadius:BorderRadius.circular(25),
      border: Border.all(color: primaryColor)),
      child: Text(sources.name ?? "",
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: selected ? Colors.white : primaryColor)),
    );
  }
}
