import 'package:flutter/material.dart';
import 'package:shop_app/models/cart_attr.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartAttr> _cartItems = {};

  Map<String, CartAttr> get cartItems {
    return _cartItems;
  }

  double cartTotal() {
    double total = 0.0;
    _cartItems.forEach((key, value) {
      total = total + (value.quantity * value.price);
    });
    return total;
  }

  void addOneItemCart(
      String productId, String title, double price, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingItem) => CartAttr(
              id: existingItem.id,
              title: existingItem.title,
              quantity: existingItem.quantity + 1,
              price: existingItem.price,
              imageUrl: existingItem.imageUrl));
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => CartAttr(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price,
              imageUrl: imageUrl));
    }
    notifyListeners();
  }

  void removeOneItemCart(
      String productId, String title, double price, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingItem) => CartAttr(
              id: existingItem.id,
              title: existingItem.title,
              quantity: existingItem.quantity - 1,
              price: existingItem.price,
              imageUrl: existingItem.imageUrl));
    }
  }

  void removeItemFromCart(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.remove(productId);
    }
    notifyListeners();
  }

  void removeCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
