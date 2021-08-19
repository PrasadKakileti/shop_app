import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/consts/theme_data.dart';
import 'package:shop_app/provider/cart_provider.dart';
import 'package:shop_app/provider/dark_theme_provider.dart';
import 'package:shop_app/provider/products_provider.dart';
import 'package:shop_app/provider/wish_provider.dart';
import 'package:shop_app/screens/auth/login.dart';
import 'package:shop_app/screens/auth/signup.dart';
import 'package:shop_app/screens/bottom_bar.dart';
import 'package:shop_app/screens/cart.dart';
import 'package:shop_app/screens/feeds.dart';
import 'package:shop_app/screens/home.dart';
import 'package:shop_app/screens/landing.dart';
import 'package:shop_app/screens/product_detail.dart';
import 'package:shop_app/screens/wish.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  DarkThemeProvider changeThemeProvider = DarkThemeProvider();

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('Error occurred'),
                ),
              ),
            );
          }
          return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) {
                  return changeThemeProvider;
                }),
                ChangeNotifierProvider(create: (_) => ProductsProvider()),
                ChangeNotifierProvider(create: (_) => CartProvider()),
                ChangeNotifierProvider(create: (_) => WishProvider()),
              ],
              child: Consumer<DarkThemeProvider>(
                  builder: (context, themeData, Child) {
                return MaterialApp(
                  title: "Flutter Demo",
                  theme: Styles.themeData(
                      changeThemeProvider.isDarkTheme, context),
                  home: Landing(),
                  //BottomBar(),
                  //initialRoute: '/',
                  routes: {
                    BottomBar.routeName: (ctx) => BottomBar(),
                    Login.routeName: (ctx) => Login(),
                    Signup.routeName: (ctx) => Signup(),
                    Home.routeName: (ctx) => Home(),
                    Cart.routeName: (ctx) => Cart(),
                    Feeds.routeName: (ctx) => Feeds(),
                    ProductDetail.routeName: (ctx) => ProductDetail(),
                    Wish.routeName: (ctx) => Wish(),
                  },
                );
              }));
        });
  }
}
