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
  List<Df> mainList = [
    Df(
        recommendationFrim: 'JoshSmith',
        recommendation: 'Buy',
        name: 'Apple',
        symbols: 'AAPL',
        links: '',
        titles: '',
        values: '156.9',
        updownprice: '56.3',
        logo: 'https://cdn-icons-png.flaticon.com/512/1532/1532495.png'),
    Df(
        recommendationFrim: 'Michel Roi',
        recommendation: 'Sell',
        name: 'Alcoa',
        symbols: 'AA',
        links: '',
        values: '269.2',
        titles: '',
        updownprice: '26.8',
        logo:
            'https://s3-us-west-2.amazonaws.com/lndr-landorcom-assets-prd/app/uploads/2016/03/15133800/Alcoa-grey.jpg?w=760&fit=max'),
    Df(
        recommendation: 'Buy',
        recommendationFrim: 'Alex',
        name: 'Airbnb',
        symbols: 'ABNB',
        links: '',
        values: '156.7',
        titles: '',
        updownprice: '89.3',
        logo:
            'https://e7.pngegg.com/pngimages/698/122/png-clipart-airbnb-logo-hotel-accommodation-bed-and-breakfast-hotel-text-service.png'),
    Df(
        recommendation: 'Sell',
        recommendationFrim: 'Richered',
        name: 'Absci',
        symbols: 'ABSI',
        links: '',
        values: '368.7',
        titles: '',
        updownprice: '58.2',
        logo:
            'https://dcassetcdn.com/design_img/17330/32304/32304_418805_17330_image.png'),
    Df(
        recommendation: 'Sell',
        recommendationFrim: 'Lio Mark',
        name: 'Accolade',
        symbols: 'ACCD',
        links: '',
        values: '142.5',
        titles: '',
        updownprice: '65.1',
        logo: 'https://www.accon.co.jp/img/logo.png'),
    Df(
        recommendation: 'Buy',
        recommendationFrim: 'Judy Liam ',
        name: 'AECOM',
        symbols: 'ACM',
        links: '',
        values: '356.8',
        titles: '',
        updownprice: '89.6',
        logo:
            'https://govconwire-media.s3.amazonaws.com/2020/08/27/5b/fc/9d/2a/e9/90/65/d4/aecom-gets-101m-army-prepositioned-stock-logistics-contract-modification.png') /*'Apple',
    'Alcoa',
    'Airbnb',
    'Absci',
    'Accolade',
    'AECOM'*/
  ];
  //List<String> symbol = ['AAPL', 'AA', 'ABNB', 'ABSI', 'ACCD', 'ACM'];
  late List<Df> displayList = List.from(mainList);
  void updateListView(String value) {
    setState(() {
      displayList = mainList
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

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

  // real time data
  /*
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
              ),*/

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
                          updateListView(value);
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
                            child: ListView.builder(
                              itemCount: displayList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFEEEEEE),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: SizedBox(
                                    height: 110,
                                    width: 120,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: Image(
                                                image: NetworkImage(
                                              displayList[index].logo,
                                            )),
                                          ),
                                          Text(displayList[index].name),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            displayList[index].recommendation,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            children: [
                                              //const SizedBox(width: 2),
                                              Text(displayList[index]
                                                  .recommendationFrim),
                                              SizedBox(
                                                width: 1,
                                              ),
                                              const Icon(
                                                Icons.arrow_drop_down_sharp,
                                                color: Colors.red,
                                              )
                                            ],
                                          ),
                                          Text(
                                            displayList[index].values,
                                            style:
                                                const TextStyle(fontSize: 10),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
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
                            child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: displayList.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
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
                                  borderRadius: BorderRadius.circular(15),
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
                                                decoration: BoxDecoration(
                                                  /* boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: const Offset(0,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],*/
                                                  color: Colors.black12,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              const Icon(
                                                Icons
                                                    .stacked_line_chart_outlined,
                                                size: 30,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                displayList[index].name,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Text(displayList[index].symbols)
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 40,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: SizedBox(
                                                height: 50,
                                                width: 80,
                                                child: const FiChartPage()),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Column(
                                            //crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                displayList[index].values,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.black54),
                                              ),
                                              Text(
                                                displayList[index].updownprice,
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
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            )));
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
