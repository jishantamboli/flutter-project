import 'package:NearMe/pages/home_page.dart';
import 'package:NearMe/widget/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:NearMe/utils/routes.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

enum ButtonState { init, loading, done }

var signstyle = TextStyle(
    color: MyTheme.redtheme, fontSize: 15, fontWeight: FontWeight.bold);

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ButtonState state = ButtonState.init;
  bool isDone = true;
  bool changeButton = false;
  // String? username;
  // String? password;
  final _FormKey = GlobalKey<FormState>();
  bool isLoading = true;
  bool isAnimating = true;
  // ButtonState state = ButtonState.init;

  // Future<String?> SignIn(
  //     {required String email, required String Password}) async {
  //   try {
  //     await _firebaseAuth.signInWithEmailAndPassword(
  //         email: email, password: Password);
  //     return "Sign In Successfully";
  //   } on FirebaseAuthException catch (e) {
  //     return e.message;
  //   }
  // }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // moveToHome(BuildContext context) async {
  //   if (_FormKey.currentState!.validate()) {
  //     setState(() {
  //       changeButton = true;
  //     });
  //     await Future.delayed(Duration(seconds: 01));
  //     await Navigator.pushNamed(context, MyRoutes.HomeRoute);
  //     setState(() {
  //       changeButton = false;
  //     });
  //   }
  // }

  String error = "";

  Future<String?> SingIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      await Future.delayed(Duration(seconds: 1));

      Navigator.pushNamed(context(), MyRoutes.HomeRoute);
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = e.message!;
      });
    }
  }

  var signstyle = TextStyle(
      color: MyTheme.redtheme, fontSize: 15, fontWeight: FontWeight.bold);
  var defaulttextstyle = TextStyle(color: Colors.grey);
  var linktext = TextStyle(
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDone = state == ButtonState.done;
    final isStreached = isAnimating || state == ButtonState.init;

    return Material(
        color: Colors.white,
        child: Form(
          key: _FormKey,
          child: Column(
            children: [
              Image.asset("assets/images/hey.png", fit: BoxFit.cover),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                      validator: (Uservalue) {
                        if (Uservalue == null || Uservalue.isEmpty) {
                          return "Username Cannot be empty";
                        } else if (Uservalue.length < 6) {
                          return "Username length should be atleast 6 ";
                        }
                        //  else if (Uservalue != "jishan") {
                        //   return "Wrong Username";
                        // }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        obscureText: true,
                        controller: passwordController,
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(error),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                        width: state == ButtonState.init ? 200 : 70,
                        onEnd: () => setState(() {
                          isAnimating = isAnimating;
                        }),
                        height: 40,
                        child: isStreached
                            ? buildButton()
                            : buildSmallButton(isDone),
                      ),
                    ),
                    // Material(

                    //       child: AnimatedContainer(
                    //         duration: Duration(seconds: 0),
                    //         width: 120,
                    //         height: 40,
                    //         alignment: Alignment.center,
                    //         // child: isLoading
                    //         //     ? Row(
                    //         //         mainAxisAlignment: MainAxisAlignment.center,
                    //         //         children: [
                    //         //           CircularProgressIndicator(
                    //         //             color: Colors.red,
                    //         //           ),
                    //         //           SizedBox(
                    //         //             width: 24,
                    //         //           ),
                    //         //           Text("Please Wait...")
                    //         //         ],
                    //         //       )
                    //         //     : Text(
                    //         //         "Login",
                    //         //         style: TextStyle(
                    //         //             color: Colors.white,
                    //         //             fontWeight: FontWeight.bold,
                    //         //             fontSize: 18),
                    //         //       ),
                    //       )),
                    // ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text("Or"),
                    SizedBox(
                      height: 5.0,
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Container(
                    //     width: 120,
                    //     height: 40,
                    //     decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         border: Border.all(width: 1, color: Colors.grey),
                    //         borderRadius:
                    //             BorderRadius.all(Radius.circular(32))),
                    //     child: TextButton(
                    //         onPressed: () => Navigator.pushNamed(
                    //             context, MyRoutes.HomeRoute),
                    //         child: Text(
                    //           "Skip for now ",
                    //           style: TextStyle(
                    //             color: Colors.grey,
                    //           ),
                    //         ))
                    //     // ElevatedButton(
                    //     //     onPressed: () => HomePage(),
                    //     //     style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(90))),
                    //     //     child: Text(
                    //     //       "Skip for now ",
                    //     //       style: TextStyle(color: Colors.grey,),
                    //     //     )),
                    //     )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
 ButtonState state = ButtonState.init;

Widget buildButton() => OutlinedButton(
    style: OutlinedButton.styleFrom(
      shape: StadiumBorder(),
      side: BorderSide(width: 2, color: MyTheme.redtheme),
    ),
    onPressed: () async {
      setState() {
       state = ButtonState.loading;
      }
      await Future.delayed(Duration(seconds: 2));
    //  setState() => state =  ButtonState.done;
    //   await Future.delayed(Duration(seconds: 2));
    //   setState() => state = ButtonState.init;
    },
    child: Text(
      "Login",
      style: signstyle,
    ));

Widget buildSmallButton(bool isDone) {
  final color = isDone ? Colors.green : MyTheme.redtheme;
  return Container(
    decoration: BoxDecoration(shape: BoxShape.circle, color: MyTheme.redtheme),
    child: Center(
      child: isDone
          ? Icon(
              Icons.done,
              size: 52,
              color: Colors.white,
            )
          : CircularProgressIndicator(
              color: Colors.white,
            ),
    ),
  );
}
