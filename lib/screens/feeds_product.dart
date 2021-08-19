import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/consts/colors.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/product_detail.dart';

class FeedsProduct extends StatefulWidget {
  final Product feedProduct;

  const FeedsProduct({Key key, this.feedProduct}) : super(key: key);

  @override
  _FeedsProductState createState() => _FeedsProductState();
}

class _FeedsProductState extends State<FeedsProduct> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 220,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                child: ClipRRect(
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.feedProduct.imageUrl),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.feedProduct.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      widget.feedProduct.price.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: Colors.red),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Available: 5",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: Colors.blue),
                          ),
                        ),
                        Expanded(
                          flex : 2,
                          child: InkWell(
                            splashColor: Colors.grey,
                            highlightColor: Colors.blue,

                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  ProductDetail.routeName,
                                  arguments: widget.feedProduct.id);
                            },
                            child: Icon(Icons.more_horiz),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
