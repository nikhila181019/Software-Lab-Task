import 'package:flutter/material.dart';
class onBoardingEntity {
  final Color bgColor; // Change type to Color
  final String image;
  final String title;
  final String description;

  onBoardingEntity({
    required this.bgColor, // Change type to Color
    required this.image,
    required this.title,
    required this.description,
  });

  static List<onBoardingEntity> onBoardingData = [
    onBoardingEntity(
      bgColor: Colors.green, // Use actual Color object
      image: "FirstOnBoarding.png",
      title: "Quality",
      description: "     Sell your farm fresh products directly to\n  consumers, cutting out the middleman and\nreducing emissions of the global supply chain",
    ),
    onBoardingEntity(
      bgColor: Colors.orange, // Use actual Color object
      image: "SecondOnBoarding.png",
      title: "Convenient",
      description: "Our team of delivery drivers will make sure\n     your orders are picked up on time and\n     promptly delivered to your customers.",
    ),
    onBoardingEntity(
      bgColor: Colors.yellow, // Use actual Color object
      image: "ThirdOnBoarding.png",
      title: "Local",
      description: "We love the earth and know you do too! Join us\nin reducing our local carbon footprint one order\n               "
          "                 at a time. ",
    ),
  ];
}
