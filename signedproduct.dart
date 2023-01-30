// import 'dart:ffi';

import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  final double price;
  final String name;
  SingleProduct({
    required this.image,
    required this.price,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            height: 250,
            width: 160,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 180,
                    width: 190,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/$image"),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Rs. ${price.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black38),
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
