import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart_provider.dart';
import 'package:shop_app/provider/wish_provider.dart';
import 'package:shop_app/screens/product_detail.dart';

class WishFull extends StatelessWidget {
  final String id;
  final String item;
  final double price;
  final String imageUrl;

  WishFull({this.id, this.item, this.price, this.imageUrl});

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

    return InkWell(
      onTap: () {
        wishProvider.removeCart();
        Navigator.of(context).pushNamed(ProductDetail.routeName, arguments: id);
      },
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(border: Border.all(), color: Colors.blue),
        width: double.infinity,
        height: 130,
        child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 130,
                child: ClipRRect(
                  //borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image(
                    height: 230,
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 5),
                color: Colors.blue,
                width: 180,
                child: Column(children: [
                  Row(
                    children: [
                      Text(
                        item,
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          _showDialog(context, 'Remove cart',
                              'You are about to delete all the wish items');
                        },
                        child: Icon(
                          Icons.clear_rounded,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                          //fontSize: 8,
                          fontWeight: FontWeight.w900,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Rs. ${price}",
                        style: TextStyle(
                            //fontSize: 8,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ]),
      ),
    );
  }
}
