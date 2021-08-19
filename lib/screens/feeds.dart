import 'package:flutter/material.dart';
import 'package:shop_app/consts/my_icons.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/provider/products_provider.dart';
import 'package:shop_app/screens/bottom_bar.dart';
import 'package:shop_app/screens/feeds_product.dart';
import 'package:provider/provider.dart';

class Feeds extends StatelessWidget {
  static const routeName = '/Feeds';

  @override
  Widget build(BuildContext context) {
    ProductsProvider products = Provider.of<ProductsProvider>(context);

    List<Product> productsList = products.products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              icon: Icon(MyAppIcons.home),
              onPressed: () {
                Navigator.pushNamed(context, BottomBar.routeName);
              })
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10, left: 0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 220 / 400,
          children: List.generate(productsList.length, (index) {
            return FeedsProduct(
              feedProduct: productsList[index],
            );
          }),
        ),
      ),
    );
  }
}
