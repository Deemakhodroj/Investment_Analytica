import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:investment_analatyca_testthree/models/user_model.dart';

class historyPage extends StatefulWidget {
  const historyPage({Key? key}) : super(key: key);

  @override
  _historyPageState createState() => _historyPageState();
}

// ignore: camel_case_types
class _historyPageState extends State<historyPage> {
  /* DateTimeRange DateRange = DateTimeRange(
    start: DateTime(2022, 1, 1),
    end: DateTime(2050, 1, 1),
  );*/
  DateTime _DateTime = DateTime.now();
  void _showDataPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        _DateTime = value!;
      });
    });
  }

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
    /*  final start = DateRange.start;
    final end = DateRange.end;*/
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 52, 10, 10),
        child: Center(
          child: Column(
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
                        '${loggedInUser.firstName} ${loggedInUser.lastName}',
                        style: const TextStyle(
                          fontSize: 30,
                          color: const Color(0XFF010000),
                        ),
                      ),
                    ],
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
                height: 128,
                width: 350,
                decoration: BoxDecoration(
                  color: const Color(0XFFE8E3FD),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                                'Simply choose the (date)to return to the information at any time !',
                                maxLines: 4,
                                overflow: TextOverflow.fade,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0XFF424242), fontSize: 18)),
                          ),
                          /*  Text(
                            'Simply choose the date to return to the information at any time !',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 18),
                          ),*/
                          const SizedBox(
                            width: 8,
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 42,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0XFFC9C2E7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const Icon(
                                Icons.history,
                                size: 38,
                                color: Color(0XFF424242),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.black45,
                            onPressed: _showDataPicker,
                            child: const Text(
                              'Select',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 90,
                            height: 37,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(_DateTime.day.toString()),
                                  const Text('/'),
                                  Text(
                                    _DateTime.month.toString(),
                                  ),
                                  const Text('/'),
                                  Text(_DateTime.year.toString()),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
