import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/app_assets.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    super.key,
    required this.onDelete,
    required this.onAdd,
  });

  final void Function(int quantity)? onDelete;
  final void Function(int quantity)? onAdd;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        constraints: BoxConstraints(
          minWidth: 29, // Minimum width when only the add button is shown
          maxWidth:
              quantity > 0 ? 120 : 29, // Adjust max width based on the content
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          color: Colors.white,
        ),
        child: Material(
          borderRadius: BorderRadius.circular(1000),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (quantity > 0) ...[
                InkWell(
                  borderRadius: BorderRadius.circular(1000),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      AppAssets.trash,
                      width: 14,
                      height: 14,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      quantity = 0;

                      if (widget.onDelete != null) {
                        widget.onDelete!(
                            quantity); // Trigger callback with updated quantity
                      }
                    });
                  },
                ),
                const SizedBox(width: 8),
                InkWell(
                  borderRadius: BorderRadius.circular(1000),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.remove,
                      size: 14,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      quantity = quantity - 1;
                      if (quantity < 0) {
                        quantity = 0; // Prevent quantity from going negative
                      }
                      if (widget.onDelete != null) {
                        widget.onDelete!(
                            quantity); // Trigger callback with updated quantity
                      }
                    });
                  },
                ),
                const SizedBox(width: 8),
                Text(
                  quantity.toString(),
                  style: const TextStyle(),
                ),
                const SizedBox(width: 8),
              ],
              InkWell(
                borderRadius: BorderRadius.circular(1000),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    AppAssets.add,
                  ),
                ),
                onTap: () {
                  setState(() {
                    quantity = quantity + 1; // Increment quantity
                    if (widget.onAdd != null) {
                      widget.onAdd!(
                          quantity); // Trigger callback with updated quantity
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
