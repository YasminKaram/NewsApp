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
       CategoryModel("Sports", "sports", "assets/images/sports.png", Colors.red),
       CategoryModel("Business", "business", "assets/images/bussines.png", Color(0xff003E90)),
       CategoryModel("Entertainment", "entertainment", "assets/images/environment.png", Colors.pink),
       CategoryModel("General", "general", "assets/images/Politics.png", Colors.orange),
       CategoryModel("Health", "health", "assets/images/health.png", Colors.blue),
       CategoryModel("Science", "science", "assets/images/science.png", Colors.yellow),
       CategoryModel("Technology", "technology", "assets/images/environment.png", Colors.green),

     ];
  }


}
