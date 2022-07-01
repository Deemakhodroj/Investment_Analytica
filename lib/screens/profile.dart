import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:investment_analatyca_testthree/language_change_provider.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:investment_analatyca_testthree/screens/login.dart';
import 'package:investment_analatyca_testthree/screens/resetpassword.dart';
import 'package:provider/provider.dart';
import 'package:investment_analatyca_testthree/models/user_model.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  //switch value
  bool _value = false;
  //language menu
  String? selectedValue;
  List<String> items = [
    'English',
    'العربية',
  ];
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Center(
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              const Center(
                child: Text(
                  ''
                  '',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black45),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    /* boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],*/
                    // color: Colors.white,
                    color: const Color(0XFFEEEEEE),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 85,
                          width: 70,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.0),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/images.png'),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${loggedInUser.firstName} ${loggedInUser.lastName}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.black54),
                                ),
                                const SizedBox(
                                  width: 7,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Personal user account ',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      InkWell(
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          print("Container clicked");
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const loginPage(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.logout,
                          size: 30,
                          color: Colors.black45,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  /*Text(
                    'Settings',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black45),
                  ),*/
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: SizedBox(
                  height: 70,
                  width: 200,
                  child: Text(
                    'Your password must be more than 6 character and include a combination ofnumbera, lestters and special characters(!@%).',
                    style: TextStyle(fontSize: 18, color: Colors.black45),
                    maxLines: 200,
                    overflow: TextOverflow.fade,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  color: const Color(0XFFFFFFFF),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      /*Container(
                        height: 60,
                        decoration: BoxDecoration(
                          /* boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],*/
                          //color: Colors.white,
                          color: const Color(0XFFEEEEEE),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.notifications,
                                size: 30,
                                color: Colors.black45,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              'Notification ',
                              style: TextStyle(
                                  fontSize: 21, color: Colors.black54),
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            Switch(
                              activeTrackColor: Colors.grey,
                              activeColor: Colors.black54,
                              splashRadius: 20,
                              value: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),*/
                      /*const SizedBox(
                        height: 20,
                      ),*/
                      /* Container(
                        height: 60,
                        decoration: BoxDecoration(
                          /* boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],*/
                          //color: Colors.white,
                          color: const Color(0XFFEEEEEE),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.dark_mode,
                                size: 30,
                                color: Colors.black45,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              'Dark Mood ',
                              style: TextStyle(
                                  fontSize: 21, color: Colors.black54),
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            Switch(
                                activeTrackColor: Colors.grey,
                                activeColor: Colors.black54,
                                splashRadius: 20,
                                value: false,
                                onChanged: (newvalue) {})
                          ],
                        ),
                      ),*/
                      const SizedBox(
                        height: 20,
                      ),
                      Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ResetPassword()),
                            );
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              /* boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],*/
                              //color: Colors.white,
                              color: const Color(0XFFEEEEEE),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.vpn_key_rounded,
                                    size: 30,
                                    color: Colors.black45,
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  'Password  ',
                                  style: TextStyle(
                                      fontSize: 21, color: Colors.black54),
                                ),
                                SizedBox(
                                  width: 130,
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  size: 30,
                                  color: Colors.black45,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 200,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.red,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const loginPage()),
                            );
                          },
                          child: const Text(
                            'Log out',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
