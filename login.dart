import 'package:flutter/material.dart';
import 'package:thrift/pages/authService.dart';
import 'package:thrift/pages/home_page.dart';
import 'package:thrift/pages/sign_in.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
void validation() {
  final FormState? _form = _formKey.currentState;
  if (_form!.validate()) {
    print("Yes");
  } else {
    print("No");
  }
}

bool obserText = true;

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.black12],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
              image: DecorationImage(
                image: AssetImage('images/thrift.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
              ),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 300,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == "") {
                              return "Please fill email";
                            } else if (!regExp.hasMatch(value!)) {
                              return "Email is invalid";
                            }
                          },
                          style: TextStyle(color: Colors.white70),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.white70.withOpacity(0.5)),
                              ),
                              hintText: "Email",
                              suffixIcon: Icon(
                                Icons.mail,
                                color: Colors.white70,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.white70,
                              )),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: obserText,
                          validator: ((value) {
                            if (value == "") {
                              return "Please fill password";
                            } else if (value != null && value.isEmpty) {
                              if (value.length < 8) {
                                return "Password is too short";
                              }
                            }
                          }),
                          style: TextStyle(color: Colors.white70),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.white70.withOpacity(0.5)),
                              ),
                              hintText: "Password",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  setState(() {
                                    obserText = !obserText;
                                  });
                                },
                                child: Icon(
                                  obserText == true
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white70,
                                ),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.white70,
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 45,
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Text('Log In'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              textStyle: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                              side: BorderSide(
                                  width: 1,
                                  color: Colors.white70.withOpacity(0.5)),
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () async {
                              final message = await AuthService().login(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                              if (message!.contains('Success')) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(message),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Don\'t have an account?",
                              style: TextStyle(color: Colors.white70),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => SignIn()));
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.cyan,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
