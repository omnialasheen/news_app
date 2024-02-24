import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_dm.dart';
import 'package:news_app/ui/screen/home/tab/categories/category_widget.dart';

class CategoriesTab extends StatelessWidget {
  final Function onCategoryClick;
  CategoriesTab({super.key,required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10,),
        const Text("Pick your category of interest",
          style: TextStyle(color: Color(0xff4F5A69),fontSize: 22,fontWeight: FontWeight.w700),),
        const SizedBox(height: 14,),
        Expanded(
          child: GridView.builder(
            itemCount: CategoryDM.categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8),
            itemBuilder:(context, index) {
              return InkWell(
                onTap: (){
                  onCategoryClick(CategoryDM.categories[index]);
                },
                child: CategoryWidget(categoryDM: CategoryDM.categories[index]));}),
        )
      ],
    );
  }
}