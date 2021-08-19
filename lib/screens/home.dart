import 'package:backdrop/app_bar.dart';
import 'package:backdrop/button.dart';
import 'package:backdrop/scaffold.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shop_app/consts/my_icons.dart';
import 'package:shop_app/screens/cart.dart';
import 'package:shop_app/screens/feeds.dart';
import 'package:shop_app/screens/popular_products.dart';

import 'category.dart';

class Home extends StatelessWidget {
  static const routeName = '/Home';

  final List<String> imgList = [
    'assets/images/carousel1.png',
    'assets/images/carousel2.jpeg',
    'assets/images/carousel3.jpg',
    'assets/images/carousel4.png'
  ];

  final List<String> brandImgList = [
    'assets/images/Dell.jpg',
    'assets/images/addidas.jpg',
    'assets/images/apple.jpg',
    'assets/images/h&m.jpg',
    'assets/images/Huawei.jpg',
    'assets/images/nike.jpg',
    'assets/images/samsung.jpg',
  ];

  void navigateRoute(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  Widget menuItem(String title, IconData iconName, Function fct) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 50),
        InkWell(
          onTap: fct,
          child: Icon(iconName),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      home: BackdropScaffold(
        backLayerBackgroundColor: Colors.black26,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: BackdropAppBar(
          title: Text("Shop Home"),
          leading: BackdropToggleButton(
            icon: AnimatedIcons.menu_home,
          ),
          actions: <Widget>[
            Icon(Icons.logout),
          ],
        ),
        backLayer: Container(
          height: MediaQuery.of(context).size.height * .5,
          width: 240,
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              menuItem("Feeds", MyAppIcons.rss, () {
                navigateRoute(context, Feeds.routeName);
              }),
              SizedBox(height: 20),
              menuItem("Cart", MyAppIcons.bag, () {
                navigateRoute(context, Cart.routeName);
              }),
              SizedBox(height: 20),
              menuItem("Wishlist", MyAppIcons.heart, () {
                navigateRoute(context, Feeds.routeName);
              }),
              SizedBox(height: 20),
              menuItem("Upload Product", MyAppIcons.upload, () {
                navigateRoute(context, Feeds.routeName);
              }),
            ],
          ),
        ),
        frontLayer: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 5),
                  ),
                  items: imgList
                      .map((item) => Container(
                            child: Center(
                              child: Image.asset(
                                item,
                                fit: BoxFit.cover,
                                width: 1000,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Text(
                      'Categories',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
              // Category(),
              Container(
                height: 200,
                child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Category(index);
                    }),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Text(
                      'Brands',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "View all",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(),
                  items: brandImgList
                      .map(
                        (item) => Container(
                          child: Center(
                            child: Image.asset(item, fit: BoxFit.cover),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Text(
                      'Popular Products',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "View all",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return PopularProducts(index);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
