import 'package:flutter/material.dart';
import 'package:thrift/pages/home_page.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
          style: TextStyle(color: Colors.white70),
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
      ),
      body: Container(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10)),
              Text(
                "The thrift shop is a second-hand retail shop. This online shop focuses on men. We sell clothes for men only. Customers can buy gently used clothing at a discounted price, as well as they can sell their clothes.",
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF4C53A5),
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 50,
              ),
              Image(
                image: AssetImage("images/clothes.jpg"),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "* Happy Shopping *",
                style: TextStyle(
                  color: Color(0xFF4C53A5),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
