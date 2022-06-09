import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../chart_generator.dart';

class RealTimeCardGenerator extends StatelessWidget {
  late List data;

  String getData() {
    this.initState();
    // this function will be future with async and await
    return '';
  }

  @override
  void initState() {
    //to refresh data

    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: 380,
                    height: 90,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Stack(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: Icon(
                                    Icons.apple,
                                    size: 35,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                data[1]['_companyName'],
                                style: const TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Text(
                                data[1]['_smallStockName'],
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black54),
                              )
                            ],
                          ),
                          const ChartGenerator(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                data[1]['_stockPrice'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black54),
                              ),
                              Text(
                                data[1]['upDownPrice'],
                                style: const TextStyle(color: Colors.red),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
