import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartGenerator extends StatefulWidget {
  const ChartGenerator({Key? key}) : super(key: key);

  @override
  _ChartGeneratorState createState() => _ChartGeneratorState();
}

class _ChartGeneratorState extends State<ChartGenerator> {
  /*late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;
  @override
  void initState() {
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
    super.initState();
  }*/

  List<ChartData> chartData = [];

  /*Future loadChartData() async {
    final dynamic jsonString = await getjsonData();
    final dynamic jsonResponse = json.decode(jsonString);
    for (Map<String, dynamic> i in jsonResponse) {
      chartData.add(ChartData.fromJson(i));
    }
  }*/
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
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
            dataLabelSettings: const DataLabelSettings(isVisible: false),
          )
        ]);

    /*Container(
      child: Expanded(
        child: SfCartesianChart(
          series: <LineSeries<LiveData, int>>[
            LineSeries<LiveData, int>(
              onRendererCreated: (ChartSeriesController controller) {
                _chartSeriesController = controller;
              },
              dataSource: chartData,
              color: const Color.fromRGBO(192, 108, 132, 1),
              xValueMapper: (LiveData stocks, _) => stocks.time,
              yValueMapper: (LiveData stocks, _) => stocks.cost,
            )
          ],
          primaryXAxis: NumericAxis(
            majorGridLines: const MajorGridLines(width: 0),
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            interval: 1, /*title: AxisTitle(text: 'Time (seconds)'),*/
          ),
          primaryYAxis: NumericAxis(
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(size: 0),
            /*title: AxisTitle(
                                          text: 'Internet speed (Mbps)')*/
          ),
        ),
      ),
    );*/
  }
  /*int time = 19;
  void updateDataSource(Timer timer) {
    chartData.add(LiveData(time++, (math.Random().nextInt(60) + 30)));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0, 42),
      LiveData(1, 47),
      LiveData(2, 43),
      LiveData(3, 49),
      LiveData(4, 54),
      LiveData(5, 41),
      LiveData(6, 58),
      LiveData(7, 51),
      LiveData(8, 98),
      LiveData(9, 41),
      LiveData(10, 53),
      LiveData(11, 72),
      LiveData(12, 86),
      LiveData(13, 52),
      LiveData(14, 94),
      LiveData(15, 92),
      LiveData(16, 86),
      LiveData(17, 72),
      LiveData(18, 94)
    ];
  }*/
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
/*class LiveData {
  LiveData(this.time, this.cost);
  final int time;
  final int cost;
}
*/
