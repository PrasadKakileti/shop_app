import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/consts/my_icons.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/provider/cart_provider.dart';
import 'package:shop_app/provider/products_provider.dart';
import 'package:shop_app/provider/wish_provider.dart';
import 'package:shop_app/screens/bottom_bar.dart';
import 'package:shop_app/screens/cart.dart';
import 'package:shop_app/screens/feeds.dart';
import 'package:shop_app/screens/feeds_product.dart';
import 'package:shop_app/screens/wish.dart';

class ProductDetail extends StatefulWidget {
  static const routeName = '/ProductDetail';

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    String productId = ModalRoute.of(context).settings.arguments.toString();
    print("Product detail ID : " + productId);

    ProductsProvider products = Provider.of<ProductsProvider>(context);

    List<Product> productsList = products.products;

    Product productDetails = products.productInfo(productId);

    print(productDetails.title);

    CartProvider cartProvider = Provider.of<CartProvider>(context);
    WishProvider wishProvider = Provider.of<WishProvider>(context);

    print(productDetails.imageUrl);
    print(productDetails.description);

    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        actions: [
          IconButton(
            icon: Icon(MyAppIcons.cart),
            tooltip: 'Cart',
            onPressed: () {
              Navigator.of(context).pushNamed(Cart.routeName);
            },
          ),
          IconButton(
            icon: Icon(MyAppIcons.heart),
            tooltip: 'Wish List',
            onPressed: () {
              Navigator.of(context).pushNamed(Wish.routeName);
            },
          ),
          IconButton(
            icon: Icon(MyAppIcons.home),
            tooltip: 'Wish List',
            onPressed: () {
              Navigator.of(context).pushNamed(BottomBar.routeName);
            },
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              child: Image(
                image: NetworkImage(productDetails.imageUrl),
                // fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
//            crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 200,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Icon(Icons.save),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        child: Icon(Icons.share),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Container(
                  color: Colors.transparent,
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productDetails.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "Price : " + productDetails.price.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    productDetails.description,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Brand :" + productDetails.brand,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "Category :" + productDetails.productCategoryName,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "Quantity :" + productDetails.quantity.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "Popularity :" + productDetails.isPopular.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Container(
                  child: Text(
                    "Reviews :",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 320,
                  child: ListView.builder(
                    itemCount: productsList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return FeedsProduct(feedProduct: productsList[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: RaisedButton(
                      child: Text("Add Cart"),
                      color: Colors.red,
                      onPressed: () {
                        cartProvider.addOneItemCart(
                            productId,
                            productDetails.title,
                            productDetails.price,
                            productDetails.imageUrl);
                      }),
                ),
                Expanded(
                  flex: 2,
                  child: RaisedButton(
                      child: Text("Buy"),
                      color: Colors.blue,
                      onPressed: () {}),
                ),
                Expanded(
                  flex: 1,
                    child: RaisedButton(
                      // highlightColor: Colors.red,
                        //borderRadius: BorderRadius.circular(20),
                        child: Icon(MyAppIcons.heart),
                        onPressed: () {
                          wishProvider.addOneItemWish(
                              productId,
                              productDetails.title,
                              productDetails.price,
                              productDetails.imageUrl);
                        }),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
