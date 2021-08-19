import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/consts/colors.dart';
import 'package:shop_app/consts/my_icons.dart';
import 'package:shop_app/provider/dark_theme_provider.dart';

import 'bottom_bar.dart';
import 'feeds.dart';

class CartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              icon: Icon(MyAppIcons.home),
              onPressed: () {
                Navigator.pushNamed(context, BottomBar.routeName);
              })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Image(
              image: AssetImage("assets/images/emptycart.png"),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Cart is Empty",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Looks like you have not selected any items",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: themeProvider.isDarkTheme
                    ? Colors.grey
                    : ColorsConsts.subTitle),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .6,
            height: MediaQuery.of(context).size.height * .06,
            child: RaisedButton(
              color: Colors.redAccent,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(Feeds.routeName);
              },
              child: Text(
                "Shop Now",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
