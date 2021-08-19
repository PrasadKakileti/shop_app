import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/consts/my_icons.dart';
import 'package:shop_app/provider/dark_theme_provider.dart';
import 'package:shop_app/screens/wish.dart';

import 'bottom_bar.dart';
import 'cart.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool _switchValue = false;


  @override
  Widget build(BuildContext context) {

    var themeProvider = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              icon: Icon(MyAppIcons.home),
              onPressed: () {
                Navigator.pushNamed(context, BottomBar.routeName);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 70),
            ),
            userTile("User Information"),
            Divider(thickness: 2, color: Colors.grey),
            userListTile("Wish List", "", 0, Feather.arrow_right, context,() {
      navigateRoute(context, Wish.routeName);}),
            userListTile("Cart", "", 1, Feather.arrow_right, context, () {
            navigateRoute(context, Cart.routeName);}),
            userTile("User Information"),
            Divider(thickness: 2, color: Colors.grey),
            userListTile("Title", "subTitle", 0, null, context, (){}),
            userListTile("Phone Number", "9948918523", 1, null, context, (){}),
            userListTile("Shipping Address", "H-No:1-72,Apparaopeta", 2, null, context, (){}),
            userListTile("Joining Date", "date", 3, null, context, (){}),
            userTile("User Settings"),
            Divider(thickness: 2, color: Colors.grey,),
            ListTileSwitch(
              value: themeProvider.isDarkTheme,
              leading: const Icon(Ionicons.md_moon),
              onChanged: (value) {
                setState(() {
                  themeProvider.darkTheme = value;
                });
              },
              switchActiveColor: Colors.indigo,
              title: const Text("Dark Theme"),),
            userListTile("Log Out", "", 4, null, context, (){}),
          ],
        ),
      ),
    );
  }

  List iconData = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app,
  ];

  Widget userTile(String heading) {
    return Text(
      heading, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),);
  }

  void navigateRoute(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }


  Widget userListTile(String title, String subTitle, int index, IconData trailingIcon,
      BuildContext context, Function fct) {
    return Material(
      child: InkWell(
        splashColor: Theme
            .of(context)
            .splashColor,
        child: ListTile(
         tileColor: Theme.of(context).primaryColor,
          onTap: fct,
          title: Text(title),
          subtitle: Text(subTitle),
          leading: Icon(iconData[index]),
          trailing: Icon(trailingIcon),
        ),
      ),
    );
  }

}
