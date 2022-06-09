import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:investment_analatyca_testthree/models/user_model.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:investment_analatyca_testthree/services/http_services.dart';
import 'package:investment_analatyca_testthree/services/df.dart';

class MovementAVG extends StatefulWidget {
  const MovementAVG({Key? key}) : super(key: key);

  @override
  State<MovementAVG> createState() => _MovementAVGState();
}

class _MovementAVGState extends State<MovementAVG> {
  @override
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  HttpService service = HttpService();
  late Future<List<Df>> futureData;
  @override
  void initState() {
    super.initState();
    futureData = service.get_Data();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
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
                const SizedBox(
                  width: 10,
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
            //interactive chart
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    'Recent Article',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: SizedBox(
                height: 500,
                child: FutureBuilder<List<Df>>(
                    future: futureData,
                    builder: (context, snapshot) {
                      if (ConnectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const ScrollPhysics(),
                          itemCount: 10,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.all(12),
                            child: Container(
                              height: 200,
                              width: 380,
                              decoration: BoxDecoration(
                                color: const Color(0XFFEEEEEE),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                color: const Color(0XFFD2DDD8),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(3.0),
                                              child: Icon(
                                                  Icons.stacked_line_chart),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          '${snapshot.data![index].name}',
                                          style: const TextStyle(
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54),
                                        ),
                                        const SizedBox(
                                          width: 70,
                                        ),
                                        Column(
                                          //crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '_stockP',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.black54),
                                            ),
                                            Text(
                                              '_upDownP',
                                              style: const TextStyle(
                                                  color: Colors.red),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      height: 10.0,
                                      indent: 15.0,
                                      endIndent: 20.0,
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      '${snapshot.data![index].titles}',
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 28,
                                    ),
                                    Text(
                                      '${snapshot.data![index].links}',
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 290,
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.ios_share),
                                          onPressed: () {
                                            Share.share(
                                                'https://play.google.com/store/apps/details?id=com.instructivetech.testapp');
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      return const CircularProgressIndicator();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
