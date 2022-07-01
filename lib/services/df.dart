import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Df {
  // ignore: non_constant_identifier_names
  late String logo;
  late String recommendation;
  late String recommendationFrim;
  late List<String>? low = [];
  late List<String>? high = [];
  late String name;
  late String updownprice;
  late String symbols;
  late String values;
  late List<String>? openPrice = [];
  late List<String>? closePrice = [];
  late String? prediction;
  late String titles;
  late String links;
  Df({
    required this.logo,
    required this.updownprice,
    required this.recommendation,
    required this.recommendationFrim,
    this.low,
    this.high,
    required this.name,
    required this.symbols,
    required this.values,
    this.openPrice,
    this.closePrice,
    this.prediction,
    required this.titles,
    required this.links,
  });

  factory Df.fromJson(Map<String, dynamic> json) => Df(
        logo: json['logo'],
        updownprice: json['UpDowmPrice'],
        recommendation: json['Recommendation'],
        recommendationFrim: json['Firm'],
        low: json['Low'],
        high: json['High'],
        name: json["Companies_name"],
        symbols: json["symbols"],
        values: json["values"],
        openPrice: json["open_price"],
        closePrice: json["close_price"],
        prediction: json["prediction"],
        titles: json["titles"],
        links: json["links"],
      );
  Map<String, dynamic> toJson() => {
        'Firm': recommendationFrim,
        'Recommendation': recommendation,
        'Low': low,
        'High': high,
        'Companies_name': name,
        "symbols": symbols,
        "values": values,
        "open_price": openPrice,
        "close_price": closePrice,
        "prediction": prediction,
        "titles": titles,
        "links": links,
      };
}
