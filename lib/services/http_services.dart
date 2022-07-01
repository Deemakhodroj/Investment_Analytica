import 'dart:convert';
import 'package:http/http.dart';
import 'df.dart';

class HttpService {
  final String Data_URL = 'http://10.0.2.2:5000/';

  /* final String recommendation_URl = 'http://10.0.2.2:5000/recommendation/';
  final String frim_URL = 'http://10.0.2.2:5000/recommendationFirm/';
  final String high_URL = 'http://10.0.2.2:5000/high/';
  final String low_URL = 'http://10.0.2.2:5000/low/';
  final String name_URL = 'http://10.0.2.2:5000/names/';

  final String companies_value_URL = 'http://10.0.2.2:5000/values/';
  final String open_price_URL = 'http://10.0.2.2:5000/openPrice/';
  final String close_price_URL = 'http://10.0.2.2:5000/closePrice/';
  final String predicted_data_URL = 'http://10.0.2.2:5000/prediction/';
  final String title_URL = 'http://10.0.2.2:5000/titles/';
  final String link_URL = 'http://10.0.2.2:5000/links/';*/

  List<Df> parseData(String responseBody) {
    List<dynamic> parsed =
        json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Df>((json) => Df.fromJson(json)).toList();
  }

  Future<List<Df>> get_Data() async {
    Response res = await get(Uri.parse(Data_URL));

    if (res.statusCode == 200) {
      //print("Start!!!");
      print(res.body);
      print(parseData(res.body).length);
      return parseData(res.body);

      /*print("Start");
      print(res.body);
      dynamic data = json.decode(res.body);
      data = data.map((dynamic item) => Df.fromJson(item));
      /* data = data["symbols"];

      Future<Map<String, dynamic>> posts = data.toString();
              /*.replaceAll(":", "").replaceAll(",", "").split("\\\"");*/
      print(posts.length);
      print(posts[0]);
      print(posts[1]);
      print(posts.length);*/

      return data;*/
    } else {
      throw "Unable to retrieve posts.";
    }
  }
/*
  Future<List<Df>> get_companies_value() async {
    Response res = await get(Uri.parse(companies_value_URL));

    if (res.statusCode == 200) {
      /*List<Map<String, dynamic>> body = jsonDecode(res.body);
      List<Df> posts = body.map((dynamic item) => Df.fromJson(item)).toList();*/
      dynamic data = json.decode(res.body);
      data = data.map((dynamic item) => Df.fromJson(item));
      return data;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<Map<String, dynamic>> get_open_price() async {
    Response res = await get(Uri.parse(open_price_URL));

    if (res.statusCode == 200) {
      /*List<dynamic> body = jsonDecode(res.body);

      List<Df> posts = body.map((dynamic item) => Df.fromJson(item)).toList();*/
      dynamic data = json.decode(res.body);
      data = data.map((dynamic item) => Df.fromJson(item));
      return data;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<Map<String, dynamic>> get_close_price() async {
    Response res = await get(Uri.parse(close_price_URL));

    if (res.statusCode == 200) {
      /*List<dynamic> body = jsonDecode(res.body);

      List<Df> posts = body.map((dynamic item) => Df.fromJson(item)).toList();*/
      dynamic data = json.decode(res.body);
      data = data.map((dynamic item) async => Df.fromJson(item));
      return data;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<Map<String, dynamic>> get_predicted_data() async {
    Response res = await get(Uri.parse(predicted_data_URL));

    if (res.statusCode == 200) {
      /*List<dynamic> body = jsonDecode(res.body);

      List<Df> posts = body.map((dynamic item) => Df.fromJson(item)).toList();*/
      dynamic data = json.decode(res.body);
      return data;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<Map<String, dynamic>> get_title() async {
    Response res = await get(Uri.parse(title_URL));

    if (res.statusCode == 200) {
      /*List<dynamic> body = jsonDecode(res.body);

      List<Df> posts = body.map((dynamic item) => Df.fromJson(item)).toList();*/
      dynamic data = json.decode(res.body);
      data = data.map((dynamic item) => Df.fromJson(item));
      return data;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<Map<String, dynamic>> get_link_URL() async {
    Response res = await get(Uri.parse(link_URL));

    if (res.statusCode == 200) {
      /*List<dynamic> body = jsonDecode(res.body);

      List<Df> posts = body.map((dynamic item) => Df.fromJson(item)).toList();*/
      dynamic data = json.decode(res.body);
      data = data.map((dynamic item) => Df.fromJson(item));
      return data;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<Map<String, dynamic>> get_name() async {
    Response res = await get(Uri.parse(name_URL));

    if (res.statusCode == 200) {
      /*List<dynamic> body = jsonDecode(res.body);

      List<Df> posts = body.map((dynamic item) => Df.fromJson(item)).toList();*/
      dynamic data = json.decode(res.body);
      data = data.map((dynamic item) => Df.fromJson(item));
      return data;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<Map<String, dynamic>> get_high() async {
    Response res = await get(Uri.parse(high_URL));

    if (res.statusCode == 200) {
      /*List<dynamic> body = jsonDecode(res.body);

      List<Df> posts = body.map((dynamic item) => Df.fromJson(item)).toList();*/
      dynamic data = json.decode(res.body);
      data = data.map((dynamic item) => Df.fromJson(item));
      return data;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<Map<String, dynamic>> get_low() async {
    Response res = await get(Uri.parse(low_URL));

    if (res.statusCode == 200) {
      /*List<dynamic> body = jsonDecode(res.body);

      List<Df> posts = body.map((dynamic item) => Df.fromJson(item)).toList();*/
      dynamic data = json.decode(res.body);
      data = data.map((dynamic item) => Df.fromJson(item));
      return data;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<Map<String, dynamic>> get_recommendation() async {
    Response res = await get(Uri.parse(recommendation_URl));

    if (res.statusCode == 200) {
      /* List<dynamic> body = jsonDecode(res.body);

      List<Df> posts = body.map((dynamic item) => Df.fromJson(item)).toList();*/

      dynamic data = json.decode(res.body);
      data = data.map((dynamic item) => Df.fromJson(item));
      return data;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<Map<String, dynamic>> get_frim() async {
    Response res = await get(Uri.parse(frim_URL));

    if (res.statusCode == 200) {
      /* List<dynamic> body = jsonDecode(res.body);

      List<Df> posts = body.map((dynamic item) => Df.fromJson(item)).toList();*/
      dynamic data = json.decode(res.body);
      data = data.map((dynamic item) => Df.fromJson(item));
      return data;
    } else {
      throw "Unable to retrieve posts.";
    }
  }*/
}
