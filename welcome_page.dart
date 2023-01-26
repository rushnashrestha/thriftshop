import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/man.png"),
                  ),
                ),
              ),
              Text(
                "WELCOME",
                style: TextStyle(
                  color: Color(0xFF4C53A5),
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              Container(
                height: 200,
                width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Ready to Start Shopping Sign Up",
                      style: TextStyle(
                        color: Color(0xFF4C53A5),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "To get Started",
                      style: TextStyle(
                        color: Color(0xFF4C53A5),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text('Sign Up'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF4C53A5).withOpacity(0.5),
                          textStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                          ),
                          side: BorderSide(
                              width: 1, color: Colors.white70.withOpacity(0.5)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(
                          //     builder: (context) => CartPage(
                          //         name: widget.name,
                          //         image: widget.image,
                          //         price: widget.price)));
                        },
                      ),
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
