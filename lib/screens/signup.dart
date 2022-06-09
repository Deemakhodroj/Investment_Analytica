import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:fluttertoast/fluttertoast.dart";
import 'package:investment_analatyca_testthree/main.dart';
import 'package:investment_analatyca_testthree/models/user_model.dart';
import 'package:investment_analatyca_testthree/screens/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _flag8 = true;
  bool _flag9 = true;
  bool _flag10 = true;
  bool _flag11 = true;
  bool _flag12 = true;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reInterPasswordController = TextEditingController();
  final _Formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _Formkey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 2, 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 200,
                  width: 400,
                  child: const Image(
                    height: 30,
                    image: AssetImage(
                      'assets/images/signup.png',
                    ),
                  ),
                ),
                const Text(
                  'Welcome to',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black54),
                ),
                Text(
                  'Investment Analytica!',
                  style: TextStyle(
                    fontSize: 18,
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
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Column(
                    children: [
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
                          controller: firstNameController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            prefixIcon: Icon(Icons.person),
                            hintText: "First Name",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{3,}$');
                            if (value!.isEmpty) {
                              return ("First Name cannot be Empty");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid name(Min. 3 Character)");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            firstNameController.text = value!;
                          },
                          keyboardType: TextInputType.name,
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
                          controller: lastNameController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            prefixIcon: Icon(Icons.person),
                            hintText: "Last Name",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Second Name cannot be Empty");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            lastNameController.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
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
                                  0, 2), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email),
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please Enter Your Email");
                            }
                            // reg expression for email validation
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter a valid email");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            emailController.text = value!;
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
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            prefixIcon: Icon(Icons.vpn_key),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return ("Password is required for login");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid Password(Min. 6 Character)");
                            }
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
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
                          controller: reInterPasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "Confirm password",
                            prefixIcon: Icon(Icons.vpn_key),
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (reInterPasswordController.text !=
                                passwordController.text) {
                              return "Password don't match";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            reInterPasswordController.text = value!;
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
                            backgroundColor: const Color(0XFFD2DDD8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 18,
                              //color: color,
                            ),
                          ),
                          onPressed: () {
                            signUp(
                                emailController.text, passwordController.text);

                            setState(() {});
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Column(
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon:
                                                    Icon(Icons.close_rounded)),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              40, 0, 40, 2),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: const [
                                                  Text(
                                                    'Select your',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black54),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: const [
                                                  Text(
                                                    'Favorates',
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  Text('Shares!',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.black54))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    content: Column(
                                      children: [
                                        SizedBox(
                                          width: 250,
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              //maximumSize: const Size(16.0, 16.0),
                                              primary: _flag8
                                                  ? Color(0xFFEEEEEE)
                                                  : Colors.black54,

                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              textStyle: const TextStyle(
                                                fontSize: 18,
                                                //color: color,
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _flag8 = !_flag8;
                                              });
                                            },
                                            child: Row(
                                              children: const [
                                                Icon(
                                                  Icons.apple,
                                                  color: Colors.black26,
                                                  size: 40,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  'Apple',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          width: 250,
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: _flag9
                                                  ? Color(0xFFEEEEEE)
                                                  : Colors.black54,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              textStyle: const TextStyle(
                                                fontSize: 18,
                                                //color: color,
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _flag9 = !_flag9;
                                              });
                                            },
                                            child: Row(
                                              children: const [
                                                Icon(
                                                  Icons
                                                      .radio_button_checked_rounded,
                                                  color: Colors.black26,
                                                  size: 40,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  'Google',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          width: 250,
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: _flag10
                                                  ? Color(0xFFEEEEEE)
                                                  : Colors.black54,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              textStyle: const TextStyle(
                                                fontSize: 18,
                                                //color: color,
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _flag10 = !_flag10;
                                              });
                                            },
                                            child: Row(
                                              children: const [
                                                Icon(
                                                  Icons.apple,
                                                  color: Colors.black26,
                                                  size: 40,
                                                ),
                                                SizedBox(width: 20),
                                                Text(
                                                  'Tesla',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          width: 250,
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: _flag11
                                                  ? Color(0xFFEEEEEE)
                                                  : Colors.black54,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              textStyle: const TextStyle(
                                                fontSize: 18,
                                                //color: color,
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _flag11 = !_flag11;
                                              });
                                            },
                                            child: Row(
                                              children: const [
                                                Icon(
                                                  Icons.apple,
                                                  color: Colors.black26,
                                                  size: 40,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  'Silver',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          width: 250,
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: _flag12
                                                  ? Color(0xFFEEEEEE)
                                                  : Colors.black54,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              textStyle: const TextStyle(
                                                fontSize: 18,
                                                //color: color,
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _flag12 = !_flag12;
                                              });
                                            },
                                            child: Row(
                                              children: const [
                                                Icon(
                                                  Icons.camera_sharp,
                                                  color: Colors.black26,
                                                  size: 40,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  'Gold',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      Padding(
                                        padding: const EdgeInsets.all(25.0),
                                        child: SizedBox(
                                          width: 300,
                                          height: 40,
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                //maximumSize: const Size(16.0, 16.0),
                                                backgroundColor:
                                                    const Color(0XFFDEE3E1),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  //color: color,
                                                ),
                                              ),
                                              onPressed: () {
                                                setState(() {});
                                              },
                                              child: const Text(
                                                'Get it !',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Do you have an account ?',
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
                                  builder: (_) => const loginPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
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
    );
  }

  void signUp(String email, String password) async {
    print('email : $email');
    print('pass : $password');

    if (_Formkey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameController.text;
    userModel.lastName = lastNameController.text;

    await firebaseFirestore
        .collection("users")
        .doc((user != null) ? user.uid : '')
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const MyBottomNavigationBar()),
        (route) => false);
  }
}
