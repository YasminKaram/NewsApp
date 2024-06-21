import 'package:flutter/material.dart';
import 'package:news_app/Models/CatogaryModel.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;

  CategoryItem(this.categoryModel);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: categoryModel.color,
          borderRadius: BorderRadius.only(topRight: Radius.circular(18),topLeft:Radius.circular(18) )
        ),

        child: Column(children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset(categoryModel.image),
          )),
          Text(categoryModel.name,style: TextStyle(color: Colors.white,fontSize: 18)),
        ]),
      ),
    );
  }
}
