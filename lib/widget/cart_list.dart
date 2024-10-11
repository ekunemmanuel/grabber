import 'package:flutter/material.dart';

import '../constant/app_assets.dart';
import '../constant/app_color.dart';
import '../constant/app_data.dart';
import 'animated_button.dart';
import 'basket_with_chip.dart';

class CartList extends StatelessWidget {
  const CartList({
    super.key,
    required this.next,
    required this.widget,
  });
  final void Function() next;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  final item = Item.items[index];
                  return Material(
                    color: Colors.transparent,
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          color: AppColor.neutral50,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          AppAssets.beverages,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0,
                      ),
                      title: Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      subtitle: Text(
                        "\$${item.price}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.neutral600,
                        ),
                      ),
                      trailing: AnimatedButton(
                        onDelete: (value) {},
                        onAdd: (quantity) {},
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: Item.items.length),
          ),
          const SizedBox(
            height: 30,
          ),
          Material(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: next,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: widget,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
