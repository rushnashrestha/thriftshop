import 'package:flutter/material.dart';
import 'package:thrift/pages/home_page.dart';
import 'package:thrift/widgets/esewa.dart';
import 'package:thrift/widgets/khalti.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment",
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
        margin: EdgeInsets.all(10),
        child: Container(
          //height: 5,
          //width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                child: Text('Esewa'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF4C53A5),
                  textStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 25,
                  ),
                  side: BorderSide(
                      width: 1, color: Colors.white70.withOpacity(0.5)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => EsewaPage()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text('Khalti'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF4C53A5),
                  textStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 25,
                  ),
                  side: BorderSide(
                      width: 1, color: Colors.white70.withOpacity(0.5)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Khalti()));
                },
              ),
              SizedBox(
                height: 30,
              ),
              Image(image: AssetImage("images/pay.jpg")),
            ],
          ),
        ),
      ),
    );
  }
}
