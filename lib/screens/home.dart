import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:investment_analatyca_testthree/card_generator.dart';
import 'package:investment_analatyca_testthree/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _flag1 = true;
  bool _flag2 = true;
  bool _flag3 = true;
  bool _flag4 = true;
  bool _flag5 = true;
  bool _flag6 = true;
  bool _flag7 = true;
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
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 12, 10, 10),
        child: Center(
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Welcome back',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(
                            width: 60,
                          )
                        ],
                      ),
                      Text(
                        "${loggedInUser.firstName} ${loggedInUser.lastName}",
                        style: const TextStyle(
                          fontSize: 30,
                          color: Color(0XFF010000),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      size: 40,
                      color: Colors.black26,
                    ),
                  ),
                  const CircleAvatar(
                    radius: 38,
                    backgroundImage: AssetImage('assets/images/images.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: const Color(0XFFEEEEEE),
                width: 350,
                height: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () => setState(() => _flag1 = !_flag1),
                            style: ElevatedButton.styleFrom(
                              primary: _flag1 ? Colors.white10 : Colors.black45,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(13),
                                ),
                              ),
                            ),
                            child: const Text("Apple"),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () => setState(() => _flag2 = !_flag2),
                            style: ElevatedButton.styleFrom(
                              primary: _flag2 ? Colors.white10 : Colors.black45,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                            ),
                            child: const Text("TSLA"),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () => setState(() => _flag3 = !_flag3),
                            style: ElevatedButton.styleFrom(
                              primary: _flag3 ? Colors.white10 : Colors.black45,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(13),
                                ),
                              ),
                            ),
                            child: const Text("GOOGL"),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () => setState(() => _flag4 = !_flag4),
                            style: ElevatedButton.styleFrom(
                              primary: _flag4 ? Colors.white10 : Colors.black45,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(13),
                                ),
                              ),
                            ),
                            child: const Text("SAMSG"),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () => setState(() => _flag5 = !_flag5),
                            style: ElevatedButton.styleFrom(
                              primary: _flag5 ? Colors.white10 : Colors.black45,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(13),
                                ),
                              ),
                            ),
                            child: const Text("GOLD"),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () => setState(() => _flag6 = !_flag6),
                            style: ElevatedButton.styleFrom(
                              primary: _flag6 ? Colors.white10 : Colors.black45,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(13),
                                ),
                              ),
                            ),
                            child: const Text("SLVR"),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () => setState(() => _flag7 = !_flag7),
                            style: ElevatedButton.styleFrom(
                              primary: _flag7 ? Colors.white10 : Colors.black45,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(13),
                                ),
                              ),
                            ),
                            child: const Text("HWAWI"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: const [
                    cardCreator(),
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
