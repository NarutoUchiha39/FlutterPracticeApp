import 'package:flutter/material.dart';

class RecomendationsModel{

  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  RecomendationsModel({
    required this.name,
    required this.iconPath,
    required this.calorie,
    required this.boxColor,
    required this.level,
    required this.duration,
    required this.viewIsSelected,
  });

  static List<RecomendationsModel>getRecomendationModel(){
    List<RecomendationsModel>recomendation_model = [];

    recomendation_model.add(
      RecomendationsModel(
       name: 'Honey Pancake',
       iconPath: 'assets/icon/honey-pancakes.svg',
       level: 'Easy',
       duration: '30mins',
       calorie: '180kCal',
       viewIsSelected: true,
       boxColor: const Color(0xff9DCEFF)
      )
    );

    recomendation_model.add(
      RecomendationsModel(
       name: 'Canai Bread',
       iconPath: 'assets/icon/canai-bread.svg',
       level: 'Easy',
       duration: '20mins',
       calorie: '230kCal',
       viewIsSelected: false,
       boxColor: const Color(0xffEEA4CE)
      ));
    
    return recomendation_model;
  }

}