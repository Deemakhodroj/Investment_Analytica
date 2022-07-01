import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:investment_analatyca_testthree/models/user_model.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:investment_analatyca_testthree/services/http_services.dart';
import 'package:investment_analatyca_testthree/services/df.dart';
import 'package:flutter/cupertino.dart';

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

  List<Df> mainList = [
    Df(
        logo: '',
        recommendationFrim: '',
        recommendation: '',
        updownprice: '97.1',
        values: '156.9',
        name: 'Tesla',
        symbols: 'TSLA',
        titles:
            'Tesla Gets Stronger With Oil Rising, Other EV Stocks Not So Much ',
        links:
            'https://www.bloomberg.com/news/articles/2022-03-06/tesla-gets-stronger-with-oil-rising-other-ev-stocks-not-so-much#xj4y7vzkg'),
    Df(
        logo: '',
        recommendationFrim: '',
        recommendation: '',
        updownprice: '26.8',
        values: '269.2',
        name: 'Alcoa',
        symbols: 'AA',
        titles:
            'Why Alcoa Stock Hit a 52-Week High This Week and Could Go Higher',
        links:
            'https://www.fool.com/investing/2022/03/25/why-alcoa-stock-52-week-high-this-week-could-rally/'),
    Df(
        logo: '',
        recommendationFrim: '',
        recommendation: '',
        values: '156.7',
        name: 'Airbnb',
        updownprice: '89.3',
        symbols: 'ABNB',
        titles: 'What’s Happening With Airbnb Stock?',
        links:
            'https://www.forbes.com/sites/greatspeculations/2022/04/08/whats-happening-with-airbnb-stock/?sh=61d7d99411d0'),
    Df(
        logo: '',
        recommendationFrim: '',
        recommendation: '',
        updownprice: '84.1',
        values: '368.7',
        name: 'Absci',
        symbols: 'ABSI',
        titles:
            'Absci stock gets slammed by macro conditions, rising interest rates',
        links:
            'https://www.bizjournals.com/portland/news/2022/06/16/absci-stock-slammed.html'),
    Df(
        logo: '',
        recommendationFrim: '',
        recommendation: '',
        updownprice: '58.2',
        values: '259.8',
        name: 'Accolade',
        symbols: 'ACCD',
        titles: 'Is Accolade Stock (ACCD) a Good Investment?',
        links:
            'https://www.aaii.com/investingideas/article/17224-is-accolade-stock-accd-a-good-investment'),
    Df(
        logo: '',
        recommendationFrim: '',
        recommendation: '',
        updownprice: '65.1',
        values: '356.8',
        name: 'AECOM',
        symbols: 'ACM',
        titles: 'Heres Why Investors Should Consider Buying AECOM (ACM) Stock',
        links:
            'https://www.nasdaq.com/articles/heres-why-investors-should-consider-buying-aecom-acm-stock'),

    /*'Apple',
    'Alcoa',
    'Airbnb',
    'Absci',
    'Accolade',
    'AECOM'*/
  ];
  late List<Df> displayList = List.from(mainList);
  void updateListView(String value) {
    setState(() {
      displayList = mainList
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

/*FutureBuilder<List<Df>>(
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
                    }),*/
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
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                height: 50,
                child: CupertinoSearchTextField(
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: const Color(0XFFEEEEEE),
                  onChanged: (value) {
                    updateListView(value);
                  },
                ),
              ),
            ),
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
            Flexible(
              child: SizedBox(
                  height: 900,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    itemCount: displayList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: 230,
                        width: 380,
                        decoration: BoxDecoration(
                          color: const Color(0XFFEEEEEE),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                          child: Icon(Icons.stacked_line_chart),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          displayList[index].name,
                                          style: const TextStyle(
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54),
                                        ),
                                        Text(displayList[index].symbols)
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 170,
                                    ),
                                    Column(
                                      //crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          displayList[index].values,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black54),
                                        ),
                                        Text(
                                          displayList[index].updownprice,
                                          style: TextStyle(color: Colors.red),
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
                                  displayList[index].titles,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 15),
                                      text: displayList[index].links,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          var url = displayList[index].links;
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw "connot load url";
                                          }
                                        }),
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
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
