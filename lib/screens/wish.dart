import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/consts/my_icons.dart';
import 'package:shop_app/provider/wish_provider.dart';
import 'package:shop_app/screens/wish.dart';
import 'package:shop_app/screens/wish_full.dart';
import 'package:shop_app/screens/wish_empty.dart';

class Wish extends StatelessWidget {
  static const routeName = '/Wish';

  @override
  Widget build(BuildContext context) {
    WishProvider wishProvider = Provider.of<WishProvider>(context);

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
                      wishProvider.removeCart();
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  ),
                ]);
          });
    }

    return wishProvider.wishItems.isEmpty
        ? WishEmpty()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              // backgroundColor: Colors.green,
              title: Text(
                "Wishlist items ${wishProvider.wishItems.length}",
              ),
              actions: [
                IconButton(
                    icon: Icon(MyAppIcons.trash),
                    onPressed: () {
                      _showDialog(context, 'Remove cart',
                          'You are about to delete all the cart items');
                      // wishProvider.removeCart();
                    })
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 15, top: 15),
              child: ListView.builder(
                  itemCount: wishProvider.wishItems.length,
                  itemBuilder: (context, index) {
                    return WishFull(
                      id: wishProvider.wishItems.keys.toList()[index],
                      item: wishProvider.wishItems.values.toList()[index].item,
                      price:
                          wishProvider.wishItems.values.toList()[index].price,
                      imageUrl: wishProvider.wishItems.values
                          .toList()[index]
                          .imageUrl,
                    );
                  }),
            ));
  }
}
