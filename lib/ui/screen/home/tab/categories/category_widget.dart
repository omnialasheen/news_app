import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_dm.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryDM categoryDM;
  final Radius radius = const Radius.circular(16);
  const CategoryWidget({super.key,required this.categoryDM});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryDM.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: radius,topRight: radius,
          bottomLeft: categoryDM.isLeftSide ? Radius.zero : const Radius.circular(16),
          bottomRight: !categoryDM.isLeftSide ? Radius.zero : const Radius.circular(16),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(categoryDM.imagePath,height: MediaQuery.of(context).size.height * 0.14,),
          const SizedBox(height: 10,),
          Text(categoryDM.title,
            style: const TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w400),),
        ],
      ),
    );
  }
}