import 'package:flutter/material.dart';
import 'package:thrift/pages/authService.dart';
import 'package:thrift/pages/home_page.dart';
import 'package:thrift/pages/login.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _SignInState extends State<SignIn> {
  void validation() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print("Yes");
    } else {
      print("No");
    }
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
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
                children: <Widget>[
                  Container(
                    height: 220,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 400,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "Please fill username";
                            } else if (value != null && value.isEmpty) {
                              if (value.length < 6) {
                                return "Username is too short";
                              }
                            } else if (value == "") {
                              return "Please fill username";
                            }
                          },
                          style: TextStyle(color: Colors.white70),
                          decoration: InputDecoration(
                            hintText: "UserName",
                            hintStyle: TextStyle(color: Colors.white70),
                            suffixIcon: Icon(
                              Icons.person_outlined,
                              color: Colors.white70,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white70.withOpacity(0.5)),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _emailController,
                          validator: ((value) {
                            if (value == "") {
                              return "Please fill email";
                            } else if (!regExp.hasMatch(value!)) {
                              return "Email is incorrect";
                            }
                          }),
                          style: TextStyle(color: Colors.white70),
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.white70),
                            suffixIcon: Icon(
                              Icons.mail,
                              color: Colors.white70,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white70.withOpacity(0.5)),
                            ),
                          ),
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
                            hintText: "Password",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obserText = !obserText;
                                });
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(
                                obserText == true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white70,
                              ),
                            ),
                            hintStyle: TextStyle(color: Colors.white70),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white70.withOpacity(0.5)),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: ((value) {
                            if (value == "") {
                              return "Please fill phone number";
                            } else if (value != null && value.isEmpty) {
                              if (value.length < 10) {
                                return "Phone number must be 10";
                              }
                            }
                          }),
                          style: TextStyle(color: Colors.white70),
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            hintStyle: TextStyle(color: Colors.white70),
                            suffixIcon: Icon(
                              Icons.phone,
                              color: Colors.white70,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white70.withOpacity(0.5)),
                            ),
                          ),
                        ),
                        Container(
                          height: 45,
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Text('Register'),
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
                              final message = await AuthService().registration(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                              if (message == 'Success') {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(message!),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "I have an Account !",
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: Text(
                                " Log In",
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
