import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:toy/tool/about/view.dart';
import 'package:toy/tool/str/view.dart';

class ToolState {
  var selectedIndex = 0.obs;
  ToolState() {
    ///Initialize variables
  }

  final List<ToolDto> tools = [
    ToolDto('字符串', StrPage(),icon: const Icon(Icons.text_fields_outlined,color: Colors.deepOrangeAccent,)),
    ToolDto('加密解密', StrPage(),icon: const Icon(Icons.lock_clock_outlined,color: Colors.purpleAccent,)),
    ToolDto('关于', AboutPage(),icon: const Icon(Icons.help_center_outlined,color: Colors.blue,)),
  ];
}


class ToolDto{
  // 标题
  String title;
  // 组件
  Widget widget;
  // Icon 可选
  Icon? icon;

  ToolDto(this.title, this.widget,{this.icon});
}