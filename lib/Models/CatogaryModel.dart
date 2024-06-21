import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryModel {
  String name;
  String id;
  String image;
  Color color;

  CategoryModel(this.name, this.id, this.image, this.color);

    static List<CategoryModel>getCatogegories(){
     return[
       CategoryModel("Technology", "technology", "assets/images/technology.png",Color(0xff804aff)),
       CategoryModel("Sports", "sports", "assets/images/sports.png", Color(0xff00CCC0)),
       CategoryModel("Health", "health", "assets/images/health.png", Colors.pink),
       CategoryModel("Business", "business", "assets/images/bussines.png", Color(0xffd4abf1)),
       CategoryModel("Science", "science", "assets/images/science.png",Color(0xff0CABA8)),
       CategoryModel("Entertainment", "entertainment", "assets/images/environment.png", Colors.deepOrange),
       CategoryModel("General", "general", "assets/images/general.png",Colors.yellow),


     ];
  }


}
