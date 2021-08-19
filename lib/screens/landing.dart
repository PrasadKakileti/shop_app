import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shop_app/screens/bottom_bar.dart';

import 'auth/login.dart';
import 'auth/signup.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //SizedBox(height: 30,),
        CachedNetworkImage(
          imageUrl:
              "https://media.istockphoto.com/photos/man-at-the-shopping-picture-id868718238?k=6&m=868718238&s=612x612&w=0&h=ZUPCx8Us3fGhnSOlecWIZ68y3H4rCiTnANtnjHk0bvo=",
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              child: Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: Text(
                "You are visting world\'s best store!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Login.routeName);
                  },
                  child: Row(
                    children: [
                      Text("Login"),
                      Icon(Icons.person),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Signup.routeName);
                  },
                  child: Row(
                    children: [
                      Text("Sign Up"),
                      Icon(Icons.person),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 2,
                    color: Colors.red,
                    height: 2,
                  ),
                ),
                Expanded(
                  child: Text(
                    " Or Join with ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 2,
                    color: Colors.red,
                    height: 2,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    'Google + ',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(BottomBar.routeName);
                  },
                  child: const Text(
                    'Guest',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    ));
  }
}
