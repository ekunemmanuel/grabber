import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/app_assets.dart';
import '../constant/app_color.dart';
import '../constant/app_data.dart';
import 'animated_button.dart';

class Items extends StatelessWidget {
  const Items({
    super.key,
    required this.component,
  });

  final Component component;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                component.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See all",
                  style: TextStyle(
                    color: AppColor.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 245,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: Item.items.length,
            itemBuilder: (context, index) {
              final item = component.items[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 160,
                        height: 140,
                        decoration: BoxDecoration(
                          color: AppColor.neutral200,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(item.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: AnimatedButton(
                            onAdd: (quantity) {},
                            onDelete: (quantity) {},
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.star,
                            height: 14,
                            width: 14,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "${item.rating} (${item.ratingCount})",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "\$${item.price}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
          ),
        ),
      ],
    );
  }
}

class Component {
  final String name;
  final List<Item> items;

  Component({
    required this.name,
    required this.items,
  });
}
