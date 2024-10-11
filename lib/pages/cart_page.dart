import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grabber/constant/app_assets.dart';

import '../widget/cart_list.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              SvgPicture.asset(AppAssets.order),
              const SizedBox(width: 7),
              const Text("Orders"),
              const SizedBox(width: 20),
            ],
          ),
        ],
      ),
      body: CartList(
        widget: const Text(
          'Go to Checkout',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        next: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CheckoutPage(),
            ),
          );
        },
      ),
    );
  }
}
