import 'package:flutter/material.dart';

//import 'package:shop_app/models/cart_attr.dart';
import 'package:shop_app/models/wish_attr.dart';

class WishProvider with ChangeNotifier {
  Map<String, WishAttr> _wishItems = {};

  Map<String, WishAttr> get wishItems {
    return _wishItems;
  }

  void addOneItemWish(
      String productId, String title, double price, String imageUrl) {
    if (_wishItems.containsKey(productId)) {
    } else {
      _wishItems.putIfAbsent(
          productId,
          () => WishAttr(
              id: DateTime.now().toString(),
              item: title,
              price: price,
              imageUrl: imageUrl));
    }
    notifyListeners();
  }

  void removeItemFromWish(String productId) {
    if (_wishItems.containsKey(productId)) {
      _wishItems.remove(productId);
    }
    notifyListeners();
  }

  void removeCart() {
    _wishItems.clear();
    notifyListeners();
  }
}
