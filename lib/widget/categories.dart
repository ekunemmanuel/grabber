import 'package:flutter/material.dart';

import '../constant/app_assets.dart';
import '../constant/app_color.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemCount: Category.categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = Category.categories[index];
          return GestureDetector(
            // borderRadius: const BorderRadius.only(
            //   topLeft: Radius.circular(2000),
            //   topRight: Radius.circular(2000),
            //   bottomLeft: Radius.circular(2000),
            //   bottomRight: Radius.circular(2000),
            // ),
            onTap: () {
              print("Tapped");
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColor.neutral50,
                    borderRadius: BorderRadius.circular(10000),
                  ),
                  child: Image.asset(
                    category.icon,
                    height: 40,
                    width: 40,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 20),
      ),
    );
  }
}

class Category {
  final String name;
  final String icon;

  Category({
    required this.name,
    required this.icon,
  });

  static List<Category> categories = [
    Category(name: "Fruits", icon: AppAssets.fruits),
    Category(name: "Milk & eggs", icon: AppAssets.milkEgg),
    Category(name: "Beverages", icon: AppAssets.beverages),
    Category(name: "Laundry", icon: AppAssets.laundry),
    Category(name: "Vegetables", icon: AppAssets.vegetables),
  ];
}
