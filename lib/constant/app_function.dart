import 'package:grabber/constant/app_assets.dart';

class AppFunction {
  // List
}

class Basket {
  final String name;
  final String price;
  final String image;
  String quantity;

  Basket({
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
  });

  static List<Basket> basketList = [
    Basket(
      name: 'Apple',
      price: '1.00',
      image: AppAssets.beverages,
      quantity: '1',
    ),
    Basket(
      name: 'Banana',
      price: '2.00',
      image: AppAssets.beverages,
      quantity: '2',
    ),
    Basket(
      name: 'Orange',
      price: '3.00',
      image: AppAssets.beverages,
      quantity: '3',
    ),
    Basket(
      name: 'Strawberry',
      price: '4.00',
      image: AppAssets.beverages,
      quantity: '4',
    ),
    Basket(
      name: 'Watermelon',
      price: '5.00',
      image: AppAssets.beverages,
      quantity: '5',
    ),
  ];

  static addToBasket(Basket basket) {
    if (basketList.contains(basket)) {
      // update quantity
      for (var element in basketList) {
        if (element.name == basket.name) {
          element.quantity = (int.parse(element.quantity) + 1).toString();
        }
      }
    } else {
      basketList.add(basket);
    }
  }

  static removeFrom(Basket basket) {
    if (basketList.contains(basket)) {
      // update quantity
      for (var element in basketList) {
        if (element.name == basket.name) {
          element.quantity = (int.parse(element.quantity) - 1).toString();
          if (element.quantity == '0') {
            basketList.remove(element);
          }
        }
      }
    }
  }

  static clearBasket() {
    basketList.clear();
  }

  static double getTotalPrice() {
    double totalPrice = 0;
    for (var element in basketList) {
      totalPrice += double.parse(element.price) * int.parse(element.quantity);
    }
    return totalPrice;
  }

  static int getTotalQuantity() {
    int totalQuantity = 0;
    for (var element in basketList) {
      totalQuantity += int.parse(element.quantity);
    }
    return totalQuantity;
  }

  // delete a basket
  static deleteBasket(Basket basket) {
    basketList.remove(basket);
  }
}
