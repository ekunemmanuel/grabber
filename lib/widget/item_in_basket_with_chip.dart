import 'package:flutter/material.dart';

import '../constant/app_color.dart';

class ItemInBasketWithChip extends StatelessWidget {
  const ItemInBasketWithChip({
    super.key,
    required this.image,
    this.text,
  });

  final String image;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: Stack(
        children: [
          Container(
            width: 36,
            height: 36,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Image.asset(
              image,
              width: 30,
              height: 24,
            ),
          ),
          text != null
              ? Transform.translate(
                  offset: const Offset(20, 0),
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        // width: 15,
                        // height: 15,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(
                            color: AppColor.primary,
                          ),
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        child: Text(
                          text!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
