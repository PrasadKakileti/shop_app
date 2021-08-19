import 'package:flutter/material.dart';
import 'package:shop_app/consts/my_icons.dart';
import 'package:shop_app/main.dart';
import 'package:shop_app/screens/cart.dart';
import 'package:shop_app/screens/feeds.dart';
import 'package:shop_app/screens/home.dart';
import 'package:shop_app/screens/search.dart';
import 'package:shop_app/screens/user_info.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/BottomBar';
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List pages = [
    {
      'page' : Home(),
      'title' : "Home Page",
    },
    {
      'page' : Feeds(),
      'title' : "Feeds Page",
    },
    {
      'page' : Search(),
      'title' : "Search Page",
    },
    {
      'page' : Cart(),
      'title' : "Cart Page",
    },
    {
      'page' : UserInfo(),
      'title' : "User Info Page",
    }
  ];

  var selectedIndex = 0;

  void answerSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(pages[selectedIndex]['title']),
      //   centerTitle: true,
      //   backgroundColor: Colors.green,
      // ),
      body: pages[selectedIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        elevation: 10,
        notchMargin: 6,
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.black, width: 1.0))),
          child: BottomNavigationBar(
            elevation: 10,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).textSelectionColor,
            selectedItemColor: Colors.purple,
            currentIndex: selectedIndex,
            onTap: answerSelected,
            items: [
              BottomNavigationBarItem(icon: new Icon(MyAppIcons.home), title: Text("Home")),
              BottomNavigationBarItem(icon: new Icon(MyAppIcons.rss), title: Text("Feeds")),
              BottomNavigationBarItem(icon: new Icon(null), title: Text("Search")),
              BottomNavigationBarItem(icon: new Icon(MyAppIcons.bag), title: Text("Cart")),
              BottomNavigationBarItem(icon: new Icon(MyAppIcons.user), title: Text("User")),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () => {
          setState(() {
            selectedIndex = 2;
          })
        },
      ),
    );
  }
}
