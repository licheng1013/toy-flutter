
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy/common/data.dart';

class ThemeUi{
  static const Color primaryColor = Color(0xFF0D47A1);

  static  ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily:  "NotoSansSC",
  );

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily:  "NotoSansSC"
  );


  static void initTheme() async {
    var config = await DataMg.get();
    Get.changeThemeMode(ThemeMode.light);
    Get.changeTheme(config.themeType == 1 ? ThemeUi.light : ThemeUi.dark);
  }
}