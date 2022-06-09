import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:investment_analatyca_testthree/main.dart';

import 'package:investment_analatyca_testthree/screens/resetpassword.dart';

import 'signup.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

// ignore: camel_case_types
class _loginPageState extends State<loginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _Formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFDEE3E1),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 20, 2, 20),
        child: SingleChildScrollView(
          child: Form(
            key: _Formkey,
            child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/images/stock.png'),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Welcome to',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black54),
                ),
                Text(
                  'Investment Analytica!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    shadows: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            prefixIcon: Icon(Icons.email),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ('Please enter your email ');
                            }
                            //reg expression for email validation
                            if (!RegExp(
                                    "^[a-zA-z0-9+_.-]+@[a-zA-z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ('Please enter a valid email');
                            }
                            return null;
                          },
                          onSaved: (value) {
                            emailController = value as TextEditingController;
                          },
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            prefixIcon: Icon(Icons.vpn_key),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            RegExp regx = RegExp(
                                r'^.{6,}$'); //at least 6 digit of password
                            if (value!.isEmpty) {
                              return ("Password is required to login");
                            }
                            if (!regx.hasMatch(value)) {
                              return ("Please enter valid password (Min.6 char)");
                            }
                          },
                          onSaved: (value) {
                            passwordController = value as TextEditingController;
                          },
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      SizedBox(
                        width: 325,
                        height: 40,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            //maximumSize: const Size(16.0, 16.0),
                            backgroundColor: const Color(0XFFE8E3FD),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 18,
                              //color: color,
                            ),
                          ),
                          onPressed: () {
                            signIn(
                                emailController.text, passwordController.text);

                            setState(() {});
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Dont have an account ?',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          InkWell(
                            onTap: () {
                              print("sign up clicked");
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SignUpPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ResetPassword()),
                          );
                        },
                        child: const Text(
                          'Forget password?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //login function
  void signIn(String email, String password) async {
    if (_Formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => MyBottomNavigationBar(),
                ))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
