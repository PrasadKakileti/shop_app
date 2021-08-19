import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Category extends StatelessWidget {
  final int index;

  Category(this.index);

  List categoryImageList = [
    {
      'title': "Shoes",
      'imgPath': "assets/images/CatShoes.jpg",
    },
    {
      'title': "Phones",
      'imgPath': "assets/images/CatPhones.png",
    },
    {
      'title': "Watches",
      'imgPath': "assets/images/CatWatches.jpg",
    },
    {
      'title': "Laptops",
      'imgPath': "assets/images/CatLaptops.png",
    },
    {
      'title': "Furniture",
      'imgPath': "assets/images/CatFurniture.jpg",
    },
    {
      'title': "Clothes",
      'imgPath': "assets/images/CatClothes.jpg",
    },
    {
      'title': "Beauty",
      'imgPath': "assets/images/CatBeauty.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
          return categoryItem();
  }

  Widget categoryItem() {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(border: Border.all(), color: Colors.blue),
      width: 150,
      height: 180,
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 150,
            height: 150,
            child: ClipRRect(
              //borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage(categoryImageList[index]['imgPath']),
                // NetworkImage(
                //     "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80"),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 10,
            right: 10,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                categoryImageList[index]['title'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
