import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grabber/constant/app_color.dart';

import '../constant/app_assets.dart';

class BasketWithChip extends StatelessWidget {
  const BasketWithChip({
    super.key,
    this.color,
    this.text,
  });

  final Color? color;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          SvgPicture.asset(
            AppAssets.basket,
            colorFilter: ColorFilter.mode(
              color ?? Colors.black,
              BlendMode.srcIn,
            ),
          ),
          text != null
              ? Transform.translate(
                  offset: const Offset(8, -8),
                  child: Container(
                    // width: 25,
                    height: 25,
                    // constraints: const BoxConstraints(
                    //   minWidth: 10,
                    //   maxWidth: 25,
                    //   maxHeight: 25,
                    //   minHeight: 10,
                    // ),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(
                        color: AppColor.primary,
                      ),
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: Center(
                      child: Text(
                        text!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
