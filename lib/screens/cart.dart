import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/consts/my_icons.dart';
import 'package:shop_app/provider/cart_provider.dart';
import 'package:shop_app/screens/cart_empty.dart';
import 'package:shop_app/screens/cart_full.dart';

import 'bottom_bar.dart';

class Cart extends StatelessWidget {
  static const routeName = '/Cart';

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    void _showDialog(BuildContext context, String title, String message) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
                FlatButton(
                  onPressed: () {
                    cartProvider.removeCart();
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          });
    }

    return cartProvider.cartItems.isEmpty
        ? CartEmpty()
        : Scaffold(
            bottomSheet: checkoutSection(context),
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text(
                "Cart items count",
              ),
              actions: [
                IconButton(
                    icon: Icon(MyAppIcons.trash),
                    onPressed: () {
                      _showDialog(context, 'Remove cart',
                          'You are about to delete all the cart items');
                      //cartProvider.removeCart();
                    }),
                IconButton(
                    icon: Icon(MyAppIcons.home),
                    onPressed: () {
                      Navigator.pushNamed(context, BottomBar.routeName);
                    })
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 65),
              child: ListView.builder(
                  itemCount: cartProvider.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartFull(
                      productId: cartProvider.cartItems.keys.toList()[index],
                      title:
                          cartProvider.cartItems.values.toList()[index].title,
                      quantity: cartProvider.cartItems.values
                          .toList()[index]
                          .quantity,
                      price:
                          cartProvider.cartItems.values.toList()[index].price,
                      imageUrl: cartProvider.cartItems.values
                          .toList()[index]
                          .imageUrl,
                    );
                  }),
            ));
  }

  Widget checkoutSection(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      height: 66,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
        color: Colors.grey,
        width: 1,
      ))),
      child: Container(
        margin: EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.redAccent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {},
                  child: Text(
                    "Check Out",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              "Total : ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
            Text(
              "\u20B9 " + cartProvider.cartTotal().toStringAsFixed(2),
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
