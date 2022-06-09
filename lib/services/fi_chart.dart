import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FiChartPage extends StatefulWidget {
  const FiChartPage({Key? key}) : super(key: key);

  @override
  _FiChartPageState createState() => _FiChartPageState();
}

class _FiChartPageState extends State<FiChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEEEEEE),
      body: Padding(
        padding: const EdgeInsets.only(right: 22.0),
        child: Center(
          child: SizedBox(
            width: 200,
            height: 100,
            child: LineChart(
              LineChartData(
                borderData: FlBorderData(
                    show: false,
                    border: Border.all(color: Colors.black, width: 2)),
                gridData: FlGridData(
                  show: true,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(color: Colors.black, strokeWidth: 1);
                  },
                  drawVerticalLine: false,
                  getDrawingVerticalLine: (value) {
                    return FlLine(color: Colors.black, strokeWidth: 1);
                  },
                ),
                titlesData: FlTitlesData(
                  show: false,
                  bottomTitles: SideTitles(
                      showTitles: false,
                      reservedSize: 35,
                      getTextStyles: (context, value) {
                        return const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold);
                      },
                      /*getTitles: (value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'Sep 19';
                          case 4:
                            return 'Oct 10';
                          case 8:
                            return 'Nov 16';
                        }
                        return '';
                      },*/
                      margin: 8),
                  // rightTitles: SideTitles(),
                  //  topTitles: SideTitles(),
                  leftTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 35,
                    getTextStyles: (context, value) {
                      return const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold);
                    },
                    /*getTitles: (value) {
                      switch (value.toInt()) {
                        case 0:
                          return '0';
                        case 2:
                          return '50';
                        case 4:
                          return '100';
                        case 6:
                          return '150';
                      }
                      return '';
                    },*/
                    margin: 12,
                  ),
                ),
                maxX: 8,
                maxY: 8,
                minY: 0,
                minX: 0,
                lineBarsData: [
                  LineChartBarData(
                      spots: [
                        const FlSpot(0, 0),
                        const FlSpot(5, 5),
                        const FlSpot(7, 6),
                        const FlSpot(8, 4),
                      ],
                      isCurved: true,
                      colors: [
                        Color(0XFFC8E6C9),
                        Color(0XFF81C784),
                        Color(0XFF66BB9A)
                      ],
                      dotData: FlDotData(
                        show: false,
                      ),
                      barWidth: 2,
                      belowBarData: BarAreaData(
                          show: true,
                          colors: [
                            Color(0XFF66BB9A),
                            Color(0XFF81C784),
                            Color(0XFFC8E6C9),
                          ].map((e) => e.withOpacity(0.2)).toList()))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
