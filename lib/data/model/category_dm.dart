import 'package:flutter/material.dart';

class CategoryDM{
  String id;
  String title;
  String imagePath;
  bool isLeftSide;
  Color backgroundColor;
  CategoryDM({required this.id,required this.title,required this.imagePath,required this.isLeftSide,required this.backgroundColor});

  static List<CategoryDM> categories = [
    CategoryDM(id: "sprots", title: "Sports", imagePath: "assets/images/ball.png",
      isLeftSide: true, backgroundColor: const Color(0xffC91C22)),
    CategoryDM(id: "technology", title: "Technology", imagePath: "assets/images/Politics.png",
      isLeftSide: false, backgroundColor: const Color(0xff003E90)),  
    CategoryDM(id: "health", title: "Health", imagePath: "assets/images/health.png",
      isLeftSide: true, backgroundColor: const Color(0xffED1E79)),
    CategoryDM(id: "business", title: "Business", imagePath: "assets/images/bussines.png",
      isLeftSide: false, backgroundColor: const Color(0xffCF7E48)),  
    CategoryDM(id: "enviroment", title: "Enviroment", imagePath: "assets/images/environment.png", 
      isLeftSide: true, backgroundColor: const Color(0xff4882CF)),
    CategoryDM(id: "science", title: "Science", imagePath: "assets/images/science.png", 
    isLeftSide: false, backgroundColor: const Color(0xffF2D352))         
  ];
}