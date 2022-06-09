import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'profile.dart';

class Change_Password extends StatefulWidget {
  const Change_Password({Key? key}) : super(key: key);

  @override
  State<Change_Password> createState() => _Change_PasswordState();
}

class _Change_PasswordState extends State<Change_Password> {
  final _Formkey = GlobalKey<FormState>();
  var newpassword;
  final currentUser = FirebaseAuth.instance.currentUser;

  TextEditingController currentPaswordController = TextEditingController();
  final newPaswordController = TextEditingController();
  TextEditingController confirmPaswordController = TextEditingController();
  @override
  void dispose() {
    newPaswordController.dispose();
    super.dispose();
  }

  changePassword() async {
    try {
      await currentUser!.updatePassword(newpassword);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => loginPage(),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Your password has been changed successfully, Login again'),
        ),
      );
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 60, 10, 40),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    print("Container clicked");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const profilePage(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: const Color(0XFFEEEEEE),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(8, 2, 8, 1),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 25,
                            color: Colors.black45,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                const Text(
                  'Change Password',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: const [
                  Expanded(
                    child: Text(
                      'Your password must be more than 6 character and include a combination ofnumbera, lestters and special characters(!@%).',
                      style: TextStyle(fontSize: 18, color: Colors.black45),
                      maxLines: 200,
                      overflow: TextOverflow.fade,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _Formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: Colors.black26,
                        obscureText: true,
                        controller: currentPaswordController,
                        decoration: const InputDecoration(
                            //  iconColor: Colors.black,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "Current Password"),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: newPaswordController,
                        obscureText: true,
                        /*  validator: (value) {
                          return confirmPaswordController.text == value
                              ? null
                              : 'Please validate the password';
                        },*/
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "New Password"),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: confirmPaswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "Re-inter the password"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 300,
              child: TextButton(
                style: TextButton.styleFrom(
                  // maximumSize: const Size(16.0, 16.0),
                  backgroundColor: Color(0XFFEDE7F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    //color: color,
                  ),
                ),
                onPressed: () {
                  if (_Formkey.currentState!.validate()) {
                    setState(() {
                      newpassword = newPaswordController.text;
                    });
                    changePassword();
                  }
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
