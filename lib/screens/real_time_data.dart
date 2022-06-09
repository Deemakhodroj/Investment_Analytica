import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investment_analatyca_testthree/stock_details.dart';
import 'package:investment_analatyca_testthree/models/user_model.dart';
import 'package:investment_analatyca_testthree/services/fi_chart.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart';
import 'package:investment_analatyca_testthree/services/http_services.dart';
import 'package:investment_analatyca_testthree/services/df.dart';
import 'dart:async';

class RealTimeDataPage extends StatefulWidget {
  const RealTimeDataPage({Key? key}) : super(key: key);

  @override
  State<RealTimeDataPage> createState() => _RealTimeDataPageState();
}

class _RealTimeDataPageState extends State<RealTimeDataPage> {
  /*Future<Df> createAlbum(String title) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:5000/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "Companies_name": name,
      }),
    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,\
      // then parse the JSON.
      return Df.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }*/

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  List<Df> real_time_data = [];
  List<Df> recommendation_data = [];
  List<Df> filtered_realtimedata = [];

  late Future<List<Df>> futurData;

  HttpService service = HttpService();
  @override
  void initState() {
    super.initState();
    futurData = service.get_Data();
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
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 5),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisSize: MainAxisSize.min,
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
                          color: Color(0XFF010000),
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
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: 50,
                  child: CupertinoSearchTextField(
                    borderRadius: BorderRadius.circular(10),
                    backgroundColor: Color(0XFFEEEEEE),
                    onChanged: (value) {
                      //value = value.toLowerCase();
                      setState(() {
                        filtered_realtimedata = real_time_data
                            .where((r) =>
                                (r.values!.contains(value.toLowerCase())))
                            .toList();
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  Text(
                    'Recommendation',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Flexible(
                    child: SizedBox(
                        height: 160,
                        child: FutureBuilder<List<Df>>(
                            future: futurData,
                            builder: (context, snapshot) {
                              if (ConnectionState == ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasData) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 40,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0XFFEEEEEE),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: SizedBox(
                                        height: 110,
                                        width: 110,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              const Icon(
                                                Icons
                                                    .stacked_line_chart_outlined,
                                                size: 40,
                                              ),
                                              Text(
                                                  '${snapshot.data![index].name}'),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                '${snapshot.data![index].recommendation}',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  const SizedBox(width: 10),
                                                  Text(
                                                      '${snapshot.data![index].recommendationFrim}'),
                                                  const Icon(
                                                    Icons.arrow_drop_down_sharp,
                                                    color: Colors.red,
                                                  )
                                                ],
                                              ),
                                              Text(
                                                '${snapshot.data![index].values}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return const CircularProgressIndicator();
                            })),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: const [
                  Text(
                    'Real time data',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        child: FutureBuilder<List<Df>>(
                            future: futurData,
                            builder: (context, snapshot) {
                              // ignore: unrelated_type_equality_checks
                              if (ConnectionState == ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasData) {
                                return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics: const ScrollPhysics(),
                                  itemCount: 40,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12, 0, 12, 12),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const StockDetailsPage(),
                                          ),
                                        );
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 100,
                                        width: 190,
                                        decoration: BoxDecoration(
                                          color: const Color(0XFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                                        height: 38,
                                                        width: 38,
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.3),
                                                              spreadRadius: 5,
                                                              blurRadius: 7,
                                                              offset: const Offset(
                                                                  0,
                                                                  3), // changes position of shadow
                                                            ),
                                                          ],
                                                          color: Colors.black12,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                      const Icon(
                                                        Icons
                                                            .stacked_line_chart_outlined,
                                                        size: 40,
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        '${snapshot.data![index].name}',
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18),
                                                      ),
                                                      Text(
                                                          '${snapshot.data![index].symbols}')
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 40,
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: SizedBox(
                                                        height: 50,
                                                        width: 80,
                                                        child:
                                                            const FiChartPage()),
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Column(
                                                    //crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        '${snapshot.data![index].values}',
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                      Text(
                                                        '${snapshot.data![index].high}',
                                                        style: const TextStyle(
                                                            color: Colors.red),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return const CircularProgressIndicator();
                            })),
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

class ChartData {
  ChartData(this.date, this.price);

  final String date;
  final double price;

  factory ChartData.fromJson(Map<String, dynamic> parsedJson) {
    return ChartData(
      parsedJson['date'].toString(),
      parsedJson['price'],
    );
  }
}
