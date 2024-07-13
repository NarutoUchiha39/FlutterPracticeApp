import 'package:flutter/material.dart';

class Categories {

  String filePath;
  String category;
  Color color;

  Categories({
    required  this.filePath,
    required this.category,
    required this.color
  });

  static List<Categories> getCategory(){
    List<Categories> categories = [];
    categories.add(
      Categories(
      filePath: "assets/icon/salad.svg",
      category: "Salad",
      color:  Color(0xff92A3FD).withOpacity(0.4))
    );
    categories.add(
      Categories(
      filePath: "assets/icon/cake.svg",
      category: "Cake",
      color:  Color(0xffC588F2).withOpacity(0.4))
    );


    categories.add(
      Categories(
      filePath: "assets/icon/smoothie.svg",
      category: "Smoothies",
      color:  Color(0xff92A3FD).withOpacity(0.4))
    );

    return categories;
  }
  
}