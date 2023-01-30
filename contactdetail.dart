import 'package:flutter/material.dart';
import 'package:thrift/pages/home_page.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Us",
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
              Image(
                image: AssetImage("images/logo.png"),
                height: 100,
                width: double.infinity,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Color(0xFF4C53A5),
                      size: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Tel Number: ",
                      style: TextStyle(
                          color: Color(0xFF4C53A5),
                          fontSize: 15,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "01-4757627",
                      style: TextStyle(
                          color: Color(0xFF4C53A5),
                          fontSize: 17,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.mobile_screen_share_outlined,
                      color: Color(0xFF4C53A5),
                      size: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Mobile Number: ",
                      style: TextStyle(
                          color: Color(0xFF4C53A5),
                          fontSize: 15,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "+977-9867567213",
                      style: TextStyle(
                          color: Color(0xFF4C53A5),
                          fontSize: 17,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.facebook,
                      color: Color(0xFF4C53A5),
                      size: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Facebook: ",
                      style: TextStyle(
                          color: Color(0xFF4C53A5),
                          fontSize: 15,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "facebook.com/thriftshop",
                      style: TextStyle(
                          color: Color(0xFF4C53A5),
                          fontSize: 17,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/instagram.png"),
                      height: 15,
                      color: Color(0xFF4C53A5),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Instagram: ",
                      style: TextStyle(
                          color: Color(0xFF4C53A5),
                          fontSize: 15,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "thift_shop(men)",
                      style: TextStyle(
                          color: Color(0xFF4C53A5),
                          fontSize: 17,
                          fontStyle: FontStyle.italic),
                    ),
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
