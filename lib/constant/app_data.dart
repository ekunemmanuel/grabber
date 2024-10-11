import 'package:flutter/material.dart';

import 'app_assets.dart';
import 'app_color.dart';

class Item {
  final String name;
  final String image;
  final String price;
  final String rating;
  final String ratingCount;

  Item({
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.ratingCount,
  });

  static List<Item> items = [
    Item(
      name: "Apple",
      image: AppAssets.vegetables,
      price: "2.99",
      rating: "4.5",
      ratingCount: "240",
    ),
    Item(
      name: "Banana",
      image: AppAssets.vegetables,
      price: "1.99",
      rating: "4.5",
      ratingCount: "1200",
    ),
    Item(
      name: "Orange",
      image: AppAssets.vegetables,
      price: "3.99",
      rating: "4.5",
      ratingCount: "2800",
    ),
    Item(
      name: "Pineapple",
      image: AppAssets.vegetables,
      price: "4.99",
      rating: "4.5",
      ratingCount: "2030",
    ),
    Item(
      name: "Strawberry",
      image: AppAssets.vegetables,
      price: "5.99",
      rating: "4.5",
      ratingCount: "1200",
    ),
  ];
}

final banners = [
  {
    'title': 'Up to 30% offer',
    'description': 'Enjoy our big offer',
    'image': AppAssets.banner1,
    "bannerColor": AppColor.banner1,
    "titleColor": Colors.black,
    "descriptionColor": AppColor.primary,
    "buttonColor": AppColor.primary,
    "buttonTextColor": Colors.white,
  },
  {
    'title': 'Up to 25% offer',
    'description': 'On first buyers',
    'image': AppAssets.banner2,
    "bannerColor": AppColor.banner2,
    "titleColor": Colors.white,
    "descriptionColor": Colors.white,
    "buttonColor": Colors.white,
    "buttonTextColor": Colors.black,
  },
  {
    'title': 'Get Same day Delivery',
    "description": "On orders above \$20",
    'image': AppAssets.banner3,
    "bannerColor": AppColor.banner3,
    "titleColor": Colors.black,
    "descriptionColor": Colors.black,
    "buttonColor": Colors.white,
    "buttonTextColor": Colors.black,
  },
];

class BannerData {
  final String title;
  final String description;
  final String image;
  final Color bannerColor;
  final Color titleColor;
  final Color descriptionColor;
  final Color buttonColor;
  final Color buttonTextColor;

  BannerData({
    required this.title,
    required this.description,
    required this.image,
    required this.bannerColor,
    required this.titleColor,
    required this.descriptionColor,
    required this.buttonColor,
    required this.buttonTextColor,
  });

  factory BannerData.fromJson(Map<String, dynamic> json) {
    return BannerData(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      bannerColor: json['bannerColor'],
      titleColor: json['titleColor'],
      descriptionColor: json['descriptionColor'],
      buttonColor: json['buttonColor'],
      buttonTextColor: json['buttonTextColor'],
    );
  }

  static List<BannerData> items = banners.map((e) => BannerData.fromJson(e)).toList();
}
