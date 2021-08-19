import 'package:flutter/material.dart';

class WishAttr with ChangeNotifier{
  String id;
  String item;
  double price;
  String imageUrl;

  WishAttr({this.id, this.item, this.price, this.imageUrl});
}