import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  final int index;

  PopularProducts(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        height: 180,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black),),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 240,
              height: 120,
              child: ClipRRect(
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1483478550801-ceba5fe50e8e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80'),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Title", style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: Colors.blue),),
                  SizedBox(height: 3,),
                  Text("Brand", style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: Colors.blue),),
                  SizedBox(height: 3,),
                  Text("Price: 250", style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: Colors.red),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
