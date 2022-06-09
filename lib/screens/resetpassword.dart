import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:investment_analatyca_testthree/screens/login.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _Formkey = GlobalKey<FormState>();
  var email = "";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Password Reset Email has been sent !',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'No user found for that email.',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: const Color(0XFFDEE3E1),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_outlined),
                )
              ],
            ),
            const Image(
              image: AssetImage('assets/images/pass.jpg'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: const Text(
                'Reset Link will be sent to your email',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _Formkey,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFEEEEEE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        hintText: "Enter Your Email",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email';
                        } else if (!value.contains('@')) {
                          return 'Please Enter Valid Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                        // Validate returns true if the form is valid, otherwise false.
                        if (_Formkey.currentState!.validate()) {
                          setState(() {
                            email = emailController.text;
                          });
                          resetPassword();
                        }
                      },
                      child: const Text(
                        'Send Email',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
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
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const loginPage(),
                        ));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
