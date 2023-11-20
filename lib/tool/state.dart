import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy/tool/about/view.dart';
import 'package:toy/tool/doc/view.dart';
import 'package:toy/tool/flutter/view.dart';
import 'package:toy/tool/secret/view.dart';
import 'package:toy/tool/str/view.dart';

class ToolState {
  var selectedIndex = 0.obs;

  ToolState() {
    ///Initialize variables
  }

  final List<ToolDto> tools = [
    ToolDto('字符串', StrPage(),
        icon: const Icon(
          Icons.text_fields_outlined,
        )),
    ToolDto('密钥', SecretPage(),
        icon: const Icon(
          Icons.lock_clock_outlined,
        )),
    ToolDto('文档', DocPage(),
        icon: const Icon(
          Icons.document_scanner_outlined,
        )),
    ToolDto('Flutter', FlutterPage(),
        icon: const Icon(
          Icons.flutter_dash_outlined,
        )),
    ToolDto('关于', AboutPage(),
        icon: const Icon(
          Icons.help_outline_outlined,
        )),
  ];
}

class ToolDto {
  // 标题
  String title;

  // 组件
  Widget widget;

  // Icon 可选
  Icon? icon;

  ToolDto(this.title, this.widget, {this.icon});
}
