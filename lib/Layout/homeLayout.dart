
import 'package:flutter/material.dart';
import 'package:news_app/Models/CatogaryModel.dart';
import 'package:news_app/Models/SourceResponse.dart';
import 'package:news_app/Screens/DrawerTab.dart';
import 'package:news_app/Screens/Tab_Controller.dart';
import 'package:news_app/Screens/categoriesTab.dart';
import 'package:news_app/Shared/network/remote/Api_manager.dart';
import 'package:provider/provider.dart';

import '../Provider/MyProvider.dart';
import '../Screens/NewsTab.dart';
import '../Screens/Settings/SettingsTab.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "layout";
  bool select = false;
  bool visable = false;
  TextEditingController search = TextEditingController();

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    List<CategoryModel> category = CategoryModel.getCatogegories();
    return Container(
      decoration: BoxDecoration(
          color: pro.mode==ThemeMode.light?Colors.white:Colors.black,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar:
              widget.visable==true? AppBar(
                  toolbarHeight: 70,
                  title: TextField(
                    controller: widget.search,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                        filled: true,
                        hintText: "Search Article",
                        suffixIcon: IconButton(onPressed: () {
                          setState(() {

                          });

                        }, icon: Icon(Icons.search_sharp)),
                        fillColor: Colors.white,
                        prefixIcon: IconButton(onPressed: () {
                          widget.visable = false;
                          widget.search.clear();
                          setState(() {

                          });
                        }, icon: Icon(Icons.highlight_remove)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(18))),

                  )
              ) :
              AppBar(
            toolbarHeight: 70,
            title: Text(categoryModel?.name ?? "News App"),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18)),
                borderSide: BorderSide(color: Colors.transparent)),
            actions: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: categoryModel != null && widget.select == false
                      ? IconButton(
                          onPressed: () {
                            widget.visable = true;
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.search_sharp,
                            size: 35,
                          ))
                      : SizedBox()),

            ],
          ),
          drawer: DrawerTab(onDrawerClick),
          body: categoryModel != null && widget.select == false
              ? NewsTab(categoryModel!.id,widget.search.text ??"")
              : widget.select == false
                  ? CategoriesTab(category, onCategoryClick)
                  : SettingTab()),
    );
  }

  CategoryModel? categoryModel = null;

  onCategoryClick(category) {
    categoryModel = category;
    widget.select = false;
    setState(() {});
  }

  onDrawerClick(id) {
    if (id == DrawerTab.Cat_Id) {
      categoryModel = null;
      widget.select = false;
      setState(() {
        Navigator.pop(context);
      });
    } else if (id == DrawerTab.Sett_Id) {
      categoryModel = null;
      widget.select = true;
      setState(() {
        Navigator.pop(context);
      });
    }
  }
}
