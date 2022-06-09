import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Df {
  // ignore: non_constant_identifier_names
  late List<String> recommendation = [''];
  late List<String> recommendationFrim = [''];
  late List<String> low = [];
  late List<String>? high = [];
  late List<String>? name = [];
  late List<String>? symbols = [];
  late List<String>? values = [];
  late List<String>? openPrice = [];
  late List<String>? closePrice = [];
  late List<String>? prediction = [];
  late List<String>? titles = [];
  late List<String>? links = [];
  Df({
    required this.recommendation,
    required this.recommendationFrim,
    required this.low,
    required this.high,
    required this.name,
    required this.symbols,
    required this.values,
    required this.openPrice,
    required this.closePrice,
    required this.prediction,
    required this.titles,
    required this.links,
  });

  factory Df.fromJson(Map<String, dynamic> json) => Df(
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
