import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class DataMg {
  double x;
  double y;
  static const String _key = "data";
  DataMg({this.y = 0,this.x = 0});

  static Future<DataMg> get() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var string = prefs.getString(_key);
    return string == null ? DataMg() : DataMg.fromJson(json.decode(string));
  }

  void save() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, json.encode(toJson()));
    await prefs.reload();
  }

  // json
  factory DataMg.fromJson(Map<String, dynamic> json) {
    return DataMg(
      x: json['x'],
      y: json['y'],
    );
  }
  // toJson
  Map<String, dynamic> toJson() => {
    'x': x,
    'y': y,
  };

  @override
  String toString() {
    return 'DataMg{x: $x, y: $y}';
  }


}


