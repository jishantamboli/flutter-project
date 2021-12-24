import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project1/utils/routes.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;
  String? username;
  String? password;
  final _FormKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_FormKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 01));
      await Navigator.pushNamed(context, MyRoutes.HomeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  var signstyle =
      TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold);
  var defaulttextstyle = TextStyle(color: Colors.grey);
  var linktext = TextStyle(
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Form(
          key: _FormKey,
          child: Column(
            children: [
              Image.asset("assets/images/hey.png", fit: BoxFit.cover),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      validator: (Uservalue) {
                        if (Uservalue == null || Uservalue.isEmpty) {
                          return "Username cannot be empty";
                        } else if (Uservalue == null || Uservalue.length < 1) {
                          return "Username length should be atleast 4 ";
                        } else if (Uservalue != "jishan") {
                          return "Wrong Username";
                        }
                        // return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password Length should be atleast 6";
                        } else if (value != "jishan") {
                          return "Wrong Password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Material(
                      color: Colors.red,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 20 : 15),
                      child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50 : 120,
                            height: 40,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          )),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text("Or"),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, MyRoutes.SignUpRoute);
                          },
                          child: Text(
                            "SignUp",
                            style: signstyle,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
