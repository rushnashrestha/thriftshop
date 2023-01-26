import 'package:flutter/material.dart';
import 'package:thrift/pages/checkout.dart';
import 'package:thrift/pages/detail.dart';
import 'package:thrift/pages/home_page.dart';

class CartPage extends StatefulWidget {
  final double price;
  final String name;
  final String image;
  CartPage({required this.name, required this.image, required this.price});
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int count = 1;

  Widget _buildSingleCart() {
    return Container(
      height: 150,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Container(
                  height: 130,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("images/${widget.image}"),
                    ),
                  ),
                ),
                Container(
                  height: 140,
                  width: 200,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.name),
                        //Text("Cloth"),
                        Text(
                          "Rs.${widget.price.toString()}",
                          style: TextStyle(
                            color: Color(0xFF4C53A5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 99, 108, 209),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              GestureDetector(
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white70,
                                ),
                                onTap: () {
                                  setState(() {
                                    if (count > 1) {
                                      count--;
                                    }
                                  });
                                },
                              ),
                              Text(
                                count.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white70,
                                ),
                              ),
                              GestureDetector(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white70,
                                ),
                                onTap: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => CheckOut(
                      name: widget.name,
                      image: widget.image,
                      price: widget.price)));
            },
            child: Text('Continue'),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF4C53A5),
              textStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold),
            )),
      ),
      appBar: AppBar(
        title: Text(
          "Cart Page",
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
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
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.white70,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          _buildSingleCart(),
          _buildSingleCart(),
          _buildSingleCart(),
        ],
      ),
    );
  }
}
