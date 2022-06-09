import 'package:flutter/material.dart';

class cardCreator extends StatefulWidget {
  const cardCreator({Key? key}) : super(key: key);

  @override
  State<cardCreator> createState() => _cardCreatorState();
}

class _cardCreatorState extends State<cardCreator> {
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
    return Scaffold();
    /*ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(12, 1, 12, 5),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StockDetailsPage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 200,
                    width: 380,
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
                      color: const Color(0XFFEEEEEE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
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
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Icon(Icons.person),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                data[1]['_companyName'],
                                style: const TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              const SizedBox(
                                width: 130,
                              ),
                              Column(
                                //crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    data[1]['_stockPrice'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black54),
                                  ),
                                  Text(
                                    data[1]['_stockPrice'],
                                    style: const TextStyle(color: Colors.red),
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
                            data[1]['_summary'],
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  data[1]['_date'],
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 205,
                              ),
                              IconButton(
                                icon: const Icon(Icons.share_outlined),
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
              ],
            ),
          );
        });*/
  }
}
