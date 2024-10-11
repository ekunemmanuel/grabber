import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grabber/constant/app_assets.dart';
import 'package:grabber/widget/animated_button.dart';

import '../constant/app_color.dart';
import '../constant/app_data.dart';
import '../widget/banners.dart';
import '../widget/basket_with_chip.dart';
import '../widget/cart_list.dart';
import '../widget/categories.dart';
import '../widget/item_in_basket_with_chip.dart';
import '../widget/items.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(AppAssets.bike),
            const SizedBox(width: 10),
            const Text(
              "61 Hopper street..",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 10),
            RotatedBox(
              quarterTurns: 3,
              child: SvgPicture.asset(
                AppAssets.arrow,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: BasketWithChip(),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const Banners(),
                const SizedBox(
                  height: 20,
                ),
                const Categories(),
                const SizedBox(
                  height: 20,
                ),
                Items(
                  component: Component(
                    name: 'Fruit',
                    items: Item.items,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Items(
                  component: Component(
                    name: 'Vegetable',
                    items: Item.items,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Items(
                  component: Component(
                    name: 'Beverages',
                    items: Item.items,
                  ),
                ),
                const SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(right: 10),
                          itemCount: Item.items.length,
                          itemBuilder: (context, index) {
                            final image = Item.items[index].image;
                            return ItemInBasketWithChip(
                              image: image,
                              text: '10+',
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Builder(builder: (context) {
                      return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              // barrierColor: Colors.red,
                              backgroundColor: Colors.white,
                              sheetAnimationStyle:
                                  AnimationStyle(curve: Curves.ease),
                              builder: (context) {
                                return CartList(
                                  widget: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Go to Cart (\$30.99)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      BasketWithChip(
                                        text: '500',
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                  next: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const CartPage(),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            child: const Row(
                              children: [
                                Text(
                                  "View Basket",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                BasketWithChip(
                                  color: Colors.white,
                                  text: '10+',
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_rounded),
            label: 'Menu',
          ),
        ],
      ),
      // bottomSheet: Container(
      //   child: Center(
      //     child: Text("Bottom sheet"),
      //   ),
      // ),
    );
  }
}
