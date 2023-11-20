import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class StrState {
  var randomStrController = TextEditingController(text: "32");

  var strController = TextEditingController();

  var str1Controller = TextEditingController();

  var strLenController = TextEditingController();
  var strLen = 0.obs;

  StrState() {
    ///Initialize variables
    randomStrController.addListener(() {
      randomStr();
    });
    randomStr();
    strLenController.addListener(() {
      strLen.value = strLenController.text.length;
    });
  }

  void randomStr() {
    var length = int.tryParse(randomStrController.text) ?? 0;
    if (length > 0) {
      var str = '';
      for (var i = 0; i < length; i++) {
        // 随机生成一个大小写字母数字
        var random = Random().nextInt(random26UpperLower.length);
        str += random26UpperLower[random];
      }
      strController.text = str;
    } else {
      strController.text = '';
    }
  }

  // 获取随机26个字母 a-z
  String get random26 {
    var str = '';
    for (var i = 0; i < 26; i++) {
      str += String.fromCharCode(97 + i);
    }
    return str;
  }

  // 获取随机26个字母 A-Z
  String get random26Upper {
    return random26.toUpperCase();
  }

  // 获取随机数字 0-9
  String get random10 {
    var str = '';
    for (var i = 0; i < 10; i++) {
      str += String.fromCharCode(48 + i);
    }
    return str;
  }

  // 组合随机字符串
  String get randomAll {
    return random26 + random26Upper + random10;
  }

  // 大小字符串
  String get random26UpperLower {
    return random26Upper + random26;
  }
}

