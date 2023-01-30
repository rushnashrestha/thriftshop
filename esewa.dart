import 'package:flutter/material.dart';
import 'package:thrift/pages/payment.dart';

class EsewaPage extends StatelessWidget {
  const EsewaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "eSewa",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => PaymentPage()));
          },
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("images/esewa.jpg"),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Thank You for the payment!",
                style: TextStyle(
                  color: Color(0xFF4C53A5),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
