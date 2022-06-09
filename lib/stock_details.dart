import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chart_generator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:share/share.dart';
import 'package:investment_analatyca_testthree/services/http_services.dart';
import 'package:investment_analatyca_testthree/services/df.dart';
import 'package:investment_analatyca_testthree/services/http_services.dart';
import 'package:investment_analatyca_testthree/services/df.dart';

class StockDetailsPage extends StatefulWidget {
  const StockDetailsPage({Key? key}) : super(key: key);

  @override
  _StockDetailsPageState createState() => _StockDetailsPageState();
}

class _StockDetailsPageState extends State<StockDetailsPage> {
  HttpService service = HttpService();
  late Future<List<dynamic>> futureOpenPrice;
  late Future<List<dynamic>> futureClosePrice;
  bool is_visible = true;
  bool Day1is_visible = false;
  bool Day5is_visible = false;
  bool Weekis_visible = false;
  bool Monthis_visible = false;
  bool Yearis_visible = false;
  int index = -1;

  Color enableColor = Colors.green;
  Color disableColor = Colors.white10;
  Color colorbu = Colors.white10;

  bool _flag1 = true;
  bool _flag2 = true;
  bool _flag3 = true;
  bool _flag4 = true;
  bool _flag5 = true;

  List<ChartData> chartData = [];

  /*Future<Future<List<Df>>> getjsonData() async {
    final HttpService httpService = HttpService();
    var value_respond = httpService.get_companies_value();
    return respond;
  }*/

  /*Future loadChartData() async {
    final dynamic jsonString = await getjsonData();
    final dynamic jsonResponse = json.decode(jsonString);
    for (Map<String, dynamic> i in jsonResponse) {
      chartData.add(ChartData.fromJson(i));
    }
  }*/

  /*FutureBuilder<List<Df>> _buildBody(BuildContext context) {
    final HttpService httpService = HttpService();
    return FutureBuilder<List<Df>>(
      future: httpService.get_companies_value(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Df>? posts = snapshot.data;
          return _buildPosts(context, posts!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }*/

  ListView _buildPosts(BuildContext context, List<Df> posts) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const ScrollPhysics(),
      itemCount: posts.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 210,
          width: 200,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            color: const Color(0XFFD2DDD8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 38,
                          width: 38,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            color: const Color(0XFFB6C4BD),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.apple,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Column(
                      children: [
                        Text(
                          'posts[index].CompanyName!',
                          style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text('Apple lnc')
                      ],
                    ),
                    const SizedBox(
                      width: 115,
                    ),
                    Column(
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          ' posts[index].Close_Prise!',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black54),
                        ),
                        Text(
                          '+222',
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: const [
                    Text(
                      'Recomendation:  ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Sell',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black45,
                  thickness: 0.5,
                  height: 10.0,
                  indent: 15.0,
                  endIndent: 10.0,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: const [
                    Text(
                      'Open',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      'Day High',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      'Day Low',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text(
                      '2.22.3 ',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      '45.62',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      '85.32',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 25),
        child: ListView(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    print("Container clicked");
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(1, 2, 8, 1),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 60,
                ),
                const Text(
                  ' Stock Details ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black),
                ),
                SizedBox(
                  width: 60,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.ios_share,
                    size: 30,
                  ),
                  onPressed: () {
                    Share.share(
                        'https://play.google.com/store/apps/details?id=com.instructivetech.testapp');
                  },
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ), //////////////////////////////here
            Container(
                //child: _buildBody(context),
                ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 400,
                width: 351,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black45,
                    width: 0.5,
                  ),
                  /* boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],*/
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 12, 10, 15),
                      child: Container(
                        height: 50,
                        width: 340,
                        decoration: BoxDecoration(
                          color: Color(0XFFEEEEEE),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Wrap(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(
                                        // backgroundColor: ,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _flag1 = !_flag1;
                                      Day1is_visible = true;
                                      is_visible = false;
                                      Monthis_visible = false;
                                      Yearis_visible = false;
                                      Day5is_visible = false;
                                      Weekis_visible = false;
                                    });
                                  },
                                  child: const Text(
                                    '1D',
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),
                                /////////////////
                                TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _flag2 = !_flag2;
                                      Day1is_visible = false;
                                      is_visible = false;
                                      Monthis_visible = false;
                                      Yearis_visible = false;
                                      Day5is_visible = true;
                                      Weekis_visible = false;
                                    });
                                  },
                                  child: const Text(
                                    '5D',
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),
                                /////////////////////
                                TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _flag3 = !_flag3;
                                      Day1is_visible = false;
                                      is_visible = false;
                                      Monthis_visible = false;
                                      Yearis_visible = false;
                                      Day5is_visible = false;
                                      Weekis_visible = true;
                                    });
                                  },
                                  child: const Text(
                                    '1W',
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),
                                //////////////////
                                TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _flag4 = !_flag4;
                                      _flag1 = !_flag1;
                                      Day1is_visible = false;
                                      is_visible = false;
                                      Monthis_visible = true;
                                      Yearis_visible = false;
                                      Day5is_visible = false;
                                      Weekis_visible = false;
                                    });
                                  },
                                  child: const Text(
                                    '1M',
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),
                                ////////////////////
                                TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        //color: color,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _flag5 = !_flag5;
                                      _flag1 = !_flag1;
                                      Day1is_visible = false;
                                      is_visible = false;
                                      Monthis_visible = false;
                                      Yearis_visible = true;
                                      Day5is_visible = false;
                                      Weekis_visible = false;
                                    });
                                  },
                                  child: const Text(
                                    '1Y',
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),
                                /////////////
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(8, 30, 8, 8),
                              child: Visibility(
                                  visible: is_visible ||
                                      Day5is_visible ||
                                      Weekis_visible ||
                                      Monthis_visible ||
                                      Day1is_visible == true,
                                  child: SfCartesianChart(
                                      primaryXAxis: CategoryAxis(),
                                      // Chart title
                                      //title: ChartTitle(text: 'Monthly Covid-19 Infections'),
                                      // Enable legend
                                      legend: Legend(isVisible: false),
                                      // Enable tooltip
                                      tooltipBehavior: TooltipBehavior(
                                        enable: true,
                                        color: const Color(0XFFD2DDD8),
                                        textStyle: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      series: <ChartSeries<ChartData, String>>[
                                        LineSeries<ChartData, String>(
                                          color: Colors.black,
                                          dataSource: chartData,
                                          xValueMapper: (ChartData data, _) =>
                                              data.date,
                                          yValueMapper: (ChartData data, _) =>
                                              data.price,
                                          // Enable data label
                                          dataLabelSettings:
                                              const DataLabelSettings(
                                                  isVisible: false),
                                        )
                                      ])),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: const [
                Text(
                  'Movement Avarage',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 400,
                width: 351,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.black45,
                    width: 0.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      //title: ChartTitle(text: 'Monthly Covid-19 Infections'),
                      // Enable legend
                      legend: Legend(isVisible: false),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                        color: const Color(0XFFD2DDD8),
                        textStyle: const TextStyle(color: Colors.black),
                      ),
                      series: <ChartSeries<ChartData, String>>[
                        LineSeries<ChartData, String>(
                          color: Colors.black,
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.date,
                          yValueMapper: (ChartData data, _) => data.price,
                          // Enable data label
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: false),
                        )
                      ]),
                ),
              ),
            ),
          ],
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
