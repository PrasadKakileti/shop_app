import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart_provider.dart';
import 'package:shop_app/screens/product_detail.dart';

class CartFull extends StatelessWidget {
  final String productId;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  CartFull(
      {this.productId, this.title, this.quantity, this.price, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(ProductDetail.routeName,arguments: productId);
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.w900),
                        maxLines: 2,
                        //overflow: Overflow.clip,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          cartProvider.removeItemFromCart(productId);
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
                        price.toString(),
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
                  Row(
                    children: [
                      Text(
                        "Sub Total",
                        style: TextStyle(
                          //fontSize: 8,
                          fontWeight: FontWeight.w900,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        (price * quantity).toStringAsFixed(2),
                        style: TextStyle(
                          //fontSize: 8,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
//                      color: Colors.red,
                        width: 30,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            cartProvider.removeOneItemCart(productId, title, price, imageUrl);
                          },
                          child: Text(
                            "-",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.amberAccent,
                        width: 30,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
                          child: Text(
                            quantity.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            cartProvider.addOneItemCart(productId, title, price, imageUrl);
                          },
                          child: Text(
                            "+",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
