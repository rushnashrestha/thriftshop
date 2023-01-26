import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:thrift/pages/home_page.dart';
import 'package:thrift/widgets/signedproduct.dart';

class ListProduct extends StatelessWidget {
  final String name;
  ListProduct({required this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4C53A5),
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white70,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()));
            }),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white70,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.white70,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          child: ListView(
            children: <Widget>[
              Container(
                height: 40,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 700,
                child: GridView.count(
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    SingleProduct(
                      name: "Jordan",
                      price: 3600,
                      image: "1.png",
                    ),
                    SingleProduct(
                        name: "Long-sleeve Shirt", price: 1000, image: "2.png"),
                    SingleProduct(
                      name: "Oversized T-shirt",
                      price: 250,
                      image: "3.png",
                    ),
                    SingleProduct(
                        name: "White Pant", price: 1100, image: "5.png"),
                    SingleProduct(
                      name: "Blue Jeans",
                      price: 1050,
                      image: "6.png",
                    ),
                    SingleProduct(
                        name: "Puf Jacket", price: 2200, image: "8.png"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
