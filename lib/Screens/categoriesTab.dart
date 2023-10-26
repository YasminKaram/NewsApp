import 'package:flutter/material.dart';
import 'package:news_app/Screens/CategoryItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Models/CatogaryModel.dart';

class CategoriesTab extends StatelessWidget {
  List<CategoryModel> categories;

  Function onClick;

  CategoriesTab(this.categories, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppLocalizations.of(context)!.title),
        Expanded(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
            children: categories
                .map((category) => InkWell(
                    onTap: () {
                      onClick(category);
                    },
                    child: CategoryItem(category)))
                .toList(),
          ),
        )
      ],
    );
  }
}
